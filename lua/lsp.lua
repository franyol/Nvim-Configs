local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  -- Use floating window for diagnostic messages
  vim.diagnostic.config({
    virtual_text = false, -- Disable virtual text (the one on the same line as the error)
    signs = true,         -- Keep the signs in the sign column
    update_in_insert = false,
    float = {
      source = "always",  -- Show the source of the diagnostic in the floating window
      border = "rounded", -- Add a border to the floating window
    },
  })

  -- Map keys to show diagnostics in a floating window
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {buffer = bufnr, noremap = true, silent = true})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'rust_analyzer', 'biome', 'bashls',
  		      'clangd', 'cmake', 'dockerls', 'html', 'jsonls',
		      'lua_ls', 'autotools_ls',
	              'marksman', 'pyright', 'lemminx', 'yamlls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
require('lspconfig').biome.setup{
  root_dir = function(fname)
    local root = require('lspconfig.util').root_pattern('package.json')(fname)
    return root or vim.fn.getcwd()  -- Default to current directory if no package.json is found
  end
}
