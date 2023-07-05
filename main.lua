require 'src/Dependencies'

function love.load()
    math.randomseed(os.time())
    love.window.setTitle("Title")
    love.window.setMode(Window.width, Window.height)

    FONTS.Regular:Set()

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.mouse.keysReleased = {}
    love.mouse.scrolled = 0

    STATES = {
        Main = 0,
    }

    gStateMachine = StateMachine {
        [STATES.Main] = function()
            return MainState()
        end,

    }
    gStateMachine:change(STATES.Main)

    Mouse = Vector(0, 0)
end

function love.update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    Mouse.x, Mouse.y = love.mouse.getX(), love.mouse.getY()
    gStateMachine:update(dt)
end

function love.draw()
    gStateMachine:render()
    DisplayFPS()
    -- reset keys pressed
    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.mouse.keysReleased = {}
    love.mouse.scrolled = 0
end

function DisplayFPS()
    -- simple FPS display across all states
    love.graphics.setColor(0, 1, 0, 1)
    -- love.graphics.setFont(FONTS["Medium12"])
    FONTS.Regular:Set()
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1, 1)
end

-- HANDLING KEY PRESSING 
--[[
    A callback that processes key strokes as they happen, just the once.
    Does not account for keys that are held down, which is handled by a
    separate function (`love.keyboard.isDown`). Useful for when we want
    things to happen right away, just once, like when we want to quit.
]]
function love.keypressed(key)
    -- add to our table of keys pressed this frame

    love.keyboard.keysPressed[key] = true

end

--[[
    A custom function that will let us test for individual keystrokes outside
    of the default `love.keypressed` callback, since we can't call that logic
    elsewhere by default.
]]

function love.mousepressed(x, y, key)
    love.mouse.keysPressed[key] = true
end

function love.mousereleased(x, y, key)
    love.mouse.keysReleased[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mouse.wasPressed(key)
    return love.mouse.keysPressed[key]
end

function love.mouse.wasReleased(key)
    return love.mouse.keysReleased[key]
end

function love.wheelmoved(x, y)
    love.mouse.scrolled = y
end
