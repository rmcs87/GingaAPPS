
local ops = {
	'Vício em Tabaco',
	'Depressão'
}

local perguntas = {
{
	{'Quanto tempo depois de acordar você fuma o primeiro cigarro?',{'5 minutos',3},{'De 6 a 30 minutos',2},{'1 hora',2}},
	{'Você sente falta do cigarro quando está em locais onde ele é proibido?',{'Sim',1},{'Não',0}},
	{'De qual cigarro você não abre mão?',{'Ao acordar',1},{'Qualquer outro',0}},
	{'Quantos cigarros você fuma por dia?',{'Dez ou menos',0},{'De onze a vinte',1},{'De 21 a trinta',2},{' 31 ou mais',3}},
	{'Você fuma com mais freqüência nas primeiras horas do dia?',{'Sim',1},{'Não',0}},
	{'Mesmo quando está doente, a ponto de não sair da cama, você continua fumando?',{'Sim',1},{'Não',0}},
	{'0-2:normal. 3-4:Baixa dependência. 5:Dependência média. +6 pontos: Alta dependência'}
},
{
	{'Você se sente sem energia para realizar tarefas que eram cumpridas sem esforço?',{'Sim',1},{'Não',0}},
	{'Você é assolado com freqüência por um sentimento de vazio ou quadros de ansiedade?',{'Sim',1},{'Não',0}},
	{'Você sente que abandonou o seu projeto de vida?',{'Sim',1},{'Não',0}},
	{'Está difícil tomar decisões, concentrar-se no trabalho ou lembrar fatos recentes?',{'Sim',1},{'Não',0}},
	{'Você perdeu o interesse nas atividades físicas?',{'Sim',1},{'Não',0}},
	{'Você não consegue dormir, acorda no meio da noite ou dorme demais?',{'Sim',1},{'Não',0}},
	{'Você engordou ou emagreceu muito sem ter feito nada para isso?',{'Sim',1},{'Não',0}},
	{'Você sente com freqüência dor de cabeça, de estômago ou na coluna?',{'Sim',1},{'Não',0}},
	{'Você anda mais irritado que de costume?',{'Sim',1},{'Não',0}},
	{'Você gostaria de ficar sozinho a maior parte do tempo?',{'Sim',1},{'Não',0}},
	{'Se você teve mais de cinco pontos, é bom procurar ajuda médica.'}
}
}

local letras = {'a.','b.','c.','d.','e.'}

local config = {
	status = 0,
	ativo = false,
	scala = 1,
	x = 0,
	y = 0,
	width = 1240,
	height = 400,
	fonte = 35,
	color = 'blue',
	img = nil,
	fator = 50,
	sentido = 0,
	moving = false
}

local opsConfig = {
	x = 25,
	y = 75,
	selec = 1,
	resp = 1,
	perg = 1,
	sum = 0,
	espaco = 300
}

config.width, config.height = canvas:attrSize()
config.fonte = 35*(config.width/1280)
opsConfig.espaco = 300*(config.width/1280)
opsConfig.x = 25*(config.width/1280)
opsConfig.y = 50*(config.height/133)

function exibePergunta()	
	canvas:attrColor(255,255,255,0)
	canvas:clear(config.x-config.fator, config.y, config.width+config.fator, config.height)
	canvas:attrColor('white')
	canvas:attrFont('Tiresias',config.fonte,'bold')
	canvas:drawText(config.x+opsConfig.x, config.y, perguntas[opsConfig.perg][opsConfig.selec][1])
	
	for count = 2, #perguntas[opsConfig.perg][opsConfig.selec] do
		if (opsConfig.resp + 1) == count  then
			canvas:attrColor('red')
		else
			canvas:attrColor('white')
		end
		canvas:attrFont('Tiresias',config.fonte,'bold')	
		canvas:drawText(config.x+opsConfig.x +(count-2)*opsConfig.espaco, opsConfig.y, perguntas[opsConfig.perg][opsConfig.selec][count][1])
	end

end

function responde(opcao)
	opsConfig.sum = opsConfig.sum + perguntas[opsConfig.perg][opsConfig.selec][opcao+1][2]
	opsConfig.selec = opsConfig.selec + 1
end

function exibeInicio()
	canvas:attrColor(255,255,255,0)
	canvas:clear(config.x-config.fator, config.y, config.width+config.fator, config.height)
	
	canvas:attrColor('white')
	canvas:attrFont('Tiresias',config.fonte*(1.25),'bold')	
	canvas:drawText(config.x+opsConfig.x, config.y, 'Escolha o teste:')
	
	for count2 = 1, #ops do
		if (opsConfig.resp) == count2 then
			canvas:attrColor('red')
		else
			canvas:attrColor('white')
		end
		canvas:attrFont('Tiresias',config.fonte,'bold')	
		canvas:drawText(opsConfig.x +(count2-1)*opsConfig.espaco, opsConfig.y, letras[count2]..ops[count2])
	end
	canvas:flush()
end

if config.status == 0 then
	exibeInicio()
end


function handler (evt)
	if evt.class ~= 'key' then return end
	if evt.type ~= 'press' then return end
	
	if config.status == 0 then
	
		exibeInicio()
	
	end
	
	if evt.key=='CURSOR_UP' then
		event.post{
			class = 'ncl',
			type = 'presentation',
			action = 'stop'
		}
		limpa()
	end
	
	if config.status > 0 then
		if evt.key=='ENTER' then
			if opsConfig.selec < (#perguntas[opsConfig.perg]-1) then
				responde(opsConfig.resp)
				opsConfig.resp = 1
				exibePergunta()
			else--fim
				responde(opsConfig.resp)
				canvas:attrColor(255,255,255,0)
				canvas:clear(config.x-config.fator, config.y, config.width+config.fator, config.height)
				canvas:attrColor('white')
				canvas:attrFont('Tiresias',config.fonte,'bold')	
				canvas:drawText(config.x+opsConfig.x, opsConfig.y, perguntas[opsConfig.perg][opsConfig.selec][1])
				canvas:drawText(config.x+opsConfig.x, config.y, 'Pontuação - '..opsConfig.sum)
				config.status = -1
				opsConfig.selec = 1
				opsConfig.resp = 1
				opsConfig.sum = 0
			end
		elseif evt.key=='CURSOR_RIGHT' then
			if opsConfig.resp >= 1 and opsConfig.resp < (#perguntas[opsConfig.perg][opsConfig.selec]-1) then
				opsConfig.resp = opsConfig.resp + 1
			elseif opsConfig.resp == (#perguntas[opsConfig.perg][opsConfig.selec]-1) then
				opsConfig.resp = 1
			end
			exibePergunta()
		elseif evt.key=='CURSOR_LEFT' then
			if opsConfig.resp > 1 and opsConfig.resp <= (#perguntas[opsConfig.perg][opsConfig.selec]-1) then
				opsConfig.resp = opsConfig.resp - 1
			elseif opsConfig.resp == 1 then
				opsConfig.resp = (#perguntas[opsConfig.perg][opsConfig.selec]-1)
			end
			exibePergunta()
		end
	elseif config.status == -1 then
		if evt.key == 'ENTER' then
			config.status = 0
			exibeInicio()		
		end
	elseif config.status == 0 then
		if evt.key=='ENTER' then
			opsConfig.perg = opsConfig.resp
			opsConfig.resp = 1
			config.status = 1
			exibePergunta()
			return
		elseif evt.key=='CURSOR_RIGHT' then
			if opsConfig.resp >= 1 and opsConfig.resp < (#ops) then
				opsConfig.resp = opsConfig.resp + 1
			elseif opsConfig.resp == (#ops) then
				opsConfig.resp = 1
			end
		elseif evt.key=='CURSOR_LEFT' then
			if opsConfig.resp > 1 and opsConfig.resp <= (#ops) then
				opsConfig.resp = opsConfig.resp - 1
			elseif opsConfig.resp == 1 then
				opsConfig.resp = #ops
			end
		end
		exibeInicio()
	end

end
event.register(handler)

function limpa()
print(opsConfig.selec)
config = {
	status = 0,
	ativo = false,
	scala = 1,
	x = 0,
	y = 0,
	width = 1240,
	height = 400,
	fonte = 40,
	color = 'blue',
	img = nil,
	fator = 50,
	sentido = 0,
	moving = false
}

opsConfig = {
	x = 100,
	y = 75,
	selec = 1,
	resp = 1,
	perg = 1,
	sum = 0,
	espaco = 300
}
print(opsConfig.selec)
end
