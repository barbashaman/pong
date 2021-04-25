Ball = {
}

function Ball:load()
    -- body
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    
    self.speed = 300
    self.xVelocity = -self.speed
    self.yVelocity = 0
end

function Ball:update(dt)
    -- body
    self:move(dt)
    self:collide()
end

function Ball:move( dt)
    -- body
    self.x = self.x + self.xVelocity * dt
    self.y = self.y + self.yVelocity * dt
end

function Ball:collide( )
    self:collideWall()
    self:collidePlayer()
    self:colideAI()
    self:score()
end

function Ball:collideWall()
    if self.y < 0 then
        self.y = 0
        self.yVelocity = -self.yVelocity
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVelocity = -self.yVelocity
    end
end

function Ball:collidePlayer()
    if checkCollision(self, Player) then
        self.xVelocity = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height/2
        local collisionPosition = middleBall - middlePlayer
        self.yVelocity = collisionPosition * 5
    end
end

function Ball:colideAI()
    if checkCollision(self, AI) then
        self.xVelocity = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height/2
        local collisionPosition = middleBall - middleAI
        self.yVelocity = collisionPosition * 5
    end
end

function Ball:score()
    if self.x < 0 then
        self:resetPosition(1)
        Score.ai = Score.ai + 1
    end
    if self.x + self.width > love.graphics.getWidth() then
        self:resetPosition(-1)
        Score.player = Score.player + 1
    end
end

function Ball:resetPosition(modifier)
    self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVelocity = 0
        self.xVelocity = self.speed * modifier
end

function Ball:draw()
    -- body
    love.graphics.draw(self.img, self.x, self.y)
end