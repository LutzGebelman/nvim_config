lsp['rust_analyzer'].setup(
coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
}))
