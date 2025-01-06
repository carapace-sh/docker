$env.config = {
    show_banner: false,
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
        external: {
            enable: true
            max_results: 1000
        }
        use_ls_colors: true
    }

    menus: [
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20
                col_padding: 2
            }
            style: {
                text: white
                selected_text: {attr: r}
                description_text: white_dimmed
            }
        }
    ]
}

use ~/.cache/starship/init.nu
