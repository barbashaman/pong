Background = {}

function Background:load()
    -- body
    self.universe = love.graphics.newImage("assets/universe.png")
    self.planets = love.graphics.newImage("assets/planets.png")
    self.width = self.planets:getWidth()
    self.height = self.planets:getHeight()
    self.rotation = 0
end

function Background:update(dt)
    -- body
    self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
    -- body
    --love.graphics.draw(self.universe, 0, 0)
    love.graphics.draw(
        self.universe,
        self.width / 2,
        self.height / 2,
        -self.rotation,
        1.6,
        1.6,
        self.width / 2,
        self.height / 2
    )

    
    love.graphics.draw(
        self.planets,
        self.width / 2,
        self.height / 2,
        self.rotation,
        1,
        1,
        self.width / 2,
        self.height / 2
    )
end
