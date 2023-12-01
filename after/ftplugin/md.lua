lsp.ltex.setup(coq.lsp_ensure_capabilities({

    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ltex = {
            completionEnabled = true,
            language = "en-US",
        }
    }
}))
