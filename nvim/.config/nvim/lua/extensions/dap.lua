require "helpers/globals"

local dap = require('dap')
local dapui = require('dapui')
local Remap = require("helpers/keyboard")

local nnoremap = Remap.nnoremap

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
})

dap.listeners.after.event_initialized['dapui_config'] = function()
  cmd('tabfirst|tabnext')
  dapui.open()
end

nnoremap('<leader>di', ':lua require(\'dap\').toggle_breakpoint()<CR>')
nnoremap('<Leader>dI', ':lua require(\'dap\').set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
nnoremap('<Leader>dp', ':lua require(\'dap\').set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
nnoremap('<Leader>ds', ':lua require(\'dap\').continue()<CR>')
nnoremap('<Leader>dl', ':lua require(\'dap\').run_to_cursor()<CR>')
nnoremap('<Leader>dr', ':lua require(\'dap\').repl.open({},"vsplit")<CR>')
nnoremap('<Leader>dS', ':lua require(\'dap\').disconnect()<CR>')
nnoremap('<Leader>dn', ':lua require(\'dap\').step_over()<CR>')
nnoremap('<Leader>dN', ':lua require(\'dap\').step_into()<CR>')
nnoremap('<Leader>do', ':lua require(\'dap\').step_out()<CR>')

nnoremap('<Leader>dww', ':lua require(\'dapui\').toggle()<CR>')
nnoremap('<Leader>dw[', ':lua require(\'dapui\').toggle(1)<CR>')
nnoremap('<Leader>dw]', ':lua require(\'dapui\').toggle(2)<CR>')

-- require('dap-vscode-js').setup({
--     debugger_path = fn.stdpath('data') .. "/lazy/vscode-js-debug",
--     adapters = {'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'},
-- })

dap.set_log_level('TRACE')

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {fn.stdpath('data') .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js", "45639"},
}

dap.configurations.typescript = {
  {
    type = "node2",
    request = "launch",
    name = "Launch file Nestjs (Node 2)",
    cwd = fn.getcwd(),
    runtimeArgs = {"--nolazy", "-r", "ts-node/register", "-r", "tsconfig-paths/register"},
    args = "${workspaceFolder}/src/main.ts",
    sourceMaps = true,
    skipFiles = { "<node_internals>/**", "node_modules/**" },
    envFile = "${workspaceFolder}/src/config/files/local.json",
    protocol = 'inspector',
    console = 'integratedTerminal',
    preLaunchTask = "tsc: watch - tsconfig.build.json",

  }
}

-- local js_based_languages = { "typescript", "javascript" }
--
-- for _, language in ipairs(js_based_languages) do
--   require("dap").configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "attach",
--       name = "Attach",
--       processId = require 'dap.utils'.pick_process,
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file Nestjs",
--       cwd = fn.getcwd(),
--       args = "${workspaceFolder}/src/main.ts",
--       runtimeArgs = {"--nolazy", "-r", "ts-node/register", "-r", "tsconfig-paths/register"},
--       sourceMaps = true,
--       skipFiles = { "<node_internals>/**", "node_modules/**" },
--       envFile = "${workspaceFolder}/src/config/files/local.json",
--       protocol = 'inspector',
--       console = 'integratedTerminal',
--       preLaunchTask = "tsc: watch - tsconfig.build.json",
--     },
--     {
--       type = "node2",
--       request = "launch",
--       name = "Launch file Nestjs (Node 2)",
--       cwd = fn.getcwd(),
--       runtimeArgs = {"--nolazy", "-r", "ts-node/register", "-r", "tsconfig-paths/register"},
--       args = "${workspaceFolder}/src/main.ts",
--       sourceMaps = true,
--       skipFiles = { "<node_internals>/**", "node_modules/**" },
--       envFile = "${workspaceFolder}/src/config/files/local.json",
--       protocol = 'inspector',
--       console = 'integratedTerminal',
--       preLaunchTask = "tsc: watch - tsconfig.build.json",
--     },
--       {
--     type = "pwa-node",
--     request = "launch",
--     name = "Debug Jest Tests",
--     -- trace = true, -- include debugger info
--     runtimeExecutable = "node",
--     runtimeArgs = {
--       "./node_modules/jest/bin/jest.js",
--       "--runInBand",
--     },
--     rootPath = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     console = "integratedTerminal",
--     internalConsoleOptions = "neverOpen",
--   },
--   }
-- end
