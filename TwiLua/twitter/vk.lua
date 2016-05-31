local _G, coroutine, event, assert, pairs, type, string, math, pcall, print, canvas
    = _G, coroutine, event, assert, pairs, type, string, math, pcall, print, canvas

module 'vk'

local img = canvas:new('vk/grade1.png')
local w, h = img:attrSize()
local config = {
			xi = 60,
			yi = 400,
			grade = img,
			width = w ,
			height = h,
			widthArea = 133, 
			heightArea = 100, 
			ativo = false,
			caps = -1,
			area = 0,
			texto = ''
}

teclado = {
			{'a','b','c','d','e','f','g','h','i'},
			{'j','k','l','m','n','o','p','q','r'},
			{'s','t','u','v','w','x','y','z',''},
			{'','','','','','','','',''},
			{'','','','','','','','',''},
			{'','','','','','','','',''},
			{'','','','','','','','',''},
			{'','','','','','','','',''},
			{'','','','','','caps','enter','back','space'}
		}
		
function ativar()
	config.ativo = true
	canvas:attrColor(255,255,255,255)
	canvas:clear(config.xi, config.yi, config.width, config.height)
	desenhaGrade()
end

function limpar()
	config.texto = ''
end

function getTexto()
	return config.texto
end

function desativar()
	config.ativo = false
	config.caps = false
	config.texto = ''
end

function desenhaGrade()
	canvas:compose(config.xi, config.yi, config.grade)	
	canvas:flush()
end

function desenhaFundo(pos)
	canvas:attrColor('blue')
	canvas:drawRect("fill", config.xi + ( ( (config.area-1)%3 )*config.widthArea), config.yi + ( ( math.floor( (config.area-1)/3 ) )*config.heightArea) , config.widthArea ,config.heightArea )	
	canvas:flush()
end

function keyboardHandler (evt)
	if evt.class ~= 'key' or config.ativo == false then return end
	
	if evt.key=='0' then
		canvas:attrColor(255,255,255,255)
		canvas:clear(config.xi, config.yi, config.width, config.height)
		config.area = 0
		desenhaGrade()
	elseif evt.key=='1' or evt.key=='2' or evt.key=='3' or evt.key=='4' or evt.key=='5' or evt.key=='6' or evt.key=='7' or evt.key=='8' or evt.key=='9' then
		canvas:attrColor(255,255,255,255)
		canvas:clear(config.xi, config.yi, config.width, config.height)
		if config.area == 0 then
			config.area = evt.key + 0
			desenhaFundo(config.area)
		else
			temp = teclado[config.area][evt.key + 0]
			if temp == 'space' then
				config.texto = config.texto..' '
			elseif temp == 'back' then
				if string.len(config.texto) > 0 then
					config.texto = string.sub(config.texto, 0 , string.len(config.texto)-1)
					event.post('in', { class='user', type = 'vk',data = 'text',value = config.texto })
				end
			elseif temp == 'enter' then
				event.post('in', { class='user', type = 'vk',data = 'enter'})
			elseif temp == 'caps' then
				config.caps = config.caps*(-1)
				config.grade = canvas:new('vk/grade'..config.caps..'.png')				
			else
				if config.caps == 1 then
					config.texto = config.texto..string.upper(temp)
				else
					config.texto = config.texto..temp
				end				
				event.post('in', { class='user', type = 'vk',data = 'text',value = config.texto })
			end
			config.area = 0
		end
		desenhaGrade()
	end
end
event.register(keyboardHandler)