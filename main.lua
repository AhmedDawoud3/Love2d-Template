require 'src/Dependencies'

function love.load()
    math.randomseed(os.time())
    love.window.setTitle("Title")
    LoadFonts()
    love.graphics.setFont(fonts['Regular'])
    push:setupScreen(Window.width, Window.height, Window.width, Window.height, {
        resizable = true,
    })

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.mouse.keysReleased = {}
    love.mouse.scrolled = 0

    gStateMachine = StateMachine {
        ['Main'] = function() return MainState() end,

    }
    gStateMachine:change("Main")

    Mouse = Vector(0, 0)
end

function love.update(dt)
    if love.keyboard.wasPressed('escape') then love.event.quit() end
    Mouse.x, Mouse.y = love.mouse.getX(), love.mouse.getY()
    gStateMachine:update(dt)
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    DisplayFPS()
    push:apply('end')

    -- reset keys pressed
    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
    love.mouse.keysReleased = {}
    love.mouse.scrolled = 0
end

function LoadFonts()
    fonts = {
        ['Regular'] = love.graphics.newFont('fonts/MontserratRegular.ttf'),
        ['Regular13'] = love.graphics.newFont('fonts/MontserratRegular.ttf', 13),
        ['Bold16'] = love.graphics.newFont('fonts/MontserratBold.ttf', 16),
        ['Bold32'] = love.graphics.newFont('fonts/MontserratBold.ttf', 32),
        ['Medium12'] = love.graphics.newFont('fonts/MontserratMedium.ttf', 12),
        ['Medium40'] = love.graphics.newFont('fonts/MontserratMedium.ttf', 40),
        ['Medium37'] = love.graphics.newFont('fonts/MontserratMedium.ttf', 40),
        ['Medium20'] = love.graphics.newFont('fonts/MontserratMedium.ttf', 20),
        ['Light40'] = love.graphics.newFont('fonts/MontserratLight.ttf', 40),
        ['Semibold18'] = love.graphics.newFont('fonts/MontserratSemibold.ttf', 18),
        ['ExtraBold60'] = love.graphics.newFont('fonts/MontserratExtrabold.ttf', 60),
        ['ExtraBold100'] = love.graphics.newFont('fonts/MontserratExtrabold.ttf', 100),
        ['ExtraBold150'] = love.graphics.newFont('fonts/MontserratExtrabold.ttf', 150),
        ['ExtraBoldItalic100'] = love.graphics.newFont('fonts/MontserratExtraboldItalic.ttf', 100),
        ['ExtraBoldItalic60'] = love.graphics.newFont('fonts/MontserratExtraboldItalic.ttf', 60),
    }
end

function DisplayFPS()
    -- simple FPS display across all states
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setFont(fonts["Medium12"])
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1, 1)
end

function love.resize(w, h) push:resize(w, h) end

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

function love.mousepressed(x, y, key) love.mouse.keysPressed[key] = true end

function love.mousereleased(x, y, key) love.mouse.keysReleased[key] = true end

function love.keyboard.wasPressed(key) return love.keyboard.keysPressed[key] end

function love.mouse.wasPressed(key) return love.mouse.keysPressed[key] end

function love.mouse.wasReleased(key) return love.mouse.keysReleased[key] end

function love.wheelmoved(x, y) love.mouse.scrolled = y end
