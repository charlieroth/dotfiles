local M = {}

local function keymaps()
    local opts = { noremap = true, silent = true }
    vim.keymap.set({ 'n' }, '<Leader>db', ":lua require('dap').toggle_breakpoint()<cr>", opts)
    vim.keymap.set({ 'n' }, '<Leader>dc', ":lua require('dap').continue()<cr>", opts)
    vim.keymap.set({ 'n' }, '<Leader>dt', ":lua require('dap').terminate()<cr>", opts)
    vim.keymap.set({ 'n' }, '<Leader>dr', ":lua require('dap').repl.toggle()<cr>", opts)
end

local function init()
    local dap_install = require('dap-install')
    dap_install.setup({
        installation_path = vim.fn.stdpath('data') .. '/dapinstall/',
    })

    local dap_breakpoint = {
        error = {
            text = "🟥",
            texthl = "LspDiagnosticsSignError",
            linehl = "",
            numhl = "",
        },
        rejected = {
            text = "",
            texthl = "LspDiagnosticsSignHint",
            linehl = "",
            numhl = "",
        },
        stopped = {
            text = "⭐️",
            texthl = "LspDiagnosticsSignInformation",
            linehl = "DiagnosticUnderlineInfo",
            numhl = "LspDiagnosticsSignInformation",
        },
    }

    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function ui()
    require('nvim-dap-virtual-text').setup()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open(1)
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

local function debuggers()
    require('dap-go').setup()
end

M.setup = function()
    init()
    ui()
    debuggers()
    keymaps()
end

return M
