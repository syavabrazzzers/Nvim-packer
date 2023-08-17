vim.opt.number = true           -- нумерация строк
vim.opt.relativenumber = true   -- относительная нумерация строк
vim.opt.ignorecase = true       -- игнорирование регистра
vim.opt.smartcase = true        -- поиск с учетом регистра при необходимости
vim.opt.showmatch = true        -- подсветка найденных объектов
vim.opt.shiftwidth = 4          -- отступ в 4 пробела при нажатии таба
vim.opt.tabstop = 4             -- 1 таб = 4 пробела
vim.opt.autoindent = true       -- умный таб

-- системный буффер обмена
vim.opt.clipboard = 'unnamedplus'

vim.opt.cursorline = true       -- хзe
vim.opt.splitright = true       -- полоса справа
vim.opt.splitbelow = true       -- полоса снизу
vim.opt.colorcolumn = '80'      -- подсветка 80 колонки
vim.opt.swapfile = false        -- не создавать свапфайлы
vim.opt.so = 7                  -- отступ снизу
vim.opt.wrap = true             -- хз
vim.opt.autochdir = true

--vim.cmd [[filetype indent plugin on syntax enable]]
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,typescript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]


vim.opt.termguicolors = true
vim.cmd [[colorscheme onedark]]
