# AGENTS.md

This repository builds the Docker images for the [carapace-sh](https://github.com/carapace-sh) organization. It contains no application source code, only Dockerfiles, shell rc/config files, and GitHub Actions. The images are used to test carapace's shell completion across shells and to build its documentation.

## Commands

```sh
docker compose build base              # build a single image
docker compose build mdbook shell-*    # build several (CI order matters, see below)
docker compose run --rm shell-zsh      # try a shell image interactively
```

There is no test suite. Verification is: the image builds, and the shell in it starts and behaves as expected. CI (`.github/workflows/docker.yml`) builds in strict dependency order on every push/PR:

1. `base`
2. `mdbook shell-*`
3. `dev`
4. `vhs`

Images are pushed to `ghcr.io/carapace-sh/<service>` only for `master` and tag pushes: `latest` for master, or the git tag name otherwise.

## Image dependency graph

Everything is layered via Docker `FROM`/`COPY --from` on `ghcr.io/carapace-sh/<name>`:

```
base ──► mdbook
     ├─► shell-bash-ble, shell-cmd, shell-elvish, shell-fish,
     │   shell-nushell, shell-oil, shell-powershell, shell-tcsh,
     │   shell-xonsh, shell-zsh
     └─► dev ──► vhs
```

- `base`: debian:bookworm-slim + starship, `LS_COLORS`, `PATH` with `/root/go/bin:/github/home/go/bin`, and the `entrypoint.sh` ENTRYPOINT.
- `dev`: aggregates **binaries and rc/config dirs from all shell images** via `COPY --from=ghcr.io/carapace-sh/shell-* ...`, plus Go and wine/cmd.
- `vhs`: dev + ttyd, chromium-headless-shell, and the [rsteube/vhs](https://github.com/rsteube/vhs) fork (not upstream charmbracelet/vhs).

**Important:** because `dev` copies rc files from the shell images, changing any shell rc file requires rebuilding that shell image *and then* `dev` (and `vhs`) for the change to appear there. The compose image names (`ghcr.io/carapace-sh/...`) must match what the `COPY --from` references reference, so don't rename services/images casually.

## Key mechanism: RC_* environment variables

`base/entrypoint.sh` appends the value of `RC_<SHELL>` environment variables to the corresponding init file at container start:

| Env var | Appended to |
| --- | --- |
| `RC_BASH` | `/root/.bashrc` |
| `RC_BASH_BLE` | `/root/.config/bash-ble/blerc` |
| `RC_ELVISH` | `/root/.config/elvish/rc.elv` |
| `RC_FISH` | `/root/.config/fish/config.fish` |
| `RC_NUSHELL` | `/root/.config/nushell/config.nu` |
| `RC_NUSHELL_ENV` | `/root/.config/nushell/env.nu` |
| `RC_OIL` | `/root/.config/oils/oshrc` |
| `RC_POWERSHELL` | `/root/.config/powershell/profile.ps1` |
| `RC_TCSH` | `/root/.tcshrc` |
| `RC_XONSH` | `/root/.config/xonsh/rc.xsh` |
| `RC_ZSH` | `/root/.zshrc` |

This is how carapace's test setup injects shell-specific init snippets (e.g. `source <(carapace _carapace)` hooks) into containers at runtime without baking them into the images. Empty/unset variables append nothing.

## Repository layout and conventions

- One directory per image: `<name>/Dockerfile` plus exactly the rc/config file(s) that image needs (e.g. `shell-zsh/zshrc.sh`). `compose.yaml` mirrors the directory names as services.
- Shell versions are pinned via `ARG version=...` in each Dockerfile; dependency updates come as "updated versions" commits touching multiple Dockerfiles at once. `dev` also pins its Go version inline.
- RC files install the [starship](https://starship.rs) prompt in every shell. Some shells need explicit setup that others don't — e.g. zsh needs `STARSHIP_SHELL=zsh` exported before `eval`, nushell writes its init to `~/.cache/starship/init.nu` (created by `env.nu`), oil uses `PS1="$(starship prompt)"`.
- Two-stage builds are used when compilation is required: `shell-bash-ble` builds ble.sh from git in stage one, `shell-oil` compiles oils-for-unix. Both then `COPY --from` the artifacts into a fresh `base` stage.
- `shell-cmd` runs Windows `cmd.exe` through wine; `dev` runs `cmd /c echo` during build to initialize the wine prefix and duplicates the `WINEDEBUG`/`WINEPREFIX` env vars.
- `dev` sets `git config --system safe.directory '*'` (the repo will be bind-mounted and would otherwise hit dubious-ownership errors); `mdbook` does the same.

## Gotchas

- Every `RUN apt-get update` is paired with an immediate `apt-get install` in the same layer; follow this pattern (the base image doesn't cache apt lists).
- Tool downloads use `curl -L <tarball> | tar -xz` directly from GitHub releases with x86_64 binaries only — no multi-arch support.
- `base/Dockerfile` contains a very long single-line `LS_COLORS` ENV; don't reformat or wrap it.
- The `bash-ble` image doesn't run bash directly: `/usr/local/bin/bash-ble` is a wrapper that launches `bash --rcfile ~/.config/bash-ble/blerc`, and `blerc` sources `~/.bashrc` (for starship) *then* ble.sh. Order matters.
- `shell-cmd`'s Dockerfile requires the wine prefix initialization step (`cmd /c echo`) to succeed at build time or the image fails.
- Dependabot here only manages GitHub Actions (`.github/dependabot.yml`); Dockerfile tool versions are updated manually.
- `vhs` clones its source at build time (network access required at build, not just for downloads).
