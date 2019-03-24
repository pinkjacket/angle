function love.load()
  circle = {}
  
  circle.x = 100
  circle.y = 100
  circle.radius = 25
  circle.speed = 200
end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  
  angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
  
  cos = math.cos(angle)
  sin = math.sin(angle)
  
  local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  
  if distance < 400 then
    circle.x = circle.x + circle.speed * cos * (distance/100) * dt
    circle.y = circle.y + circle.speed * sin * (distance/100) * dt
  end
end

function getDistance(x1, y1, x2, y2)
  local horizontal_distance = x1 - x2
  local vertical_distance = y1 - y2
  
  local a = horizontal_distance ^2
  local b = vertical_distance ^2
  
  local c = a + b
  local distance = math.sqrt(c)
  return distance
end

function love.draw()
  love.graphics.circle("line", circle.x, circle.y, circle.radius)
  
  love.graphics.print("angle: " .. angle, 10, 10)
  
  love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
  love.graphics.line(mouse_x, mouse_y, mouse_x, circle.y)
  
  local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.circle("line", circle.x, circle.y, distance)
end