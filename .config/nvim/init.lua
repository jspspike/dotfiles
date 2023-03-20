local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'ms-jpq/coq_nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/rust-tools.nvim'
  use {'nvim-telescope/telescope.nvim',   requires =  {'nvim-lua/plenary.nvim'} }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
end)

local lsp_flags = {
  debounce_text_changes = 150,
}

vim.g.coq_settings = { auto_start = 'shut-up' }

local coq = require "coq"
local lspconfig = require "lspconfig"
local servers = { "clangd" }
for _, s in ipairs(servers) do
    lspconfig[s].setup(coq.lsp_ensure_capabilities {})
end

require("rust-tools").setup(coq.lsp_ensure_capabilities {
    tools = { inlay_hints = { auto = false } },
    server = { settings = { ["rust-analyzer"] = ra_settings } },
})

require('lsp_signature').setup({})

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  defaults = {
      layout_strategy = 'vertical'
  }
}
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, {})

vim.cmd('source ~/.config/nvim/set.vim')
