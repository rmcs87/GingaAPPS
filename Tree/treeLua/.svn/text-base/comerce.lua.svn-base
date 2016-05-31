--Pisca na proview por causa do problema de flush do drawtext:

--Declaracao modulo;
module ('comerce', package.seeall)

--Imports:
local protocol = require 'protocol'
local sprite = require'sprite'
local textos = require'textos'
local tools = require'tools'

--Variaveis:
local tool = tools.Tools:new();

local clear = sprite.Sprite:new('imgs/apagar.png' , 65 , 21 , 65 , 21);
clear:setPosition({405,430});

local back = sprite.Sprite:new('imgs/voltar.png' , 52 , 19 , 52 , 19);
back:setPosition({336,430});

local go = sprite.Sprite:new('imgs/go.png' , 70 , 19 , 70 , 19);
go:setPosition({267,430});

local box = sprite.Sprite:new('imgs/central.png' , 269 , 65 , 269 , 65);
box:setPosition({227,188});

local digi = sprite.Sprite:new('imgs/digi.png' , 269 , 65 , 269 , 65);
digi:setPosition({273,222});

local icon =  sprite.Sprite:new('imgs/c.png' , 52 , 50 , 52 , 50);
icon:setPosition({166,384});

local bg = sprite.Sprite:new('imgs/bg_texto.png' , 568 , 86 , 568 , 86);
bg:setPosition({151,366});

local up_button = sprite.Sprite:new('imgs/up.png' , 26 , 15 , 13 , 15);
up_button:setPosition({220,376});

local down_button = sprite.Sprite:new('imgs/down.png' , 26 , 15 , 13 , 15);
down_button:setPosition({220,430});

local status = 'off';
local color = 'white';
local menuCanvas = nil;
local menuResume = nil;
local dc = nil;
local conected = false;
local cpf = '';
local rand = 0;
local dc = {};
local msg = 'Digite seu ID:';
local send = nil;

--Funcoes:
function setConn(var,func)
	conected = var;
	send = func;
end

function receive(value, message)
	msg = message;
	status = 'end';
	event.timer(5000,function() status = 'on';draw(); end);
	draw();
end

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
	canvas:compose(go:getPosition()[1],go:getPosition()[2],go:getImg());
	canvas:compose(icon:getPosition()[1],icon:getPosition()[2],icon:getImg());
	
	canvas:compose(dc[rand][4]:getPosition()[1],dc[rand][4]:getPosition()[2],dc[rand][4]:getImg());
	canvas:compose(dc[rand][1]:getPosition()[1],dc[rand][1]:getPosition()[2],dc[rand][1]:getImg());
	canvas:compose(dc[rand][2]:getPosition()[1],dc[rand][2]:getPosition()[2],dc[rand][2]:getImg());
	canvas:compose(dc[rand][3]:getPosition()[1],dc[rand][3]:getPosition()[2],dc[rand][3]:getImg());
	
	canvas:compose(up_button:getPosition()[1],up_button:getPosition()[2],up_button:getImg());
	canvas:compose(down_button:getPosition()[1],down_button:getPosition()[2],down_button:getImg());
	
	canvas:attrColor('white');
	canvas:attrFont('vera', 13, 'bold');
	canvas:drawText(610, 455, rand .. ' de ' .. #textos.produtos);
	
	if status == 'digi' or status == 'disconected' or status == 'comunication' or status == 'end' then
		canvas:compose(box:getPosition()[1],box:getPosition()[2],box:getImg());
		canvas:compose(digi:getPosition()[1],digi:getPosition()[2],digi:getImg());
		canvas:compose(450,254,back:getImg());
		canvas:compose(306,254,go:getImg());
		canvas:compose(378,254,clear:getImg());
		
		canvas:attrFont('vera', 16, 'bold');
		canvas:attrColor(color);
		canvas:drawText(320, 229, cpf);
		canvas:drawText(240, 201, msg);
	end
	
	canvas:flush();

end

function start(resume , img1 , img2 , img3)
	menuResume = resume;
	menu1 = img1;
	menu2 = img2;
	menu3 = img3;
	status = 'on';
	random();
	dc = textos.getProdutos(rand);
	--Implementar função de conectar que seta os status da conexão;
	--conectar();
	draw();
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
	
	if rand < #textos.produtos then
		rand = rand +1;
	else
		rand = 1;
	end	
	
	dc = textos.getProdutos(rand);
	
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
		rand = #textos.produtos;
	end	
	
	dc = textos.getProdutos(rand);
	
	tool:timer(200,function() status = 'on'; end);

	draw();
end

--Obs.: O STB não sabe direito quando conecta ou não, então as vezes ele acha que ta conectado e fica esperando resposta.
function ok()
	if conected == true then 
		status = 'digi';
		draw();
	else
		status = 'disconected';
		msg = 'SEM ACESSO AO SERVIDOR.';
		draw();
	end
end

function buy()
	--FAZER COMPRAS
	status = 'comunication';
	
	if string.len(cpf) < 11 or string.len(cpf) > 11 then
		msg = 'Identificador deve possuir 11 dígitos';
		status = 'digi';
	elseif conected == false then
		event.timer(10000,function() 
					canvas:compose(249,155,canvas:new('imgs/error_no_connection.png'));
					canvas:flush();
					event.timer(5000,stop);
				 end);
	else
		send(protocol.buy( '1' , dc[rand][5] , cpf));
		msg = 'AGUARDE';
	end
	
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
				elseif evt.key == 'ENTER' or evt.key == 'GREEN' then
					ok();
				elseif evt.key == 'RED' then
					stop();	
				elseif evt.key == 'YELLOW' then
					--nd
				elseif evt.key == 'BLUE' then
					--nd
				end
			end
		end
	elseif status == 'digi' then
		if evt.key == '0' or evt.key == '1' or evt.key == '2' or evt.key == '3' or evt.key == '4' or 
		evt.key == '5' or evt.key == '6' or evt.key == '7' or evt.key == '8' or evt.key == '9' then
			if string.len(cpf) < 11 then
				cpf = cpf .. evt.key;				
			end
			draw();
		elseif evt.key == 'ENTER' or evt.key == 'GREEN' then
			buy();
		elseif evt.key == 'YELLOW' and string.len(cpf) > 0 then
			cpf = string.sub(cpf, 0 , string.len(cpf)-1);
			draw();
		elseif evt.key == 'RED' then
			stop();
		end
	elseif status == 'disconected' then
		if evt.key == 'RED' then
			stop();
		end
	elseif status == 'comunication' then
		if evt.key == 'RED' then
			stop();
		end
	elseif status == 'end' then
		--if evt.key == 'RED' then
			--status = 'on';
		--end
	end
end
event.register(transListener)