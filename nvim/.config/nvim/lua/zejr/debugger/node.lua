local home = os.getenv('HOME')
local dap = require('dap')
-- dap.ext.vscode.load_launchjs()
-- require('dap.ext.vscode').load_launchjs()
dap.set_log_level('DEBUG')
dap.adapters.node2 = {
    type = 'executable',
    command = '/home/zejr/.asdf/shims/node',
    args = {home .. '/personal/microsoft-sucks/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.typescript = {
    {
        name = "Debugger",
        type = "node2",
        request = "launch",
        cwd = vim.fn.getcwd(),
        -- runtimeArgs = { "-r", "ts-node/register" },
        runtimeArgs = {"--nolazy", "-r", "ts-node/register", "-r", "tsconfig-paths/register"},
        args = "${workspaceFolder}/src/main.ts",
        -- args = {"--inspect", "${file}"},
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
        envFile = "${workspaceFolder}/src/config/files/local.json",
        protocol = 'inspector',
        console = 'integratedTerminal',
        preLaunchTask = "tsc: watch - tsconfig.build.json",
    },
    {
        name = "Jest (Node2 with ts-node)",
        type = "node2",
        request = "launch",
        cwd = vim.loop.cwd(),
        runtimeArgs = {"--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest"},
        runtimeExecutable = "node",
        args = {"${file}", "--runInBand", "--coverage", "false"},
        sourceMaps = true,
        port = 9229,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
        name = "ts-node (Node2 with ts-node)",
        type = "node2",
        request = "launch",
        cwd = vim.loop.cwd(),
        runtimeArgs = { "-r", "ts-node/register" },
        runtimeExecutable = "node",
        args = {"--inspect", "${file}"},
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
}
