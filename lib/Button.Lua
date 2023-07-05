Button = Class("Button")
print(Button)
function Button:init(x, y, w, h, extra, debug)
    self.pos = Vector()
    self.pos.x = x
    self.pos.y = y
    self.width = w
    self.height = h
    self.controller = extra.controller
    self.color = extra.color
    self.colorClicled = extra.colorClicled
    self.text = extra.text or ''
    self.button = extra.button or 3
    self.textColor = extra.textColor
    self.font = extra.font or FONTS['Bold32']
    self.onClick = extra.onClick or function()
    end
    self.hovered = false
    self.down = false
    self.isDebug = debug
end

function Button:update(dt)
    if self.isDebug then
        self.pos = Mouse
    else
        if not self.controller.gamepad:isDown(self.button) and self.down and self.hovered then
            self.onClick()
        end
        self.down = self.controller.gamepad:isDown(self.button)
    end
end

function Button:Draw()
    love.graphics.setFont(self.font)
    if self.hovered then
        WHITE:Set()
        love.graphics.setLineWidth(5)
        love.graphics.rectangle("line", self.pos.x - self.width / 2, self.pos.y - self.height / 2, self.width,
            self.height, 10, 10)
        if self.down then
            if self.colorClicled then
                self.colorClicled:Set()
            else
                self.color:SetDimmed()
            end
        else
            self.color:Set()
        end
        love.graphics.rectangle("fill", self.pos.x - self.width / 2, self.pos.y - self.height / 2, self.width,
            self.height, 10, 10)
        self.textColor:Set()
        love.graphics.printf(self.text, self.pos.x - self.width / 2, self.pos.y - self.font:getHeight() / 2, self.width,
            'center')
    else
        self.color:SetDimmed()
        love.graphics.rectangle("fill", self.pos.x - self.width / 2, self.pos.y - self.height / 2, self.width,
            self.height + self.height / 8, 10, 10)
        self.color:Set()
        love.graphics.rectangle("fill", self.pos.x - self.width / 2, self.pos.y - self.height / 2, self.width,
            self.height, 10, 10)
        self.textColor:Set()
        love.graphics.printf(self.text, self.pos.x - self.width / 2, self.pos.y - self.font:getHeight() / 2, self.width,
            'center')
    end
end
