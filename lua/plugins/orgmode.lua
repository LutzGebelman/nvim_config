-- Org mode for vim. Should use this more often
return {
    'nvim-orgmode/orgmode',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    config = function()
        -- Load treesitter grammar for org
        require('orgmode').setup_ts_grammar()

        -- Setup treesitter
        require('nvim-treesitter.configs').setup({
            indent = {
                enable = false
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'org' },
            },
            ensure_installed = { 'org' },
        })

        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = '~/notes/org-agenda/**/*',
            org_default_notes_file = '~/notes/org-capture/ideas.org',
            org_capture_templates = {
                c = {
                    description = 'Code snippets',
                    template = '* %?\n',
                    target = '~/orgfiles/snippets.org'
                }
            }
        })
    end,
}
