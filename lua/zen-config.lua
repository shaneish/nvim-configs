vim.keymap.set("n", "<leader><leader>Z", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    vim.wo.cursorline = true
    vim.fn['context#toggle'](1)
    vim.fn['sy#toggle']()
end)


vim.keymap.set("n", "<leader><leader>z", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    vim.wo.cursorline = false
    vim.fn['context#toggle'](1)
    vim.fn['sy#toggle']()
end)

