require("helpers/globals")

local chatgpt = require("chatgpt")

chatgpt.setup({
	api_key_cmd = "cole sua chave aqui",
})

-- chatgpt.register({
--     p = {
--         name = "ChatGPT",
--         e = {
--             function()
--                 chatgpt.edit_with_instructions()
--             end,
--             "Edit with instructions",
--         },
--     },
-- }, {
--     prefix = "<leader>",
--     mode = "c",
-- })
