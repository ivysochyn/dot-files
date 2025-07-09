local lsp = require('lsp-zero').preset(
{
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

-- Setup mason
local mason = require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
        'bashls',
        'cmake',
        'dockerls',
        'html',
        'pylsp',
    },
})

lspconfig = require('lspconfig')
local opts = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler (optional)
        lspconfig[server_name].setup {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
        }
    end,

    pylsp = function()
        lspconfig.pylsp.setup {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = {
                pylsp = {
                    configurationSources = {'flake8'},
                    plugins = {
                        flake8 = {enabled = true},
                    },
                },
            },
        }
    end,
})

-- Setup clangd
lsp.setup_servers({'clangd'})

-- Setup pylsp

-- Setup code completion
local cmp = require('cmp')
cmp.setup({
    completion = {
        keyword_length = 0,
        autocomplete = false,
    },})
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
})

-- Bind cmp.mapping.complete() to C-Space
vim.keymap.set("i", "<C-Space>", cmp.mapping.complete(), {buffer = true})

-- Setup lsp keymaps
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lac", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    signs = {
        active = signs,
    },
    underline = true,
    severity_sort = true,
})

-- Set signs for diagnostics
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {text = sign.text, texthl = sign.name, numhl = ""})
end

lsp.setup()
