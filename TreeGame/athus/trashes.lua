module ('trashes', package.seeall)

local sprite = require'sprite'
--G.O. / Tipo
ts = {
	{sprite.Sprite:new('imgs/lixos/lixos_01.png' , 168 , 70 , 84 , 70) , 4},
	{sprite.Sprite:new('imgs/lixos/lixos_02.png' , 138 , 46 , 69 , 46) , 1},
	{sprite.Sprite:new('imgs/lixos/lixos_03.png' , 94 , 47 , 47 , 47) , 4},
	{sprite.Sprite:new('imgs/lixos/lixos_04.png' , 130 , 43 , 65 , 43) , 1},
	{sprite.Sprite:new('imgs/lixos/lixos_05.png' , 144 , 39 , 72 , 39) , 2},
	{sprite.Sprite:new('imgs/lixos/lixos_06.png' , 170 , 93 , 85 , 93) , 4},
	{sprite.Sprite:new('imgs/lixos/lixos_07.png' , 136 , 49 , 68 , 49) , 4},
	{sprite.Sprite:new('imgs/lixos/lixos_08.png' , 104 , 37 , 52 , 37) , 3},
	{sprite.Sprite:new('imgs/lixos/lixos_09.png' , 156 , 40 , 78 , 40) , 2},
	{sprite.Sprite:new('imgs/lixos/lixos_10.png' , 108 , 42 , 54 , 42) , 1},
	{sprite.Sprite:new('imgs/lixos/lixos_11.png' , 104 , 39 , 52 , 39) , 1},
}

function setPositions()
	for i = 1, #ts do
		math.randomseed(event.uptime());
		rand1 = math.random(62,642);
		math.randomseed(event.uptime());
		rand2 = math.random(468,475);
		--ts[i][1]:setPosition({rand1,rand2 - ts[i][1]:getHeight()});
		ts[i][1]:setFrame(2);
		ts[i][1]:setPosition({60*i,rand2 - ts[i][1]:getHeight()});
	end
end
setPositions();

function getPosLeft(xpos,focus,lastPoint)
	local aux = -math.huge;
	local pos = focus;
	local lixo = nil;
	
	for i = 1, #ts do
		if ts[i][1]:getPosition()[1] < xpos and ts[i][1]:getPosition()[1] > aux then
			aux = ts[i][1]:getPosition()[1];
			lixo = ts[i][1];
			pos = i;
		end
	end
	
	if aux == -math.huge then
		aux = xpos;
		lixo = lastPoint;
	end

	return lixo,pos;
end

function getPosRight(xpos,focus,lastPoint)
	local aux = math.huge;
	local pos = focus;
	local lixo = nil;
	
	for i = 1, #ts do
		if ts[i][1]:getPosition()[1] > xpos and ts[i][1]:getPosition()[1] < aux then
			aux = ts[i][1]:getPosition()[1];
			lixo = ts[i][1];
			pos = i;
		end
	end
	
	if aux == math.huge then
		aux = xpos;
		lixo = lastPoint;
	end

	return lixo,pos;
end

