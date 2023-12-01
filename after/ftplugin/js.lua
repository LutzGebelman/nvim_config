lsp.svelte.setup(coq.lsp_ensure_capabilities({
    filetypes = { 'javascript', 'ts', 'svelte' },
    on_attach = on_attach,
    flags = lsp_flags
}))
