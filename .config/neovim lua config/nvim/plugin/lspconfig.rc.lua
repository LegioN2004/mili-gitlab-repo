local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

require("luasnip.loaders.from_vscode").lazy_load()


local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

-- to  start ccls server
require'lspconfig'.clangd.setup{}
nvim_lsp.clangd.setup {     -- whole ccls setup as lsp
on_attach = on_attach,
filetype = {"c", "cpp", "objc", "objcpp"},
cmd = {"clangd"},
root_dir = require'lspconfig'.util.root_pattern( '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git')
}

-- lua lsp config
nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- to let the lua server recognize the 'vim' global 
                globals = { 'vim' }
            },
            workspace = {
                -- to make the server aware of the Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }

}

local servers = { 'ccls', 'sumneko_lua' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{
        on_attach = on_attach,
        flags= {
            debounce_text_changes = 150,
        }
    }
end
