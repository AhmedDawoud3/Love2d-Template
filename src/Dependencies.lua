-- https://github.com/Ulydev/push
push = require 'lib/push'

--[[
    Will Enable us to use Classes in Lua!
    https://github.com/vrld/hump/blob/master/class.lua
]]
Class = require 'lib/class'

-- Vector Libirary Will Enable us to use 2d vectors
-- https://github.com/vrld/hump/blob/master/vector.lua
Vector = require 'lib/vector'

-- Suit Libirary (UI)
Suit = require 'lib/suit'

-- Simple Color Libirary
require 'lib/Color'

Easing = require 'lib.easing'

--[[
    Will Enable us to use Queues
    https://github.com/darkwark/queue-lua/blob/master/Queue.lua
]]
require "lib/Queue"

require 'lib.Button'

inspect = require 'lib.inspect'

-- Util functions
require 'src/Utils'

-- Constants (eg. Window Width and Height)
require 'src/CONSTANTS'


-- State Machine Will Handle Changes in States
require 'src/StateMachine'
require "src/States/MainState"
