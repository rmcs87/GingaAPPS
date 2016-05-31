require 'twi'
require 'interface'
require 'vk'

tmp = 0

config = {
	status = 0,
	inputFonte = 50,
	posCursorX = 0,
	posCursorY = 0,
	posLoginX = 500,
	posLoginY = 200,
	posSenhaX = 500,
	posSenhaY = 275,
	posMsgX = 500,
	posMsgY = 350,
	login = '',
	senha = '',
	msgm = ''
}

function exibeTexto(texto,x,y,fonteL,cor)
	canvas:attrColor(cor)
    canvas:attrFont('arial',fonteL,'bold')
	canvas:drawText(x,y,texto)	
	canvas:flush()
end


function userHandler (evt)
	if evt.class  ~= 'user' then return end
	
	if evt.type  == 'twi' then 
		print('-----User')
		if evt.data == 'twi-connect' then
			--twi.send('twilua','lavidlavid','Re-inciando fase 3: vk + twi 2')
			--twi.getFriends('twilua','lavidlavid',1)
			--twi.getMy('twilua','lavidlavid',1)
			--twi.getUser('ricoII',1)
			--twi.createFrienship('twilua','lavidlavid','ricoII')
			--twi.destroyFrienship('twilua','lavidlavid','ricoII')
			--twi.sendDirect('twilua','lavidlavid','Texto teste3.','ricoII')
			--twi.getFriendsNames('ricoII')
			print('-----sent')
		elseif evt.data == 'twi-retry' then
			--twi.send('twilua','lavidlavid','Inciando fase 3: vk + twi5r')
			--twi.getFriendsNames('ricoII')
			twi.send(config.login, config.senha, config.msgm)
		elseif evt.data == 'connectionFail' then
			canvas:attrColor('red')
	    	canvas:attrFont('arial',50,'bold')
			canvas:drawText(100,100,'Falha na conexao.')	
			canvas:flush()
			twi.disconnect()
		elseif evt.data == 'ok' then
			canvas:attrColor('green')
	    	canvas:attrFont('arial',50,'bold')
			--canvas:drawText(100,100,'Operacao sucesso!!!'..evt.value[1][1])
			--cada operacao tem uma tabela diferente
			canvas:drawText(100,100,'Operacao sucesso!!!')
			canvas:flush()
			twi.disconnect()
		elseif evt.data == 'error' then
			canvas:attrColor('red')
	    	canvas:attrFont('arial',50,'bold')
			canvas:drawText(100,100,'Operacao ERROR!!!'..evt.value)	
			canvas:flush()
			twi.disconnect()
		end
	elseif evt.type  == 'vk' then
		if evt.data == 'text' then
			canvas:attrColor(255,255,255,255)
			canvas:clear(posCursorX, posCursorY ,posCursorX + canvas:measureText(evt.value),posCursorY + config.inputFonte)
			interface.exibeTexto(evt.value, posCursorX, posCursorY, 50, 'black')	
		end
		if evt.data == 'enter' then
			-- 1 = pedindo login
			if config.status  == 1 then
				config.login = vk.getTexto()
				vk.limpar()
				posCursorX = config.posSenhaX + canvas:measureText('Senha: ')
				posCursorY = config.posSenhaY
				config.status = 2
			-- 2 = pedindo senha
			elseif config.status  == 2 then
				print('STATUS2')
				config.senha = vk.getTexto()
				vk.limpar()
				posCursorX = config.posMsgX + canvas:measureText('Twit: ')
				posCursorY = config.posMsgY
				config.status = 3
			elseif config.status  == 3 then
				print('STATUS3')
				config.msgm = vk.getTexto()
				vk.desativar()
				twi.send(config.login, config.senha, config.msgm)
				print(config.login)
				print(config.senha) 
				print(config.msgm)
				config.status = -1
			end
		end
	end
end
event.register(userHandler)

function keyHandler (evt)
print('casa')
	if evt.class  ~= 'ncl' then return end
	
	-- 2 = fase de inicializacao
	if config.status == 0 then
		config.status = 1
		twi.connect('www.twitter.com',80)
		interface.init()
		interface.exibeTexto('Login: ', config.posLoginX, config.posLoginY, 50,'black')
		interface.exibeTexto('Senha: ', config.posSenhaX, config.posSenhaY, 50,'black')
		interface.exibeTexto('Twit: ', config.posMsgX, config.posMsgY, 50,'black')
		posCursorX = config.posLoginX + canvas:measureText('Login: ')
		posCursorY = config.posLoginY
		vk.ativar()
	end

	if evt.class == 'key' and evt.type == 'press' then
		if evt.key == 'GREEN' then
		twi.disconnect()
		end
	end
	
end
event.register(keyHandler)