function love.load()
    diceRoll = 0
    die = {
        love.graphics.newImage("assets/images/dieRed1.png"),
        love.graphics.newImage("assets/images/dieRed2.png"),
        love.graphics.newImage("assets/images/dieRed3.png"),
        love.graphics.newImage("assets/images/dieRed4.png"),
        love.graphics.newImage("assets/images/dieRed5.png"),
        love.graphics.newImage("assets/images/dieRed6.png")
    }
end

function love.keypressed(key)
    if key == "space" then
        math.randomseed(os.time()); math.random(); math.random(); math.random()
        diceRoll = math.random(1, #die) -- same thing as 1-6
    end
end

function love.update(dt)
end

function love.draw()
    if diceRoll > 0 then
        love.graphics.draw(die[diceRoll], 0, 0)
    end
end