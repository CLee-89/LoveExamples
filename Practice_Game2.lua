function love.load()
    math.randomseed(os.time())

    love.graphics.setBackgroundColor(1, 1, 1, 255)

    -- creating entities
    bullets = {}
    bulletSpeed = 250

    player = {x = 250, y = 250, width = 15, height = 15}
    monster = {x = 500, y = 500, width = 15, height = 15}
end

function love.update(dt)
    -- for loop for each index in bullets
    for i,v in ipairs(bullets) do
        -- updates bullet location
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)

        -- checks if monster was hit
        if v.x >= monster.x and v.x <= (monster.x + monster.width) and
         v.y >= monster.y and v.y <= (monster.y + monster.height) then
            monster.x = math.random(0, 600)
            monster.y = math.random(0, 600)
        end      
    end

    -- player controller
    if love.keyboard.isDown("w") then
        player.y = player.y + (-50 * dt)
    end

    if love.keyboard.isDown("s") then
        player.y = player.y + (50 * dt)
    end

    if love.keyboard.isDown("d") then
        player.x = player.x + (50 * dt)
    end

    if love.keyboard.isDown("a") then
        player.x = player.x + (-50 * dt)
    end
end

function love.draw()
    -- drawing shapes for entities
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

    love.graphics.setColor(0, 0, 0)
    for i,v in ipairs(bullets) do
        love.graphics.circle("fill", v.x, v.y, 3)
    end

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", monster.x, monster.y, monster.width, monster.height)
end

-- function that creates bullet and calculates bullet angle if mouse 1 is pressed
function love.mousepressed(x, y, button)
    if button == 1 then
        local startX = player.x + (player.width / 2)
        local startY = player.y + (player.height / 2)
        local mouseX = x
        local mouseY = y

        local angle = math.atan2((mouseY - startY), (mouseX - startX))

        local bulletDx = bulletSpeed * math.cos(angle)
        local bulletDy = bulletSpeed * math.sin(angle)

        table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
    end

end