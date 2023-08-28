require "helpers/globals"

local dap = require('dap')
local dapui = require('dapui')
local Remap = require("helpers/keyboard")
local dap_vscode_js = require("dap-vscode-js")

local nnoremap = Remap.nnoremap

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
  cmd('tabfirst|tabnext')
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.set_log_level('TRACE')



dap_vscode_js.setup({
  node_path = '/Users/ZeJr/.asdf/shims/node',
  debugger_path = fn.stdpath('data') .. "/lazy/vscode-js-debug",
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file Nestjs (Node 2)",
      cwd = fn.getcwd(),
      runtimeArgs = {"--nolazy", "-r", "ts-node/register", "-r", "tsconfig-paths/register"},
      args = "${workspaceFolder}/src/main.ts",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      envFile = "${workspaceFolder}/src/config/files/local.json",
      protocol = 'inspector',
      console = 'integratedTerminal',
      preLaunchTask = "tsc: watch - tsconfig.build.json",
    },
  }
end
