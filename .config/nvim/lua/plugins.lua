local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when saving plugins.lua

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use {
	  'kabouzeid/nvim-lspinstall',
	  config = function()
      require'lspinstall'.setup() -- important

      local function setup_servers()
        require'lspinstall'.setup()

        local installed_servers = require'lspinstall'.installed_servers()
        for _, server in pairs(installed_servers) do
          require'lspconfig'[server].setup{}
        end

        --#no-lsp comment dart javascript jsdoc regex swift toml tsx
      
        --[[ #install-me "bash",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "java",
        "json",
        "lua",
        "php",
        "python",
        "ruby",
        "rust",
        "svelte",
        "typescript",
        "vue",
        "yaml" ]]
      end

      setup_servers()
    end,
    event = 'BufRead',
    requires = {'neovim/nvim-lspconfig'},
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = { }, -- List of parsers to ignore installing
        highlight = {
          enable = true,              -- false will disable the whole extension
          disable = { },  -- list of language that will be disabled
        },
      }
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      local saga = require 'lspsaga'
      saga.init_lsp_saga()
    end,
    event = 'BufRead'
  } -- native LSP pimped
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
      vim.g.nvim_tree_gitignore = 1
      vim.g.nvim_tree_auto_close = 1
      vim.g.nvim_tree_update_cwd = 1
      vim.g.nvim_tree_disable_netrw = 1
      vim.g.nvim_tree_auto_open = 1
    end
  } -- File browser
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require'compe'.setup {
        enabled = true;
         autocomplete = true;
        debug = false;
        map_cr = true, --  map <CR> on insert mode
        map_complete = true;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;
        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          vsnip = true;
          ultisnips = true;
          luasnip = true;
        }
      }
    end,
    event = 'InsertEnter'
  } -- Completion
  use {'hrsh7th/vim-vsnip', event = 'InsertEnter'} -- VSCode LSP Snippet
  use {"rafamadriz/friendly-snippets", event = "InsertEnter"} -- Preconfigured snippets
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init({})
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = {'zt', 'zz', 'zb'}
      })
    end
  } -- Smooth scroll
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require('colorizer').setup()
      vim.cmd("ColorizerReloadAllBuffers")
    end,
    event = 'BufRead',
  } -- Add missing colors to LSP
  use 'norcalli/nvim-colorizer.lua' -- Colors highlight
  use {'michaelb/sniprun', run = 'bash ./install.sh'} -- Code runner
  use {'jared-mackey/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} -- Color theme
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    setup = function()
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end,
    event = 'BufRead',
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'bufferline'.setup{
        options = {
          numbers = "ordinal",
        },
        highlights = {
          buffer_selected = {
            guifg = '#e0e0e0',
            gui = "bold,italic"
          },
          indicator_selected = {
            guifg = '#e0e0e0',
            guibg = '#e0e0e0',
          },
        }
      }
    end
  }
  use {
  'glepnir/galaxyline.nvim',
     branch = 'main',
     requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
  use 'Avimitin/nerd-galaxyline'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}},
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local previewers = require('telescope.previewers')

      local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}

        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then return end
          if stat.size > 100000 then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end

      require('telescope').load_extension('media_files')

      require'telescope'.setup {
        defaults = {
          buffer_previewer_maker = new_maker,
        },
        extensions = {
          media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
          },
          fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,
            use_highlighter = true,
          }
        },
      }
    end
  } -- Fuzzy browser
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
    end,
    event = 'BufRead',
  } -- Ninja moves
  use 'nvim-telescope/telescope-fzf-writer.nvim' -- Unlock Telescope hyperspeed
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    event = 'BufRead'
  }
  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').use_extended_mappings()
    end
  } -- Commenting
  use {'f-person/git-blame.nvim', event = "BufRead"}
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = 'TroubleToggle',
    config = function()
      require("trouble").setup {}
    end,
  }
  use "Pocco81/TrueZen.nvim" -- Goyo successor
  use 'lambdalisue/suda.vim' -- End the read only nightmare
  use 'jbyuki/instant.nvim' -- Collaboration yeah!
  use 'mhartington/formatter.nvim' -- Formatters support
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end,
    event = "BufRead"
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
    disabled = {"nerd-fonts.nvim"}
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown'
  }
  use {
    'windwp/nvim-spectre',
    config = function()
      require('spectre').setup()
    end,
    event = "BufRead",
  } -- Search and replace
  use {
    "nacro90/numb.nvim",
    config = function()
      require('numb').setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true -- Enable 'cursorline' for the window while peeking
      }
    end,
    event = "BufRead",
  }
end)
