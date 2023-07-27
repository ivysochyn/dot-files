require "user.autopairs"
require "user.config"
require "user.copilot"
require "user.grammarous"
require "user.lsp"
require "packer.packer"

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
