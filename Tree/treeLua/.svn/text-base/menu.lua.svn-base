module ('menu', package.seeall)

local sprite = require'sprite'
local tools = require'tools'

local ops = {};
local past = {};
local pos = 1;
local left_button = nil;
local right_button = nil;
local tool = nil;
local status = 'off';			--off,on,paused,trans
local img = canvas:new(canvas:attrSize());
local bg_left = nil;
local bg_right = nil;
local menu_bg = nil;
local perfil = 'kid';
local menuAtivo = 1;

function start()
	
	menu_bg = sprite.Sprite:new('imgs/menu/bg_menu.png' , 601 , 400 , 601 , 80);
	menu_bg:setState(0);
	menu_bg:setPosition({60,400});
	
	spheres = sprite.Sprite:new('imgs/menu/sphere.png' , 600 , 400 , 600 , 80);
	spheres:setState(1);
	spheres:setPosition({60,400});
	
	bg_left = sprite.Sprite:new('imgs/menu/esq.png' , 300 , 480 , 60 , 480);
	bg_left:setPosition({0,0});
	
	bg_right = sprite.Sprite:new('imgs/menu/dir.png' , 300 , 480 , 60 , 480);
	bg_right:setPosition({660,0});
	
	left_button = sprite.Sprite:new('imgs/menu/left.png' , 42 , 20 , 21 , 20);
	left_button:setPosition({320,428});
	
	right_button = sprite.Sprite:new('imgs/menu/right.png' , 42 , 20 , 21 , 20);
	right_button:setPosition({428,428});
	
	info_menu = sprite.Sprite:new('imgs/menu/info_menu.png' , 220 , 15 , 220 , 15);
	info_menu:setPosition({187,384});
	
	info_aluno = sprite.Sprite:new('imgs/menu/info_aluno.png' , 360 , 15 , 360 , 15);
	info_aluno:setPosition({187,384});
	
	change = sprite.Sprite:new('imgs/menu/change.png' , 75 , 26 , 75 , 26);
	change:setPosition({635,444});
	
	perfil_aluno = sprite.Sprite:new('imgs/menu/perfil_aluno.png' , 75 , 10 , 75 , 10);
	perfil_aluno:setPosition({630,434});
	
	perfil_prof = sprite.Sprite:new('imgs/menu/perfil_professor.png' , 75 , 10 , 75 , 10);
	perfil_prof:setPosition({630,434});
	
	tool = tools.Tools:new();
	
	status = 'on';
	
	opOn();
	draw();
end

function setBg(back)
	menu_bg:setState(back);
	bg_right:setFrame(back);
	bg_left:setFrame(back);
end

function stop()
	--To do
end

function resume()
	opOn();
	tool:timer(500,function() status = 'on'; end);
end

function opOn()
	tool:timer(100,function() ops[menuAtivo][pos]:previousFrame(); draw(); end);
	tool:timer(200,function() ops[menuAtivo][pos]:previousFrame(); draw(); end);
	tool:timer(300,function() ops[menuAtivo][pos]:previousFrame(); draw(); end);
end

function changeMenu(m)
	print(menuAtivo)
	status = 'trans';
	
	opOff('menu',m);
	
	tool:timer(900,function() opOn(); end);
	
	tool:timer(1200,function() status = 'on'; end);
	
	draw();
end

function opOff(str,m)
	tool:timer(100,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
	tool:timer(200,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
	tool:timer(300,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
	if str == 'left' then
		tool:timer(400,function() 
			if pos < #ops[menuAtivo] then
				pos = pos + 1;
			else
				pos = 1;
			end
		end);
	elseif str == 'menu' then
		tool:timer(400,function() 
				pos = 1;
				menuAtivo = m;
		end);
	else
		tool:timer(400,function() 
			if pos > 1 then
				pos = pos - 1;
			else
				pos = #ops[menuAtivo];
			end	
		end);
	end
end

function left()
	status = 'trans';
	left_button:nextFrame();
	tool:timer(200,function() left_button:nextFrame(); draw(); end);
	
	opOff('left');
	
	tool:timer(400,function() spheres:setState(0); draw(); end);
	tool:timer(500,function() spheres:setState(3); draw(); end);
	tool:timer(600,function() spheres:setState(4); draw(); end);
	tool:timer(700,function() spheres:setState(2); draw(); end);
	tool:timer(800,function() spheres:setState(1); draw(); end);
	
	tool:timer(900,function() opOn(); end);
	
	tool:timer(1200,function() status = 'on'; end);
	
	draw();
end

function right()
	status = 'trans';
	right_button:nextFrame();
	tool:timer(200,function() right_button:nextFrame(); draw();end);
	
	opOff('rigth');
	
	tool:timer(400,function() spheres:setState(2); draw(); end);
	tool:timer(500,function() spheres:setState(4); draw(); end);
	tool:timer(600,function() spheres:setState(3); draw(); end);
	tool:timer(700,function() spheres:setState(0); draw(); end);
	tool:timer(800,function() spheres:setState(1); draw(); end);
	
	tool:timer(900,function() opOn(); end);
	
	tool:timer(1200,function() status = 'on'; end);
	
	draw();
end

function opSelect()
	tool:timer(100,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
	tool:timer(350,function() ops[menuAtivo][pos]:previousFrame(); draw(); end);
	
	tool:timer(450,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);	
	tool:timer(550,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
	tool:timer(650,function() ops[menuAtivo][pos]:nextFrame(); draw(); end);
end

function ok()
	status = 'trans';
	local temp = ops[menuAtivo][pos]:act();
	
	if ops[menuAtivo][pos]:getType() == 'menu' then
		opSelect();
		tool:timer(750,function()
							table.insert( past,tableCopy(ops[menuAtivo]) );
							ops[menuAtivo] = temp;
							pos = 1;							
						end)
		tool:timer(1100,function() opOn() end);
		tool:timer(1100,function() status = 'on'; end);
	else
		opSelect();
		
		tool:timer(750,function() temp(resume , menu_bg , bg_left , bg_right ); end);
	end
end

function draw()
	
	canvas:attrColor(0,0,0,0);
	canvas:clear();
	canvas:compose(menu_bg:getPosition()[1],menu_bg:getPosition()[2],menu_bg:getImg());
	canvas:compose(bg_left:getPosition()[1],bg_left:getPosition()[2],bg_left:getImg());
	canvas:compose(bg_right:getPosition()[1],bg_right:getPosition()[2],bg_right:getImg());
	canvas:compose(spheres:getPosition()[1],spheres:getPosition()[2],spheres:getImg());
	
	canvas:compose(ops[menuAtivo][pos]:getPosition()[1],ops[menuAtivo][pos]:getPosition()[2],ops[menuAtivo][pos]:getImg());
	canvas:compose(ops[menuAtivo][pos]:getNamePosition()[1],ops[menuAtivo][pos]:getNamePosition()[2],ops[menuAtivo][pos]:getName());
	canvas:compose(left_button:getPosition()[1],left_button:getPosition()[2],left_button:getImg());
	canvas:compose(right_button:getPosition()[1],right_button:getPosition()[2],right_button:getImg());
	
	canvas:compose(change:getPosition()[1],change:getPosition()[2],change:getImg());
	if perfil == 'kid' then
		canvas:compose(info_aluno:getPosition()[1],info_aluno:getPosition()[2],info_aluno:getImg());
		canvas:compose(perfil_aluno:getPosition()[1],perfil_aluno:getPosition()[2],perfil_aluno:getImg());		
	else
		canvas:compose(info_menu:getPosition()[1],info_menu:getPosition()[2],info_menu:getImg());
		canvas:compose(perfil_prof:getPosition()[1],perfil_prof:getPosition()[2],perfil_prof:getImg());
	end
	
	canvas:flush();

end

function setOps(priority , opsArray)
	table.insert(ops,priority,opsArray);
end

function keyListener(evt)
	if status == 'on' then
		if evt.class == 'key' then
			if evt.type == 'press' then
				if evt.key == 'CURSOR_LEFT' then
					left();									
				elseif evt.key == 'CURSOR_RIGHT' then
					right();				
				elseif evt.key == 'CURSOR_DOWN' then
					--nd
				elseif evt.key == 'CURSOR_UP' then
					--nd
				elseif evt.key == 'ENTER' then
					ok();
				elseif evt.key == '5' then
					print('CHANGE VIEW');
					if perfil == 'kid' then
						changeMenu(2);
						perfil = 'prof';
					elseif perfil == 'prof' then
						changeMenu(1);
						perfil = 'kid';
					end
				elseif evt.key == 'RED' then
					if perfil == 'kid' then
						menu_bg:setState(1);
						bg_right:setFrame(1);
						bg_left:setFrame(1);
						ops[menuAtivo][pos]:setFrame(3);
						pos = 1;
						ops[menuAtivo][pos]:setFrame(0);
						draw();
					end
				elseif evt.key == 'GREEN' then
					if perfil == 'kid' then
						menu_bg:setState(4);
						bg_right:setFrame(4);
						bg_left:setFrame(4);
						ops[menuAtivo][pos]:setFrame(3);
						pos = 4;
						ops[menuAtivo][pos]:setFrame(0);
						draw();
					end
				elseif evt.key == 'YELLOW' then
					if perfil == 'kid' then
						menu_bg:setState(2);
						bg_right:setFrame(2);
						bg_left:setFrame(2);
						ops[menuAtivo][pos]:setFrame(3);
						pos = 2;
						ops[menuAtivo][pos]:setFrame(0);
						draw();
					end
				elseif evt.key == 'BLUE' then
					if perfil == 'kid' then
						menu_bg:setState(3);
						bg_right:setFrame(3);
						bg_left:setFrame(3);
						ops[menuAtivo][pos]:setFrame(3);
						pos = 3;
						ops[menuAtivo][pos]:setFrame(0);
						draw();
					end
				end
			end
		end
	end
end
event.register(keyListener)

function tableCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end

        return setmetatable(new_table, _copy( getmetatable(object)))
    end
    return _copy(object)
end