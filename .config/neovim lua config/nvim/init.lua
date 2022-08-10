require('legion.settings')
require('legion.plugins')
require('legion.alpha')
require('legion.keymaps')
require('legion.hightlights')
-- require('legion.macos')
-- require('legion.windows')
-- require('legion.unix')


local has = function(x)
    return vim.fn.has(x) ==  1
end

local is_win = has "win32"
local is_mac = has "macunix"
local is_linux = has "linux"

if is_mac then
    require('macos')
end

if is_win then
    require('windows')
end

if is_linux then
    require('unix')
end
