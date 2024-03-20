return {{
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        alpha.setup(require'alpha.themes.startify'.config)
        local dashboard = require("alpha.themes.dashboard")

        local header_acid = {
            " ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·. ",
            "•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪",
            "▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·",
            "██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌",
            "▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀",
        }
        local header_block = {
            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }
        local header_drip = {
            "███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
            "██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
            "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
            "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
            "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
            "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
            "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
            "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
            "         ░    ░  ░    ░ ░        ░   ░         ░   ",
            "                                ░                  ",
        }
        local header_meow = {
            [[                                   (_)              |\      _,,,---,,_     ]],
            [[ _ __ ___   ___  _____     __   ___ _ __ ___   ZZzz /,`.-'`'    -.  ;-;;,_]],
            [[| '_ ` _ \ / _ \/ _ \ \ /\ \ \ / / | '_ ` _ \     |,4-  ) )-,_. ,\ (  `'-']],
            [[| | | | | |  __/ (_) \ V  V \ V /| | | | | | |   '---''(_/--'  `-'\_)     ]],
            [[|_| |_| |_|\___|\___/ \_/\_/ \_/ |_|_| |_| |_|                            ]],
        }

        -- Set header
        dashboard.section.header.val = header_meow
        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "h", "󰛢  > Harpoon" , "<leader>h"),
            dashboard.button( "e", "󰥨  > File explorer", "<leader>e"),
            dashboard.button( "f", "󰱼  > Fuzzy finder"   , "<leader>f"),
            dashboard.button( "c", "  > Config" , "<leader>c"),
            --dashboard.button( "t", "  > Terminal" , "<S-T>"),
            dashboard.button( "q", "󰗼  > Quit NVIM", ":qa<CR>"),
        }

        dashboard.section.footer.val = "Rest in peace Bram Moolenaar // 1961 - 2023"

        -- Set footer
        --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
        --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
        --   ```init.lua
        --   return require('packer').startup(function()
        --       use 'wbthomason/packer.nvim'
        --       use {
        --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
        --           requires = {'BlakeJC94/alpha-nvim-fortune'},
        --           config = function() require("config.alpha") end
        --       }
        --   end)
        --   ```
        -- local fortune = require("alpha.fortune")
        -- dashboard.section.footer.val = fortune()

        -- Send config to alpha
        alpha.setup(dashboard.opts)
    end
}}
