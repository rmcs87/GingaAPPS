local 	event, string, math, print, table, canvas, guia
		= event, string, math, print, table, canvas, require 'guia'

module 'mes'

local config = {
	ativo = false,
	scala = 1,
	x = 400,
	y = 0,
	width = 400,
	height = 400,
	fonte = 50,
	color = 'white',
	img = nil,
	fator = 400,
	sentido = 0,
	moving = false,
	somador = 400
}

local opsConfig = {
	x = 50,
	y = 100,
	selecionado = 1,
	espIndex = 0,
	letIndex = 0,
	medIndex = 0,
	next = 1,
	previous = 1
}

local ops = {}

config.width, config.height = canvas:attrSize()
config.fonte = 40*(config.width/1280)
opsConfig.espaco = 300*(config.width/1280)
opsConfig.x = 25*(config.width/1280)
opsConfig.y = 40*(config.height/133)

function set(esp, let, med)
	opsConfig.espIndex = esp
	opsConfig.letIndex = let
	opsConfig.medIndex = med
	ops = guia.getMes(opsConfig.espIndex , opsConfig.letIndex , opsConfig.medIndex)
end


function isMoving()
	return config.moving
end

function is2D()
	return false
end

function ativar()
	config.ativo = true
	config.color = 'white'
	--desenha()
end


function desativar()
	config.ativo = false
	config.color = 'white'
end


function f()

	config.somador = config.somador + config.sentido*config.fator

	if config.sentido > 0 then
		if config.somador > config.width*2 then
			config.moving = false
			config.somador = config.width
			if config.ativo then
				event.post('in', { class='user',type = 'stopped'})
			end
			return
		end
	else
		if config.somador  < 0 then
			config.moving = false
			config.somador = config.width
			if config.ativo then
				event.post('in', { class='user',type = 'stopped'})
			end
			return
		end
	end
	
	config.x = config.x + config.sentido*config.fator
	--desenha()
	
	event.timer(50, f)

end
function moveRL(sentido)
	config.sentido = sentido
	config.moving = true
	
	config.somador = config.somador + config.sentido*config.fator
	
	if config.sentido > 0 then
		if config.somador > config.width*2 then
			config.moving = false
			config.somador = config.width
			return
		end
	else
		if config.somador  < 0 then
			config.moving = false
			config.somador = config.width
			return
		end
	end
	
	config.x = config.x + config.sentido*config.fator
	--desenha()
	
	event.timer(50, f)

end


function desenha()
	canvas:attrColor(255,255,255,0)
	canvas:clear(config.x, config.y, config.width, config.height)
	
	canvas:attrColor(config.color)
	canvas:attrFont('Tiresias',config.fonte,'bold')
	canvas:drawText(opsConfig.x, config.y , 'Escolha o médico:')
	canvas:drawText(opsConfig.x, opsConfig.y, opsConfig.selecionado..'.'..ops[opsConfig.selecionado])
	
	canvas:attrColor(config.color)
	canvas:attrFont('Tiresias',(0.75)*config.fonte,'bold')
	canvas:drawText(opsConfig.x, opsConfig.y - (0.75)*config.fonte, opsConfig.previous..'.'..ops[opsConfig.previous])
	
	canvas:drawText(opsConfig.x, opsConfig.y + (1.25)*config.fonte, opsConfig.next..'.'..ops[opsConfig.next])
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
	return opsConfig.espIndex, opsConfig.letIndex, opsConfig.medIndex ,ops[opsConfig.selecionado]
end
