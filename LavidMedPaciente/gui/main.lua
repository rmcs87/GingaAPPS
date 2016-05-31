require 'esp'
require 'ini'
require 'let'
require 'med'
require 'mes'
require 'dat'
require 'cons'

local menu = {
	{ini},
	{esp,let,med}
}

local config = {
	status = 2,
	profundidade = 1
}

local agenda = false;	--POG!!!!!

if config.status == 2 then
	config.status = 2
	menu[config.status][config.profundidade].ativar()
	menu[config.status][config.profundidade+1].set(menu[config.status][config.profundidade].selecionar())
end

function keyboardHandler (evt)
	if evt.class ~= 'key' then return end
	if evt.type ~= 'press' then return end
	if menu[config.status][config.profundidade].isMoving() == true  then return end
		
		if evt.key=='CURSOR_RIGHT' or evt.key=='ENTER' then
			if config.profundidade == 3 then
				event.post {
                class  = 'ncl',
                type   = 'presentation',
                label  = 'areaAgenda',
                action = 'start',
            }
            agenda = true;
			elseif config.profundidade < #menu[config.status] or config.status == 1 then
				--menu[config.status][config.profundidade].desativar()
				--menu[config.status][config.profundidade].moveRL(-1)
				if config.status == 1 then
					config.status = menu[config.status][config.profundidade].selecionar()
				else
					config.profundidade = config.profundidade + 1
				end
				if  config.profundidade == 1 then
					menu[config.status][config.profundidade].set(menu[1][1])
				else
					menu[config.status][config.profundidade].set(menu[config.status][config.profundidade-1].selecionar())
				end
				--menu[config.status][config.profundidade].ativar()
				--menu[config.status][config.profundidade].moveRL(-1)
				menu[config.status][config.profundidade].desenha()
			--elseif config.profundidade >= #menu[config.status] then
				--menu[config.status][config.profundidade].selecionar()
			end
	
		elseif evt.key=='CURSOR_LEFT' then
			if config.status > 1 then
				if config.profundidade == 3 and agenda then
					event.post {
        		        class  = 'ncl',
    		            type   = 'presentation',
		                label  = 'areaAgenda',
	                	action = 'stop',
            		}           
            		agenda = false;
            		return
				elseif config.profundidade == 1 then
					config.status = 1
					event.post{
						class = 'ncl',
						type = 'presentation',
						action = 'stop'
					}
					return
				end
				menu[config.status][config.profundidade].desativar()
				menu[config.status][config.profundidade].moveRL(1)
				config.profundidade = config.profundidade - 1
				menu[config.status][config.profundidade].ativar()
				menu[config.status][config.profundidade].moveRL(1)
				menu[config.status][config.profundidade].desenha()
			end
		
		elseif evt.key=='CURSOR_UP' then
			menu[config.status][config.profundidade].down()
			if config.profundidade < #menu[config.status] then
				menu[config.status][config.profundidade+1].set(menu[config.status][config.profundidade].selecionar())
			end
		elseif evt.key=='CURSOR_DOWN' then
			menu[config.status][config.profundidade].up()
			if config.profundidade < #menu[config.status] then
				menu[config.status][config.profundidade+1].set(menu[config.status][config.profundidade].selecionar())
			end
		end
	
end
event.register(keyboardHandler)
