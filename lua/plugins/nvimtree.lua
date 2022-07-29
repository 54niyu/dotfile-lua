return function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    local list = {
        { key = { "<CR>", "o", "<2-LeftMouse>", "l" }, cb = tree_cb("edit") },
        { key = { "<2-RightMouse>", "<C-}>" }, cb = tree_cb("cd") },
        { key = "<C-v>", cb = tree_cb("vsplit") },
        { key = "<C-x>", cb = tree_cb("split") },
        { key = "<C-t>", cb = tree_cb("tabnew") },
        { key = "<", cb = tree_cb("prev_sibling") },
        { key = ">", cb = tree_cb("next_sibling") },
        { key = "P", cb = tree_cb("parent_node") },
        { key = "<BS>", cb = tree_cb("close_node") },
        { key = "<S-CR>", cb = tree_cb("close_node") },
        { key = "<Tab>", cb = tree_cb("preview") },
        { key = "K", cb = tree_cb("first_sibling") },
        { key = "J", cb = tree_cb("last_sibling") },
        { key = "I", cb = tree_cb("toggle_ignored") },
        { key = "H", cb = tree_cb("toggle_dotfiles") },
        { key = "R", cb = tree_cb("refresh") },
        { key = "a", cb = tree_cb("create") },
        { key = "d", cb = tree_cb("remove") },
        { key = "r", cb = tree_cb("rename") },
        { key = "<C->", cb = tree_cb("full_rename") },
        { key = "x", cb = tree_cb("cut") },
        { key = "c", cb = tree_cb("copy") },
        { key = "p", cb = tree_cb("paste") },
        { key = "y", cb = tree_cb("copy_name") },
        { key = "Y", cb = tree_cb("copy_path") },
        { key = "gy", cb = tree_cb("copy_absolute_path") },
        { key = "[c", cb = tree_cb("prev_git_item") },
        { key = "}c", cb = tree_cb("next_git_item") },
        { key = "-", cb = tree_cb("dir_up") },
        { key = "q", cb = tree_cb("close") },
        { key = "g?", cb = tree_cb("toggle_help") },
    }

    -- following options are the default
    require("nvim-tree").setup({

        filters = {
            dotfiles = false,
            -- exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
        },
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = { "alpha" },
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            adaptive_size = true,
            side = "left",
            width = 25,
            hide_root_folder = true,
            mappings = {
                custom_only = false,
                list = list,
            },
        },
        git = {
            enable = false,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
        },
        renderer = {
            highlight_git = false,
            highlight_opened_files = "none",

            indent_markers = {
                enable = false,
            },

            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },

                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                        symlink_open = "",
                        arrow_open = "",
                        arrow_closed = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },

        -- auto_reload_on_write = true,
        -- disable_netrw = false,
        -- -- hide_root_folder = false,
        -- hijack_cursor = false,
        -- hijack_netrw = true,
        -- hijack_unnamed_buffer_when_opening = false,
        -- ignore_buffer_on_setup = false,
        -- open_on_setup = false,
        -- open_on_setup_file = false,
        -- open_on_tab = false,
        -- sort_by = "name",
        -- update_cwd = false,
        -- view = {
        -- 	width = 30,
        -- 	height = 30,
        -- 	side = "left",
        -- 	preserve_window_proportions = false,
        -- 	number = false,
        -- 	relativenumber = false,
        -- 	signcolumn = "yes",
        -- 	mappings = {
        -- 		custom_only = false,
        -- 		list = list,
        -- 	},
        -- },
        -- renderer = {
        -- 	indent_markers = {
        -- 		enable = false,
        -- 		icons = {
        -- 			corner = "└ ",
        -- 			edge = "│ ",
        -- 			none = "  ",
        -- 		},
        -- 	},
        -- 	icons = {
        -- 		webdev_colors = true,
        -- 	},
        -- },
        -- hijack_directories = {
        -- 	enable = true,
        -- 	auto_open = true,
        -- },
        -- update_focused_file = {
        -- 	enable = false,
        -- 	update_cwd = false,
        -- 	ignore_list = {},
        -- },
        -- ignore_ft_on_setup = {},
        -- system_open = {
        -- 	cmd = nil,
        -- 	args = {},
        -- },
        -- diagnostics = {
        -- 	enable = false,
        -- 	show_on_dirs = false,
        -- 	icons = {
        -- 		hint = "",
        -- 		info = "",
        -- 		warning = "",
        -- 		error = "",
        -- 	},
        -- },
        -- filters = {
        -- 	dotfiles = false,
        -- 	custom = {},
        -- 	exclude = {},
        -- },
        -- git = {
        -- 	enable = true,
        -- 	ignore = true,
        -- 	timeout = 400,
        -- },
        -- actions = {
        -- 	use_system_clipboard = true,
        -- 	change_dir = {
        -- 		enable = true,
        -- 		global = false,
        -- 	},
        -- 	open_file = {
        -- 		quit_on_open = false,
        -- 		resize_window = false,
        -- 		window_picker = {
        -- 			enable = true,
        -- 			chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        -- 			exclude = {
        -- 				filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
        -- 				buftype = { "nofile", "terminal", "help" },
        -- 			},
        -- 		},
        -- 	},
        -- },
        -- trash = {
        -- 	cmd = "trash",
        -- 	require_confirm = true,
        -- },
        -- log = {
        -- 	enable = false,
        -- 	truncate = false,
        -- 	types = {
        -- 		all = false,
        -- 		config = false,
        -- 		copy_paste = false,
        -- 		diagnostics = false,
        -- 		git = false,
        -- 		profile = false,
        -- 	},
        -- },
    })
end
