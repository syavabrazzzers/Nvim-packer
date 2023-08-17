-- Добавляем Packer как пакеn
vim.cmd [[packadd packer.nvim]]
-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function()

    -- Добавляем Packer в список, чтобы он обновлял сам себя
    use 'wbthomason/packer.nvim'

    -- LSP сервер
    use {'neovim/nvim-lspconfig',
				 -- config = function()
					--  require('lspconfig').pyright.setup{
					-- 		settings = {
					-- 			pyright = {
					-- 				disableLanguageServices = true,
					-- 			},
					-- 		},
					--  }
				 -- end,
			}
    use 'williamboman/nvim-lsp-installer'
		use {
			'williamboman/mason.nvim',
						config = function()
							require'mason'.setup()
						end,
						ensure_installed = {
							'pyright',
						},
					}

		use {'neoclide/coc.nvim', branch = 'release'}


		-- use 'AckslD/swenv.nvim'
		--
		-- require('swenv').setup({
		-- 	-- Should return a list of tables with a `name` and a `path` entry each.
		-- 	-- Gets the argument `venvs_path` set below.
		-- 	-- By default just lists the entries in `venvs_path`.
		-- 	get_venvs = function(venvs_path)
		-- 		return require('swenv.api').get_venvs(venvs_path)
		-- 	end,
		-- 	-- Path passed to `get_venvs`.
		-- 	venvs_path = vim.fn.expand('~/PycharmProjects/firstMac'),
		-- 	-- Something to do after setting an environment, for example call vim.cmd.LspRestart
		-- 	post_set_venv = vim.cmd.LspRestart,
		-- })

    use {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require'nvim-web-devicons'.setup {
                default = true
            }
        end
    }

    -- Удобное меню для обозрения проблем LSP
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-tree/nvim-web-devicons", opt = true},
        config = function()
            require('lualine').setup()
        end,
    }

    -- use {
    --     'akinsho/bufferline.nvim',
    --     requires = {"nvim-tree/nvim-web-devicons", opt = true},
    --     config = function()
    --         require('bufferline').setup{
    --             options = {
    --                 diagnostic = 'nvim_lsp',
    --
    --             }
    --         }
    --     end,
    -- }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {"windwp/nvim-ts-autotag",},
        config = function()
            require('nvim-treesitter').setup{
                ensure_installed = {'lua', 'css', 'html', 'json', 'python', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'jsx', 'tsx'},
                autotag = {
                    enable = true,
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            }
        end
    }
    -- Автодополнялка
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    --- Автодополнлялка к файловой системе
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'
    use 'joshdick/onedark.vim'
    -- Wakatime
    use 'wakatime/vim-wakatime'
    -- Стартовая страница, если просто набрать vim в консоле
    use 'mhinz/vim-startify'
    -- Комментирует по gc все, вне зависимости от языка программирования
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Обрамляет строку в теги по ctrl- y + ,
    use 'mattn/emmet-vim'
    -- Закрывает автоматом скобки
    use 'cohama/lexima.vim'
    -- Линтер, работает для всех языков
    use 'dense-analysis/ale'
    -- Даже если включена русская раскладка vim команды будут работать
    use 'powerman/vim-plugin-ruscmd'
    -- 'Автоформатирование' кода для всех языков
    use 'Chiel92/vim-autoformat'


    -- use 'kyazdani42/nvim-web-devicons'

    -- use { 'nvim-tree/nvim-tree.lua',
    -- requires = 'nvim-tree/nvim-web-devicons',
    -- config = function() require'nvim-tree'.setup {} end, }
    -- Подсвечивает закрывающий и откры. тэг. Если, где-то что-то не закрыто, то не подсвечивает.
    use 'idanarye/breeze.vim'
    -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
    use 'alvan/vim-closetag'
    -- Подсвечивает #ffffff
    use 'ap/vim-css-color'
    -- Навигация внутри файла по классам и функциям
    use 'majutsushi/tagbar'
    -- Замена fzf и ack

    use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
		}


		use {"linux-cultist/venv-selector.nvim",
					requires = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "sharkdp/fd" },
					config = function()
						require("venv-selector").setup{
							auto_refresh = true,
							-- search = true,
							-- search_venv_managers = true,
							-- search_workspaces = true,
							-- path = '~/PycharmProjects/'
						}
					end,
				}


    use 'mxw/vim-jsx'

		use {
			'xiyaowong/transparent.nvim',
			config = function()
				require('transparent').setup{
					groups = { -- table: default groups
						'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
						'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
						'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
						'SignColumn', 'CursorLineNr', 'EndOfBuffer',
					},
					extra_groups = {}, -- table: additional groups that should be cleared
					exclude_groups = {},
				}
			end,
		}

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
		require("telescope").setup {
			extensions = {
				file_browser = {
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_witdth = 0.3,
						},
					},
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = false,
					cwd_to_path = false,
					grouped = false,
					files = true,
					add_dirs = true,
					depth = 1,
					auto_depth = false,
					select_buffer = false,
					hidden = { file_browser = false, folder_browser = false },
					hide_parent_dir = false,
					collapse_dirs = false,
					prompt_path = false,
					quiet = false,
					dir_icon = "",
					dir_icon_hl = "Default",
					display_stat = { date = true, size = true, mode = true },
					hijack_netrw = false,
					use_fd = true,
					git_status = true,
					},
				},
			}
			
    require("telescope").load_extension "file_browser"
end)

