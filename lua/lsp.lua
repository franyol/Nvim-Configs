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

require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer", "biome", "bashls",
    "clangd", "cmake", "dockerls", "html", "jsonls",
    "lua_ls", "autotools_ls", "marksman",
    "pyright", "lemminx", "yamlls",
    "ts_ls", -- Correct LSP for TypeScript
  },
  handlers = {
    function(server_name)
      if server_name == "typescript-language-server" then
        require("lspconfig").tsserver.setup({ -- Still uses "tsserver" for config
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      elseif server_name == "biome" then
        require("lspconfig").biome.setup({
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.completionProvider = false -- Disable Biome autocompletion
          end,
        })
      else
        require("lspconfig")[server_name].setup({})
      end
    end,
  },
})
