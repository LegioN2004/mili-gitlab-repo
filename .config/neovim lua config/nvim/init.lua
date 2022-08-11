require('legion.settings')
require('legion.plugins')
require('legion.alpha')
require('legion.keymaps')
require('legion.hightlights')
require('legion.cmp')
require('legion.macros')
-- require('legion.snippets')


local has = function(x)
    return vim.fn.has(x) ==  1
end

local is_win = has "win32"
local is_mac = has "macunix"
local is_unix = has "Linux"

if is_mac then
    require('macos')
end

if is_win then
    require('windows')
end

-- if is_unix then
--     require('unix')
-- end
