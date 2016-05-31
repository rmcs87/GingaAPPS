require 'tcp'

-- The following table will configure the entire script start-up values:
status = 0
config = {
	width = 500, 					-- width of window
	height = 500, 					-- height of window
	lives = 2, 						-- how many lives
	ship_rotate_speed = 10, 		-- how fast the ship rotates
	ship_throttle_speed = 0.05, 	-- how fast the ship accellerates
	ship_max_speed = 10, 			-- the maximum speed of the ship
	bullet_speed = 3, 				-- how fast the bullets move
	bullet_life = 120, 				-- how long the bullets last until they disappear
	automatic_fire = false, 		-- machine gun?
	start_asteroid_count = 3, 		-- how many asteroids on level 1
	every_level_add_asteroid = 1, 	-- how many asteroids per level after 1
	bgcolor = {0, 0, 0}, 			-- background color
	fgcolor = {255, 255, 255}, 		-- foreground color
	asteroid_max_speed = 2, 		-- asteroids maximum speed
	asteroid_max_radius = 32, 		-- how big the asteroids are
	asteroid_min_radius = 8, 		-- how small they can be until they are destroyed
	erase_by_fill = true, 			-- changes the type of flicker by altering how things are erased
}
-- end configuration

-- calculate some other values based on initial configuration
config.cx = math.floor(config.width / 2) 	-- center x
config.cy = math.floor(config.height / 2) 	-- center y

function printf(...)
	io.write(string.format(unpack(arg)))
end

function draw_polygon(pnt, obj, color)
	local i = 1
	local first_rx
	local first_ry

	while tonumber(obj.polygon[i]) do
		-- grab our point
		local x = tonumber(obj.polygon[i])
		local y = tonumber(obj.polygon[i + 1])

		-- if you get an error here, that probably means you have an odd number of points in your polygon
		-- which is impossible! right?! (you always need an x and a y pair, per point)
		assert(y ~= nil)

		-- this is the formula for rotating a 2d point around the origin:
		local rx = math.cos(obj.angle * math.pi / 180) * x - math.sin(obj.angle * math.pi / 180) * y
		local ry = math.sin(obj.angle * math.pi / 180) * x + math.cos(obj.angle * math.pi / 180) * y

		-- translate the rotated point to where the object is
		rx = rx + obj.x
		ry = ry + obj.y

		-- now our point is ready to be used!

		if (i == 1) then
			-- can't draw a line with one point, so save it for the next iteration
			first_rx = rx
			first_ry = ry
		else
			-- we have two points, so we can start drawing our polygon
			canvas:attrColor(255, 255, 255, 255)
			canvas:drawLine(first_rx, first_ry, rx, ry)

			first_rx = rx
			first_ry = ry
		end

		i = i + 2
	end
end

function draw_asteroid(pnt, ast_i, color)
	return draw_polygon(pnt, asteroid[ast_i], color)
end

function draw_bullet(pnt, blt_i, color)
	return draw_polygon(pnt, bullet[blt_i], color)
end

function draw_ship(pnt, color)
	return draw_polygon(pnt, ship, color)
end

-- this function will generate a random polygon for a given asteroid, based on it's radius
function generate_asteroid_polygon(ast)
	local poly = { }
	local next_pnt = 1
	local step = 15
	if (ast.radius < 10) then
		step = 30
	end
	for ang = 0, 360, step do
		local radius = ast.radius -- maximum radius
		-- we want to shrink the radius randomly for most points... EXCEPT
		-- when the angle is divisible by 45.  this ensures that ALL asteroids
		-- will have 8 points around the entire polygon with the maximum radius,
		-- to ensure they all look generally the same size... but with small
		-- variations
		if ((ang % 45) ~= 0) then
			radius = math.random(ast.radius * 0.75, ast.radius)
		end

		-- x value
		poly[next_pnt    ] = math.cos(ang * math.pi / 180) * radius
		-- y value
		poly[next_pnt + 1] = math.sin(ang * math.pi / 180) * radius

		-- go to next point
		next_pnt = next_pnt + 2
	end

	ast.polygon = poly
end

-- this function will load a level to be played
function load_level(lev)

	game.level = lev

	ship = {
		x = config.cx, -- cx is the center x, calculated at start of script
		y = config.cy, -- cy is center y
		dx = 0,
		dy = 0,
		alive = true,
		was_drawn = false,
		angle = 270, -- point ship upwards
		polygon = {
				8, 0,
				-5, 5,
				-5, -5,
				8, 0
			}
		}

	bullet = { starti = 1, nexti = 1 }

	asteroid_count = config.start_asteroid_count + (lev - 1) * config.every_level_add_asteroid
	asteroids_left = asteroid_count

	asteroid = { }
	local i
	for i = 1, asteroid_count do
		-- put asteroid at random location...
		local ax = math.random(0, config.width)
		local ay = math.random(0, config.height)

		-- then flatten it towards a random side
		-- first randomize whether it's a horizontal or vertical side
		-- then randomize which horizontal or vertical side to use
		if (math.random(0, 1) == 0) then
			-- flatten horizontally...
			if (math.random(0, 1) == 0) then
				-- on the left side
				ax = 0
			else
				-- on the right side
				ax = config.width
			end
		else
			-- flatten vertically
			if (math.random(0, 1) == 0) then
				-- on the top side
				ay = 0
			else
				-- on the bottom side
				ay = config.height
			end
		end

		asteroid[i] = {
			x = ax,
			y = ay,
			alive = true,
			was_drawn = false,

			-- we pick a random speed for the asteroid, but also make sure it
			-- can't go slower than 0.25 * max speed, because slow asteroids
			-- are boring :-P
			dx = (math.random() * (config.asteroid_max_speed * 0.75) +
				config.asteroid_max_speed * 0.25) * (math.random(0, 1) * 2 - 1),

			dy = (math.random() * (config.asteroid_max_speed * 0.75) +
				config.asteroid_max_speed * 0.25) * (math.random(0, 1) * 2 - 1),

			angle = math.random(0, 360),
			dangle = math.random() * 2 - 1,

			radius = config.asteroid_max_radius,
			}

		generate_asteroid_polygon(asteroid[i])
	end
end

-- called when some score is added to the current score
function add_score(ds)
	game.score = game.score + ds
	local txt = "[Level: " .. game.level .. ", Score: " .. game.score
	if (game.is_over) then
		txt = "GAME OVER! " .. txt .. "]"
	else
		txt = "Asteroids! " .. txt .. ", Lives: " .. game.lives .. "]"
	end
end

-- this function will fire a bullet out of the nose of our ship
function fire_bullet()

	bullet[bullet.nexti] = {
		-- start shot from where the ship is
		x = ship.x,
		y = ship.y,
		angle = ship.angle,
		alive = true,
		life = config.bullet_life,
		was_drawn = false,
		polygon = { 0, 0, -3, 0 },
		-- shoot in the direction that the ship is pointing
		dx = math.cos(ship.angle * math.pi / 180) * config.bullet_speed,
		dy = math.sin(ship.angle * math.pi / 180) * config.bullet_speed,
		}

	bullet.nexti = bullet.nexti + 1

	add_score(-1) -- each bullet costs 1 point!
end

-- called when an asteroid is hit, and it must either split in half, or die
function divide_asteroid(ast_i)
	asteroid[ast_i].radius = asteroid[ast_i].radius / 2
	if (asteroid[ast_i].radius < config.asteroid_min_radius) then
		-- asteroid is now too small, so kill it off
		asteroid[ast_i].alive = false
		asteroids_left = asteroids_left - 1
		-- each astroid kill gains 50 points!
		add_score(50)
	else
		-- asteroid is a legal size, so add another one the same size
		asteroids_left = asteroids_left + 1
		asteroid_count = asteroid_count + 1
		asteroid[asteroid_count] = {
			x = asteroid[ast_i].x,
			y = asteroid[ast_i].y,
			alive = true,
			was_drawn = false,
			dx = (math.random() * (config.asteroid_max_speed * 0.75) +
				config.asteroid_max_speed * 0.25) * (math.random(0, 1) * 2 - 1),
			dy = (math.random() * (config.asteroid_max_speed * 0.75) +
				config.asteroid_max_speed * 0.25) * (math.random(0, 1) * 2 - 1),
			angle = math.random(0, 360),
			dangle = math.random() * 2 - 1,
			radius = asteroid[ast_i].radius,
			}
		generate_asteroid_polygon(asteroid[asteroid_count])
		generate_asteroid_polygon(asteroid[ast_i])
		-- each asteroid division gains 25 points!
		add_score(25)
	end
end

-- this function will update an objects position based on it's velocity
function update_object(obj)
	-- move the object
	obj.x = obj.x + obj.dx
	obj.y = obj.y + obj.dy
	-- ensure the object isn't off the screen
	-- if it is, then wrap it around the other side
	if (obj.x < 0) then
		obj.x = obj.x + config.width
	elseif (obj.x >= config.width) then
		obj.x = obj.x - config.width
	end
	if (obj.y < 0) then
		obj.y = obj.y + config.height
	elseif (obj.y >= config.height) then
		obj.y = obj.y - config.height
	end
	-- if there is a dangle, then change the objects angle based on it
	if (obj.dangle ~= nil) then
		obj.angle = obj.angle + obj.dangle
		if (obj.angle < 0) then
			obj.angle = obj.angle + 360
		elseif (obj.angle >= 360) then
			obj.angle = obj.angle - 360
		end
	end
end

-- this function performs the "thinking"... it updates all the positions of each object, and figures out
-- if the user has shot an asteroid, or got hit by an asteroid
function update_all_positions()
	-- update the ship based on what's in the keyboard
	if (keyboard[KEY_LEFT]) then
		ship.angle = ship.angle - config.ship_rotate_speed
		keyboard[KEY_LEFT] = nil
	end
	if (keyboard[KEY_RIGHT]) then
		ship.angle = ship.angle + config.ship_rotate_speed
		keyboard[KEY_RIGHT] = nil
	end

	if (ship.angle < 0) then
		ship.angle = ship.angle + 360
	elseif (ship.angle >= 360) then
		ship.angle = ship.angle - 360
	end

	-- figure out if we're shooting
	if (keyboard[KEY_SHOOT]) then
		if (not was_shooting) then
			fire_bullet()
			was_shooting = not config.automatic_fire

			keyboard[KEY_SHOOT] = nil
			was_shooting = false
		end
	else
		was_shooting = false
	end

	if (keyboard[KEY_UP] or keyboard[KEY_DOWN]) then
		local push_ang = ship.angle
		-- if pushing down, then just push in the opposite direction
		if (keyboard[KEY_DOWN]) then
			push_ang = ship.angle - 180
		end

		-- move ship in the direction it's facing
		ship.dx = ship.dx + math.cos(push_ang * math.pi / 180) * config.ship_throttle_speed
		ship.dy = ship.dy + math.sin(push_ang * math.pi / 180) * config.ship_throttle_speed

		if (ship.dx > config.ship_max_speed) then
			ship.dx = config.ship_max_speed
		elseif (ship.dx < -config.ship_max_speed) then
			ship.dx = -config.ship_max_speed
		end
		if (ship.dy > config.ship_max_speed) then
			ship.dy = config.ship_max_speed
		elseif (ship.dy < -config.ship_max_speed) then
			ship.dy = -config.ship_max_speed
		end
	end

	-- update everything's positions
	local i
	update_object(ship);
	for i = bullet.starti, bullet.nexti - 1 do
		if (bullet[i].alive) then
			update_object(bullet[i])
			bullet[i].life = bullet[i].life - 1
			if (bullet[i].life < 0) then
				bullet[i].alive = false
			end
		end
	end
	for i = 1, asteroid_count do
		if (asteroid[i].alive) then
			update_object(asteroid[i])
		end
	end

	-- check for collisions
	-- start with bullet <-> asteroid collision, to give user the benefit of the doubt :-P
	for i = bullet.starti, bullet.nexti - 1 do
		local j
		if (bullet[i].alive) then
			for j = 1, asteroid_count do
				if (asteroid[j].alive) then
					local dx = bullet[i].x - asteroid[j].x
					local dy = bullet[i].y - asteroid[j].y
					if (dx * dx + dy * dy < asteroid[j].radius * asteroid[j].radius) then
						bullet[i].alive = false
						divide_asteroid(j)
					end
				end
			end
		end
	end

	-- check for ship <-> asteroid collisions
	for i = 1, asteroid_count do
		if (asteroid[i] == nil) then
			break
		end

		if (asteroid[i].alive) then
			local dx = ship.x - asteroid[i].x
			local dy = ship.y - asteroid[i].y
			if (dx * dx + dy * dy < asteroid[i].radius * asteroid[i].radius) then
				game.lives = game.lives - 1
				if (game.lives < 0) then
					game.is_over = true
				end
				load_level(game.level)
				-- each death costs 0 :-P
				add_score(0) -- still important to do in order to update title bar
			end
		end
	end

	-- did ship kill all asteroids?
	if (asteroids_left <= 0) then
		-- then load the next level
		load_level(game.level + 1)
		-- each level up adds 300 points!
		add_score(300)
	end
end

-- load the game and first level

game = {
	lives = config.lives,
	score = 0,
	is_over = false,
	}

load_level(1)

keyboard = { }
KEY_UP = 38
KEY_DOWN = 40
KEY_LEFT = 37
KEY_RIGHT = 39
KEY_SHOOT = 32 -- space bar

start_time = os.clock()
was_shooting = false

--canvas:clip(0, 0, config.width+config.asteroid_max_radius, config.height+config.asteroid_max_radius)

width = config.width
height = config.height
resize = false

add_score(0)  -- refresh the window title bar with 0 score

function f()
	canvas:attrColor(0, 0, 0, 255)
	canvas:drawRect("fill", 0, 0, config.width+config.asteroid_max_radius, config.height+config.asteroid_max_radius)

	-- if (not config.erase_by_fill) then
	if (config.erase_by_fill) then
		-- if we aren't erasing by filling the screen with black,
		-- then we need to erase every item on the screen individually

		-- first erase everything
		if (ship.was_drawn) then
			draw_ship(pnt, config.bgcolor)
			ship.was_drawn = false
		end

		for i = bullet.starti, bullet.nexti - 1 do
			if (bullet[i].was_drawn) then
				draw_bullet(pnt, i, config.bgcolor)
				bullet[i].was_drawn = false
			end
			-- if our starting bullet is dead, it is now erased, so we
			-- can stop processing it from now on...
			if (i == bullet.starti and not bullet[i].alive) then
				-- we don't need to process it anymore
				-- start all future processing from the next bullet onward
				bullet.starti = bullet.starti + 1
			end
		end

		local i

		for i = 1, asteroid_count do
			if (asteroid[i].was_drawn) then
				draw_asteroid(pnt, i, config.bgcolor)
				asteroid[i].was_drawn = false
			end
		end
	end

	update_all_positions()

	-- now draw everything
	draw_ship(pnt, config.fgcolor)
	ship.was_drawn = true

	for i = bullet.starti, bullet.nexti - 1 do
		if (bullet[i].alive) then
			draw_bullet(pnt, i, config.fgcolor)
			bullet[i].was_drawn = true
		end
	end

	for i = 1, asteroid_count do
		if (asteroid[i].alive) then
			draw_asteroid(pnt, i, config.fgcolor)
			asteroid[i].was_drawn = true
		end
	end

	-- put a slight delay here so it doesn't flicker so much
	end_time = os.clock()
	if (end_time - start_time < 0.02) then
		-- sleep(0.02 - end_time + start_time)
		event:delay(10)
	end
	start_time = end_time

	if (game.is_over) then
		-- wnd:close()
	end

	canvas:flush()
	event.timer(10, f)
end

function keyHandler (evt)
	if status == 0 then
		f()
		status =1
	end

	if evt.class == 'key' and evt.type == 'press' then

		keyboard[KEY_UP] = nil
		keyboard[KEY_DOWN] = nil
		keyboard[KEY_LEFT] = nil
		keyboard[KEY_RIGHT] = nil
		keyboard[KEY_SHOOT] = nil

		if (evt.key == "CURSOR_DOWN") then
			keyboard[KEY_DOWN] = true
		elseif (evt.key == "CURSOR_UP") then
			keyboard[KEY_UP] = true
		elseif (evt.key == "CURSOR_LEFT") then
			keyboard[KEY_LEFT] = true
		elseif (evt.key == "CURSOR_RIGHT") then
			keyboard[KEY_RIGHT] = true
		elseif (evt.key == "ENTER") then
			keyboard[KEY_SHOOT] = true
		end
	end
end
event.register(keyHandler)