--Declara do modulo:
module ('twitter', package.seeall)

--Imports:
local sprite = require'sprite'
local textos = require'textos'
local tools = require'tools'

--Variaveis:
local tool = tools.Tools:new();

local back =  sprite.Sprite:new('imgs/voltar.png' , 52 , 19 , 52 , 19);
back:setPosition({600,430});

local icon =  sprite.Sprite:new('imgs/tw.png' , 52 , 50 , 52 , 50);
icon:setPosition({166,384});

local bg = sprite.Sprite:new('imgs/bg_texto.png' , 568 , 86 , 568 , 86);
bg:setPosition({151,366});

local up_button = sprite.Sprite:new('imgs/up.png' , 26 , 15 , 13 , 15);
up_button:setPosition({220,376});

local down_button = sprite.Sprite:new('imgs/down.png' , 26 , 15 , 13 , 15);
down_button:setPosition({220,430});

local status = 'off';
local menuCanvas = nil;
local menuResume = nil;
rand = 1;
dc = nil;

--Funcoes:
function random()
	rand = 1;
end

function draw()
	canvas:attrColor(0,0,0,0);
	canvas:clear();
	
	canvas:compose(menu1:getPosition()[1],menu1:getPosition()[2],menu1:getImg());
	canvas:compose(menu2:getPosition()[1],menu2:getPosition()[2],menu2:getImg());
	canvas:compose(menu3:getPosition()[1],menu3:getPosition()[2],menu3:getImg());
	
	canvas:compose(bg:getPosition()[1],bg:getPosition()[2],bg:getImg());
	canvas:compose(back:getPosition()[1],back:getPosition()[2],back:getImg());
	canvas:compose(icon:getPosition()[1],icon:getPosition()[2],icon:getImg());
	canvas:compose(dc:getPosition()[1],dc:getPosition()[2],dc:getImg());
	canvas:compose(up_button:getPosition()[1],up_button:getPosition()[2],up_button:getImg());
	canvas:compose(down_button:getPosition()[1],down_button:getPosition()[2],down_button:getImg());
	
	canvas:attrColor('white');
	canvas:attrFont('vera', 13, 'bold');
	canvas:drawText(610, 455, rand .. ' de ' .. #textos.twits);
	
	canvas:flush();
	
end

function start(resume, img1 , img2 , img3)
	dc = textos.getTwits(rand);
	menuResume = resume;
	if dc == nil then
		status = 'off';
		canvas:compose(249,155,canvas:new('imgs/error_no_connection.png'));
		canvas:flush();
		event.timer(5000,stop);
	else
		menu1 = img1;
		menu2 = img2;
		menu3 = img3;
		status = 'on';
		random();	
		draw();
	end
end

function stop()
	status = 'off';
	menuResume();
	--draw();
end

function down()

	status = 'trans';
	down_button:nextFrame();
	tool:timer(200,function() down_button:nextFrame(); draw(); end);
	
	if rand < #textos.twits then
		rand = rand +1;
	else
		rand = 1;
	end	
	
	dc = textos.getTwits(rand);
	
	tool:timer(200,function() status = 'on'; end);
	
	draw();
end

function up()

	status = 'trans';
	up_button:nextFrame();
	tool:timer(200,function() up_button:nextFrame(); draw(); end);

	if rand > 1 then
		rand = rand - 1;
	else
		rand = #textos.twits;
	end	
	
	dc = textos.getTwits(rand);
	
	tool:timer(200,function() status = 'on'; end);

	draw();
end

function transListener(evt)
	if status == 'on' then
		if evt.class == 'key' then
			if evt.type == 'press' then
				if evt.key == 'CURSOR_LEFT' then
					--nd							
				elseif evt.key == 'CURSOR_RIGHT' then
					--nd				
				elseif evt.key == 'CURSOR_DOWN' then
					down();
				elseif evt.key == 'CURSOR_UP' then
					up();
				elseif evt.key == 'ENTER' then
					--nd
				elseif evt.key == 'RED' then
					stop();	
				elseif evt.key == 'GREEN' then
					--nd
				elseif evt.key == 'YELLOW' then
					--nd
				elseif evt.key == 'BLUE' then
					--nd
				end
			end
		end
	end
end
event.register(transListener)