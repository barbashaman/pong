AI = {}

function AI:load()
    self.img = love.graphics.newImage("assets/2.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVelocity = 0
    self.speed = 500

    self.timer = 0
    self.rate = 0.5
    -- body
end

function AI:update(dt)
    -- body
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:aquireTarget()
    end
end

function AI:move(dt)
    -- body
    self.y = self.y + self.yVelocity * dt
end

function AI:aquireTarget()
    -- body
    if Ball.y + Ball.height < self.y then
        self.yVelocity = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVelocity = self.speed
    else
        self.yVelocity = 0
    end
end

function AI:draw()
    -- body
    love.graphics.draw(self.img, self.x, self.y)
end
