local classic = require 'lib/class'
Class = function(name)
    return classic:extend(name)
end

Vector = require 'lib/vector'

require 'lib/color'

require "lib/Queue"

require("lib/Button")

Inspect = require 'lib.inspect'

require 'src/Utils'

-- Constants (eg. Window Width and Height)
require 'src/CONSTANTS'

-- State Machine Will Handle Changes in States
require 'src/StateMachine'
require "src.States.BaseState"
require "src/States/MainState"
