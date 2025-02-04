return {
    -- UI
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvchad/ui",
    "nvchad/volt",
    { "nvchad/base46", build = function() require("base46").load_all_highlights() end },

    -- indent
    "lukas-reineke/indent-blankline.nvim",

    -- yazi
    {
        "mikavilpas/yazi.nvim",
        cmd = "Yazi",
        opts = {
            floating_window_scaling_factor = 0.8,
        },
    },

    -- session
    {
        "rmagatti/auto-session",
        cmd = "SessionRestore",
    },

    -- treesitter
    "nvim-treesitter/nvim-treesitter",

    -- motion
    "ggandor/leap.nvim",
    "tpope/vim-repeat",
    "windwp/nvim-autopairs",

    -- fzf-lua
    {
        "ibhagwan/fzf-lua",
        opts = {},
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = require("opts.gitsigns")
    },

    -- formatter
    {
        "stevearc/conform.nvim",
        event = { "User FilePost" },
        opts = require("opts.conform"),
        config = require("configs.conform"),
    },

    -- lsp
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall" },
        config = function()
            dofile(vim.g.base46_cache .. "mason")
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = require("configs.lspconfig"),
    },

    {
        "saghen/blink.cmp",
        version = "*",
        config = function(_, opts)
            opts = opts or {}
            dofile(vim.g.base46_cache .. "cmp")
            require("blink.cmp").setup(opts)
        end,
        opts = require("opts.blink"),
    },
    "L3MON4D3/LuaSnip",
    "fang2hou/blink-copilot",
    {
        "github/copilot.vim",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "BufWinEnter",
        init = function()
            vim.g.copilot_no_maps = true
        end,
        config = function()
            -- Block the normal Copilot suggestions
            vim.api.nvim_create_augroup("github_copilot", { clear = true })
            for _, event in pairs({ "FileType", "BufUnload", "BufEnter" }) do
                vim.api.nvim_create_autocmd({ event }, {
                    group = "github_copilot",
                    callback = function()
                        vim.fn["copilot#On" .. event]()
                    end,
                })
            end
        end,
    },
}
