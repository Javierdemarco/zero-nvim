

local g = vim.g
g.nvim_tree_git_hl = 1 --"0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 --"0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_group_empty = 1 --" 0 by default, compact folders that only contain a single folder into one node in the file tree
-- g.nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } --" List of filenames that gets highlighted with NvimTreeSpecialFile
    -- g.nvim_tree_show_icons = {
    --     'git'= 1,
    --     'folders'= 1,
    --     'files'= 1,
    --     'folder_arrows'= 1,
    -- }
-- "    nnoremap <C-n> :NvimTreeToggle<CR>
-- "    nnoremap <leader>r :NvimTreeRefresh<CR>
-- "    nnoremap <leader>n :NvimTreeFindFile<CR>
    -- " NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

    -- " a list of groups can be found at `:help nvim_tree_highlight`
    -- highlight NvimTreeFolderIcon guibg=blue

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = "20%",
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
