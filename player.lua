Player = {}

function Player:load()
    -- body of the Player's load function
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 500
end

function Player:update(dt)
    -- body of the Player's update function
    self:move(dt)
    self:checkBoundaries()
end

function Player:move(dt)
    -- PLayer's moovement function

    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player:checkBoundaries()
    -- body
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
    --body of the Player's draw function
    love.graphics.draw(self.img, self.x, self.y)
end
