-- vim.keymap.set("n", "gt", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})


-- Telescope keymap
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<Space>f', builtin.file_browser, {})
-- vim.keymap.set('n', '<Space>g', builtin.live_grep, {})
-- vim.keymap.set('n', '<Space>b', builtin.buffers, {})
-- vim.keymap.set('n', '<Space>h', builtin.help_tags, {})



-- My keymaps

-- INSERT MODE
vim.keymap.set('i', 'jj', "<Esc>", {})
vim.keymap.set('i', 'оо', "<Esc>", {})
vim.keymap.set('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(0) : "<TAB>"', { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-g>u<CR>'", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'coc#pum#prev(0)', { silent = true, expr = true })


-- NORMAL MODE
vim.keymap.set('n', '<S-Tab>', "<cmd>bprevious<CR>", {})
vim.keymap.set('n', '<Tab>', "<cmd>bnext<CR>", {})
vim.keymap.set('n', '<S-Q>', "<cmd>bdelete<CR>")
vim.keymap.set('n', '<S-T>', "<cmd>TagbarToggle<CR>", {})


-- Telescope keymap
vim.api.nvim_set_keymap(
  "n",
  "<S-F>",
  ":Telescope file_browser path=%:p:h select_buffer=false hidden=true<CR>",
	-- fb_actions.toggle_browser,
  {noremap = true}
)
vim.keymap.set('n', '<S-B>', "<cmd>Telescope buffers<CR>")
-- vim.keymap.set('n', '<S-G>', "<cmd>Telescope grep_string<CR>")



-- Toggleterm keymap
vim.keymap.set('', '<C-t>', ":ToggleTerm size=10<CR>")
vim.keymap.set('t', '<C-W_w>', 'C-W_w')
vim.keymap.set('t', 'jj', [[<C-\><C-n>]])




-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer', option = {
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end
            }
		}
	},
    mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
}


-- require("telescope").setup {
--   extensions = {
--     file_browser = {
--       -- path
-- 			theme = 'ivy',
--       -- cwd
--       cwd_to_path = false,
--       grouped = false,
--       files = true,
--       add_dirs = true,
--       depth = 1,
--       auto_depth = false,
--       select_buffer = false,
--       hidden = { file_browser = true, folder_browser = true },
--       -- respect_gitignore
--       -- browse_files
--       -- browse_folders
--       hide_parent_dir = true,
--       collapse_dirs = false,
--       prompt_path = false,
--       quiet = false,
--       dir_icon = "",
--       dir_icon_hl = "Default",
--       display_stat = { date = true, size = true, mode = true },
--       hijack_netrw = false,
--       use_fd = true,
--       git_status = true,
--       mappings = {
--         -- ["i"] = {
--         --   ["<A-c>"] = fb_actions.create,
--         --   ["<S-CR>"] = fb_actions.create_from_prompt,
--         --   ["<A-r>"] = fb_actions.rename,
--         --   ["<A-m>"] = fb_actions.move,
--         --   ["<A-y>"] = fb_actions.copy,
--         --   ["<A-d>"] = fb_actions.remove,
--         --   ["<C-o>"] = fb_actions.open,
--         --   ["<C-g>"] = fb_actions.goto_parent_dir,
--         --   ["<C-e>"] = fb_actions.goto_home_dir,
--         --   ["<C-w>"] = fb_actions.goto_cwd,
--         --   ["<C-t>"] = fb_actions.change_cwd,
--         --   ["<C-f>"] = fb_actions.toggle_browser,
--         --   ["<C-h>"] = fb_actions.toggle_hidden,
--         --   ["<C-s>"] = fb_actions.toggle_all,
--         --   ["<bs>"] = fb_actions.backspace,
--         -- },
--         ["n"] = {
-- 					["<Space>f"] = fb_actions.toggle_browser,
--           -- ["c"] = fb_actions.create,
--           -- ["r"] = fb_actions.rename,
--           -- ["m"] = fb_actions.move,
--           -- ["y"] = fb_actions.copy,
--           -- ["d"] = fb_actions.remove,
--           -- ["o"] = fb_actions.open,
--           -- ["g"] = fb_actions.goto_parent_dir,
--           -- ["e"] = fb_actions.goto_home_dir,
--           -- ["w"] = fb_actions.goto_cwd,
--           -- ["t"] = fb_actions.change_cwd,
--           -- ["f"] = fb_actions.toggle_browser,
--           -- ["h"] = fb_actions.toggle_hidden,
--           -- ["s"] = fb_actions.toggle_all,
--         },
--       },
--     },
--   },
-- }
