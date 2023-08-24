vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,trail:·"
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false
vim.cmd "set diffopt+=vertical,followwrap"
vim.cmd "set nowrap"
vim.cmd "set tags=tags"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.exrc = true
vim.opt.background = "dark"

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set('', '//', '<cmd>nohlsearch<cr>')
vim.keymap.set('', '__', '<cmd>split<cr>')
vim.keymap.set('', '++', '<cmd>vs<cr>')
vim.keymap.set('', '((', '<cmd>vertical resize 100000<cr>')
vim.keymap.set('', '))', '<cmd>res 100000<cr>')
vim.keymap.set('', '()', '<cmd>wincmd =<cr>')
vim.keymap.set('', '<leader>ws', '<cmd>%s/\\s\\+$//<CR>')
vim.keymap.set('', '!', '<cmd>tab split<CR> <cmd>Startify<CR>')
vim.keymap.set('', '\\', '<cmd>tabn<CR>')
vim.keymap.set('', '<leader>n', '<cmd>cn<CR>')
vim.keymap.set('', '<leader>m', '<cmd>cp<CR>')

vim.keymap.set('', 'Y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'P', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '*', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>f', 'y/<C-R>"<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true })
vim.api.nvim_set_keymap('i', '<expr><s-tab>', 'pumvisible() ? "<C-p>" : "<TAB>"', { expr = true })

vim.cmd([[
augroup VerticalSplitBorder
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * if winnr('$') > 1 | set signcolumn=yes | else | set signcolumn=no | endif
  autocmd WinLeave * set signcolumn=yes
augroup END
]])

vim.cmd([[
sign define vertical_border text=│ texthl=VertSplitBorder
highlight VertSplitBorder gui=NONE guifg=#000000
]])


-- return to last file position.
vim.cmd [[
 autocmd BufRead * autocmd FileType <buffer> ++once
 \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
 ]]

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins.
require("lazy").setup({
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
      vim.keymap.set("n", "<Leader>q", ":ChatGPT<CR>", { silent = true, desc = "Inline GPT" })
      vim.keymap.set("n", "<Leader>Q", ":ChatGPTActAs<CR>", { silent = true, desc = "Inline gpt with context" })
      vim.keymap.set("v", "<Leader>q", ":ChatGPTRun ", { silent = false, desc = "Run gpt cmd" })
      vim.keymap.set("v", "<Leader>Q", ":ChatGPTEditWithInstructions ", { silent = false, desc = "Run gpt cmd" })
    end,

    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },

    config = function()
      require('lualine').setup {
        options = {
          theme = {
            visual = {
              c = {
                bg = '#1abc9c',
              },
            },
            insert = {
              c = {
                bg = '#3498db',
              },
            },
            normal = {
              c = {
                bg = '#34495e',
              },
            },
          },
        },
        sections = {

          lualine_x = { 'encoding', 'fileformat', 'filetype', 'filename' },
          lualine_c = {
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return require("nvim-navic").is_available()
              end
            },
          }
        }
      }
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        auto_install = true,
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
        },
        matchup = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup {}
    end,
  },

  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
      vim.keymap.set("", "<leader>t", "<cmd>SymbolsOutline<cr>", { desc = "toggle mundo ting" })
    end,

  },
  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.keymap.set("", "<leader>z", "<cmd>MundoToggle<cr>", { desc = "toggle mundo ting" })
    end,

  },
  {
    -- 'phaazon/hop.nvim',
    'thisduck/hop.nvim',
    config = function()
      require 'hop'.setup {}
      vim.keymap.set("", "<leader><leader>w", "<cmd>HopWord<cr>", { desc = "Hop word" })
      vim.keymap.set("", "<leader><leader>b", "<cmd>HopWord<cr>", { desc = "Hop line (below cursor)" })
    end
  },
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local actions = require "telescope.actions"
      require 'telescope'.setup {
        defaults = require("telescope.themes").get_ivy {
          mappings = {
            n = {
              -- ["<CR>"] = require('telescope.actions').select_default,
              ['<C-CR>'] = actions.smart_add_to_qflist + actions.open_qflist,
            },
            i = {
              ['<C-CR>'] = actions.smart_add_to_qflist + actions.open_qflist,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },

        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      }

      require("telescope").load_extension "fzf"

      vim.keymap.set('n', '<leader><Tab>', [[<cmd>Telescope find_files<cr>]], { desc = 'Find files in project' })
      -- vim.keymap.set('n', '',
      --   [[<cmd>lua require'telescope.builtin'.grep_string({ search = vim.fn.input('Search: ') })<cr>]],
      --   { desc = 'Search in project' })

      vim.keymap.set('n', '<leader><leader><Tab>', [[:Search<space>]], { desc = "Search in project" })
      vim.keymap.set('n', '<C-S-f>', [[<cmd>Telescope grep_string<cr>]], { desc = 'Search word under cursor' })
      vim.keymap.set('n', '<C-f>', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],
        { desc = 'Search in current file' })

      vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]]
      vim.api.nvim_create_user_command("Search", function(opts)
        require("telescope.builtin").grep_string { search = opts.args }
      end, { nargs = 1 })
    end
  },
  {
    "airblade/vim-rooter",
    config = function()
      vim.cmd [[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]
    end,
  },
  {
    'mhinz/vim-startify',
    config = function()
      vim.g.startify_session_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/")

      vim.cmd [[
      let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
      ]]
    end
  },
  {
    "scrooloose/nerdtree",
    dependencies = {
      "xuyuanp/nerdtree-git-plugin",
      "MunifTanjim/nui.nvim",
      { "s1n7ax/nvim-window-picker", opts = {} },
    },
    config = function()
      vim.keymap.set("n", "<leader><leader><leader>", "<cmd>NERDTreeFind<CR>:vertical resize 30<CR>",
        { desc = "File tree for filesystem" })
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.keymap.set("n", "<C-k>", "<cmd>MatchupWhereAmI?<cr>")
      vim.keymap.set('', '<C-S-k>', '[%', { remap = true, silent = true })
      vim.keymap.set('', '<C-S-j>', ']%', { remap = true, silent = true })
    end,
  },
  {
    "tpope/vim-commentary",
    config = function()
      vim.keymap.set('', '<leader>c<leader>', 'gcc', { remap = true, silent = true })
      vim.keymap.set('', '<C-.>', 'gcc', { remap = true, silent = true })
    end,
  },

  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'SmiteshP/nvim-navic',
    },
    config = function()
      vim.diagnostic.config {
        virtual_text = {
          source = "always",
        },
        float = {
          source = "always",
          border = "rounded",
        },
      }

      local servers = {
        pylsp = {},
        ansiblels = {},
        awk_ls = {},
        bashls = {},
        clangd = {},
        cssls = {},
        cssmodules_ls = {},
        cucumber_language_server = {},
        docker_compose_language_service = {},
        dockerls = {},
        eslint = {
          formatting = true,
        },
        graphql = {},
        gopls = {},
        html = {},
        jsonls = {},
        tsserver = {
          formatting = false,
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = { checkThirdParty = false },
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
        intelephense = {},
        perlnavigator = {},
        prismals = {},
        solargraph = {},
        rust_analyzer = {},
        sqlls = {},
        sorbet = {},
        svelte = {},
        taplo = {},
        tailwindcss = {},
        vimls = {},
        volar = {},
        yamlls = {},
      }

      require('lsp-setup').setup({
        default_mappings = false,
        mappings = {
          gD = "<cmd>lua vim.lsp.buf.declaration()<cr>",
          gd = "<cmd>Telescope lsp_definitions<cr>",
          gt = "<cmd>Telescope lsp_type_definitions<cr>",
          gi = "<cmd>Telescope lsp_implementations<cr>",

          F = "<cmd>Telescope lsp_references<cr>",
          L = "<cmd>lua vim.lsp.buf.hover({ border = 'single'})<cr>",

          ["<leader>sh"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
          ["<Leader>cw"] = "<cmd>lua vim.lsp.buf.rename()<cr>",
          ["<Leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<cr>",

          ["[d"] = '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<cr>',
          ["]d"] = '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<cr>',
        },
        servers = servers,
        on_attach = function(client, bufnr)
          local formatting = servers[client.name].formatting
          local formatting_is_empty = formatting == nil or formatting == ""

          if not formatting_is_empty then
            client.server_capabilities.documentFormattingProvider = formatting
            client.server_capabilities.documentRangeFormattingProvider = formatting
          end

          local navic = require("nvim-navic")
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end

          if vim.lsp.buf.range_code_action then
            vim.keymap.set(
              "v",
              "<Leader>ca",
              vim.lsp.buf.range_code_action,
              { noremap = true, silent = true, buffer = bufnr }
            )
          end
        end,
      })
      vim.g.local_auto_format = true
      vim.api.nvim_create_user_command("AutoFormatDisable", function()
        vim.g.local_auto_format = false
      end, { nargs = 0 })
      vim.api.nvim_create_user_command("AutoFormatEnable", function()
        vim.g.local_auto_format = true
      end, { nargs = 0 })

      local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_format_augroup,
        callback = function()
          if vim.g.local_auto_format then
            vim.lsp.buf.format({ timeout_ms = 2000 })
          end
        end,
      })
    end
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          format = {
            cmdline = { icon = "", conceal = false },
            search_down = { icon = "", conceal = false },
            search_up = { icon = "", conceal = false },
            filter = { icon = "", conceal = false },
            lua = { icon = "", conceal = false },
            help = { icon = "", conceal = false },
            input = {},
          }
        },
        messages = {
          enabled = false,
        },
        notify = {
          enabled = false,
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      require("null-ls").setup {
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettier.with {
            filetypes = {
              "markdown",
              "yaml",
            },
          },
        },
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-rg",
      "quangnguyen30192/cmp-nvim-tags",
      "andersevenrud/cmp-tmux",
      "onsails/lspkind.nvim",
      "petertriho/cmp-git",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      vim.cmd([[set completeopt=menu,menuone,noselect]])

      local lspkind = require('lspkind')
      local cmp = require("cmp")
      if not cmp then
        return
      end

      local luasnip = require("luasnip")
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp_all_buffers = {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        }
      }

      local pattern = [[[\w_-]{5,60}]]


      cmp.setup({
        completion = {
          keyword_length = 2,
        },
      formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function (entry, vim_item)
              return vim_item
            end
          })
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),

          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<S-CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp",               priority = 100 },
          { name = "luasnip",                priority = 100 },
          { name = "nvim_lsp_signature_help" },
          cmp_all_buffers,
          { name = "path" },
          { name = "tags" },
          { name = "treesitter" },
          { name = "rg",        option = { pattern = pattern } },
          {
            name = "tmux",
            option = {
              all_panes = true,
              keyword_pattern = pattern
            }
          },
        }),
      })

      require("cmp_git").setup()
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
          cmp_all_buffers,
        }),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline", priority = 100 },
          { name = "tags" },
          cmp_all_buffers,
          { name = "rg", option = { pattern = pattern } },
        }),
      })

      require("luasnip").filetype_extend("ruby", { "rails" })
      -- require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]
    end,
  },

  { "lewis6991/gitsigns.nvim" },

  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb"
    },
    config = function()
      vim.keymap.set("n", "<Leader>s", ":10split<Bar>0Git<CR>", { silent = true, desc = "Git status" })
      vim.keymap.set("n", "<Leader>g", ":Git<CR>", { silent = true, desc = "Git" })
      vim.keymap.set("n", "<Leader>h", ":Git log<CR>", { silent = true, desc = "Git log" })
      vim.keymap.set("n", "<Leader>d", ":Git diff<CR>", { silent = true, desc = "Git diff" })
      vim.keymap.set("n", "<Leader>b", ":Git blame<CR>", { silent = true, desc = "Git blame" })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup { open_mapping = [[<C-CR>]] }
      vim.cmd [[tnoremap <silent>jj <C-\><C-n>]]
      vim.cmd [[tnoremap <silent><C-k> <C-\><C-n><C-w>k]]
    end,
  },
  "tpope/vim-unimpaired",
  'terryma/vim-multiple-cursors',
  'MattesGroeger/vim-bookmarks'
})


vim.cmd("colorscheme onedark")
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.g.bookmark_sign = '#'

vim.cmd "AutoFormatDisable"
