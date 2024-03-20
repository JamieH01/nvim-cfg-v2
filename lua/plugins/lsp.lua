local core = {
    {
        'VonHeikemen/lsp-zero.nvim', 
        branch = 'v3.x',
        config = setup, 
    },
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
}

local extentions = {
    'L3MON4D3/LuaSnip',
    'alaviss/tree-sitter-nim',
    'simrat39/rust-tools.nvim',
    'p00f/clangd_extensions.nvim',

    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    }
}

function setup ()
    local lsp_zero = require('lsp-zero')
    local nvim_lsp = require('lspconfig')

    lsp_zero.preset("recommended")

    --this needs to go BEFORE RA or itll overwrite the config :/
    require("rust-tools").setup()

    nvim_lsp.rust_analyzer.setup {
        on_attach=(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end),
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    features = "all"
                },
            },
        },
    }

    lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
    end)


    lsp_zero.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        info = "",
    })
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        end,
    })


    local cmp = require('cmp')
    cmp.setup({
        sources = {
            {name = 'nvim_lsp'},
        },
        mapping = {
            ['<C-y>'] = cmp.mapping.confirm({select = false}),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
            ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
            ['<C-p>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item({behavior = 'insert'})
                else
                    cmp.complete()
                end
            end),
            ['<C-n>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item({behavior = 'insert'})
                else
                    cmp.complete()
                end
            end),
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
    })


    --DEAR FUTURE JAMIE:
    --you may need to add the lsp to this list to enable it
    --sometimes LspInstall wont work
    --we both know youll forget again
    lsp_zero.setup_servers({'rust_analyzer', 'clangd', 'gopls', 'nimls'})

    require "nvim-treesitter.configs".setup {
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "plsql" }, -- list of language that will be disabled
        },
    }

    lsp_zero.setup()
end

return {core,  extentions}
