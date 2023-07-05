--[[
    Screen constants
]] Window = {
    width = 720,
    height = 720,
}
Screen = {}
Screen.width, Screen.height = love.window.getDesktopDimensions()

--[[
    Fonts
]]
local newFont = function(path, size)
    local f = {}
    if size then
        f.font = love.graphics.newFont(path, size)
    else
        f.font = love.graphics.newFont(path)
    end

    --- Sets the font of the next text to be printed
    function f:Set()
        love.graphics.setFont(f.font)
    end
    return f
end

FONTS = {
    ['Regular'] = newFont('fonts/MontserratRegular.ttf'),
    ['Regular13'] = newFont('fonts/MontserratRegular.ttf', 13),
    ['Bold16'] = newFont('fonts/MontserratBold.ttf', 16),
    ['Bold32'] = newFont('fonts/MontserratBold.ttf', 32),
    ['Medium12'] = newFont('fonts/MontserratMedium.ttf', 12),
    ['Medium40'] = newFont('fonts/MontserratMedium.ttf', 40),
    ['Medium37'] = newFont('fonts/MontserratMedium.ttf', 40),
    ['Medium20'] = newFont('fonts/MontserratMedium.ttf', 20),
    ['Light40'] = newFont('fonts/MontserratLight.ttf', 40),
    ['Semibold18'] = newFont('fonts/MontserratSemibold.ttf', 18),
    ['ExtraBold60'] = newFont('fonts/MontserratExtrabold.ttf', 60),
    ['ExtraBold100'] = newFont('fonts/MontserratExtrabold.ttf', 100),
    ['ExtraBold150'] = newFont('fonts/MontserratExtrabold.ttf', 150),
    ['ExtraBoldItalic100'] = newFont('fonts/MontserratExtraboldItalic.ttf', 100),
    ['ExtraBoldItalic60'] = newFont('fonts/MontserratExtraboldItalic.ttf', 60),
}