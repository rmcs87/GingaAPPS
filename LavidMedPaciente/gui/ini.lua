local 	event, string, math, print, table, canvas
		= event, string, math, print, table, canvas

module 'ini'

local ops = {
	'Guia Médico',
	'vai dar erro 1',
	'ERRO VAI DAR 2'
}

local config = {
	ativo = false,
	scala = 1,
	x = 0,
	y = 0,
	width = 300,
	height = 400,
	fonte = 50,
	color = 'blue',
	img = nil,
	fator = 400,
	sentido = 0,
	moving = false
}

local opsConfig = {
	x = 0,
	y = 100,
	selecionado = 1,
	next = 2,
	previous = #ops
}


function set()

end

function isMoving()
	return config.moving
end


function ativar()
	config.ativo = true
	config.color = 'blue'
	desenha()
end


function desativar()
	config.ativo = false
	config.color = 'red'
end

function f()

	config.x = config.x + config.sentido*config.fator

	if config.sentido > 0 then
		if config.x > 0 then
			config.moving = false
			return
		end
	else
		if config.x + config.width  < 0 then
			config.moving = false
			return
		end
	end
	
	desenha()
	
	event.timer(50, f)

end
function moveRL(sentido)
	config.sentido = sentido
	config.moving = true
	
	if config.sentido > 0 then
		if config.x > 0 then
			config.moving = false
			return
		end
	else
		if config.x + config.width  < 0 then
			config.moving = false
			return
		end
	end
	
	config.x = config.x + config.sentido*config.fator
	desenha()
	
	event.timer(50, f)
end


function desenha()
	
	canvas:attrColor(255,255,255,0)
	canvas:clear(config.x, config.y, config.width, config.height)
	
	canvas:attrColor(config.color)
	canvas:attrFont('Tiresias',config.fonte,'bold')
	canvas:drawText(config.x+opsConfig.x, opsConfig.y, ops[opsConfig.selecionado])
	
	canvas:attrColor('white')
	canvas:attrFont('Tiresias',config.fonte*(0.75),'bold')
	canvas:drawText(config.x+opsConfig.x, opsConfig.y - (1.25)*config.fonte, ops[opsConfig.previous])
	
	canvas:drawText(config.x+opsConfig.x, opsConfig.y + (1.5)*config.fonte, ops[opsConfig.next])

	--canvas:flush()
	
end
 

function up()
	if opsConfig.selecionado < #ops then
		opsConfig.selecionado = opsConfig.selecionado + 1
		
		if opsConfig.selecionado == #ops then
			opsConfig.next = 1
			opsConfig.previous = #ops-1
		elseif opsConfig.selecionado == 1 then
			opsConfig.next = 2
			opsConfig.previous = #ops
		else
			opsConfig.next = opsConfig.selecionado + 1
			opsConfig.previous = opsConfig.selecionado - 1
		end
		desenha()
	else
		opsConfig.selecionado = 1
		opsConfig.next = 2
		opsConfig.previous = #ops
		desenha()
	end
end


function down()
	if opsConfig.selecionado > 1 then
		opsConfig.selecionado = opsConfig.selecionado - 1
		
		if opsConfig.selecionado == #ops then
			opsConfig.next = 1
			opsConfig.previous = #ops-1
		elseif opsConfig.selecionado == 1 then
			opsConfig.next = 2
			opsConfig.previous = #ops
		else
			opsConfig.next = opsConfig.selecionado + 1
			opsConfig.previous = opsConfig.selecionado - 1
		end
		
		desenha()
	else
		opsConfig.selecionado = #ops
		opsConfig.next = 1
		opsConfig.previous = #ops-1
		desenha()
	end
end


function selecionar()
	return opsConfig.selecionado + 1
end
