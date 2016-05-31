
--	Modulo twi - twitter para tv digital

--	status:
--		0 - nada
--		1 - envio de mensagem

--	fucoes:
--		connect (host, port) - recebe a porta e endereco para abir conexao. Ativa um timer para ver se a conexão foi
--								bem sucedida.
--		connectionCheck() - identifica falha na conexao. Para isso envia um evento connectionFail.
--		disconnect () - disconecta a conexao com o host.
--		tcpHandler (evt) - listener de eventos tcp que tenham o mesmo identificador da conexao.
--			*Eventos: 
--				twi-connect: avisa que houve conexao
--							
--		send (login,password,text) - envia um novo twit. Trata se a mensagem tem mais de 140 chars, se sim envi
--								evento bigger140 


local _G, coroutine, event, assert, pairs, type, string, math, base, xml, pcall, print
    = _G, coroutine, event, assert, pairs, type, string, math, require 'base', require 'xml', pcall, print
local s_sub = string.sub

module 'twi'

identifier = nil
hostSite = nil
conteudo = ''
requi = false
tentativas = 0

function try(f, catch_f)
	print('TRY2')
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function connect (host, port)
	hostSite = host
    event.post {
        class = 'tcp',
        type  = 'connect',
        host  = host,
        port  = port,
    }
    --event.timer(30000,connectionCheck)
end

function connectionCheck()
	if identifier == nil then
		event.post('in', { class='user', type = 'twi',data = 'connectionFail' })
	end
end

function requisitionCheck()
	if requi == true then
		disconnect()
		if tentativas > 5 then
			event.post('in', { class='user', type = 'twi',data = 'connectionFail' })
			tentativas = 0
			return
		end
		print('-----Retentativa')
		tentativas = tentativas + 1
		connect('www.twitter.com',80)
		--event.timer(10000,requisitionCheck)
	end
end

function disconnect ()
	if identifier ~= nil then
		event.post {
    		class      = 'tcp',
    		type       = 'disconnect',
	    	connection = identifier,
		}
		identifier = nil
	end
	hostSite = nil
end

function tcpHandler (evt)
	if evt.class ~= 'tcp' then return end
	
	print('-----TCP')
	
	if evt.type == 'connect' and evt.connection ~= nil and identifier==nil and evt.host==hostSite then
		if requi == true then
			print('-----Em conexao')
			identifier = evt.connection
			print('identifier -> '..identifier)
			print('-----Enviando evento de conexao')
			event.post('in', { class='user', type = 'twi',data = 'twi-retry' })
		else
			print('-----Em conexao')
			identifier = evt.connection
			print('identifier -> '..identifier)
			print('-----Enviando evento de conexao')
			event.post('in', { class='user', type = 'twi',data = 'twi-connect' })
		end
		
	elseif evt.type == 'connect' and evt.error ~= nil then
		print('-----Em error')
		print('error -> '..evt.error)
	end  
	
	--tratar aki o q o twitter mandou
	if evt.type == 'data' and evt.connection == identifier and evt.value~=nil then
		print('-----Em data'..evt.value)
		conteudo = conteudo..evt.value
		--try
	try(function()
		print('TRY')
		x = xml.collect(conteudo)
		conteudo = ''
		print('-----Converteu')
		if string.find(x[1], "200 OK") ~= nil then
			print('-----------------OK-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'ok', value = x[2] })
		elseif string.find(x[1], "304 Not Modified") ~= nil then
			print('-----------------NADA NOVO-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '304' })
		elseif string.find(x[1], "400 Bad Request") ~= nil then
			print('-----------------Requisicao invalida-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '400' })
		elseif string.find(x[1], "401 Unauthorized") ~= nil then
			print('-----------------Falha na autentiacao-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '401'})
		elseif string.find(x[1], "403 Forbidden") ~= nil then
			print('-----------------Acesso negado-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '403' })
		elseif string.find(x[1], "404 Not Found") ~= nil then
			print('-----------------Caminho não encontrado-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '404' })
		elseif string.find(x[1], "406 Not Acceptable") ~= nil then
			print('-----------------Formato invalido-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '406' })
		elseif string.find(x[1], "500 Internal Server Error") ~= nil then
			print('-----------------Sometihng is broken-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '500' })
		elseif string.find(x[1], "502 Bad Gateway") ~= nil then
			print('-----------------twitter down-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '502' })
		elseif string.find(x[1], "503 Service Unavailable") ~= nil then
			print('-----------------too many request-----------------------------')
			event.post('in', { class='user', type = 'twi',data = 'error', value = '503' })
		else
			print('-----------------Algo inesperado ocorreu-----------------------------'..evt.value)
			event.post('in', { class='user', type = 'twi',data = 'error', value = '???' })
		end
	--cacth
	end, function(e)
	print('casa')
	end)
	--fim
	requi = false
	tentativas = 0
	end
	
end
event.register(tcpHandler)

function send (login,password,text)
	print('-----SENDING')
	if string.len(text)>140 then
		event.post('in', { class='user',type = 'twi', data = 'error', value = '> 140' })
		return
	end
	msg = 'POST /statuses/update.xml HTTP/1.1\n'..
			'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
			'Host: twitter.com\n'..
			'Content-type: application/x-www-form-urlencoded, charset=utf-8\n'..
			'Content-length: '..(7+string.len(text))..'\n'..
			'Connection: close\n\n'..
			'status='..text
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    event.timer(10000,requisitionCheck)
    requi = true
end

function getFriends (login,password,page)
	print('-----enviando update')

	msg = 'GET /statuses/friends_timeline.xml HTTP/1.1\n'..
		'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
		'Host: twitter.com\n'..
		'Cache-Control: no-cache\n\n'
		
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function getMy (login,password,page)
	print('-----enviando update')

	msg = 'GET /statuses/user_timeline.xml HTTP/1.1\n'..
		'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
		'Host: twitter.com\n'..
		'Cache-Control: no-cache\n\n'
		
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function getUser (user,page)
	print('-----enviando update')

	msg = 'GET /statuses/user_timeline/'..user..'.xml HTTP/1.1\n'..
		'Host: twitter.com\n'..
		'Cache-Control: no-cache\n\n'
		
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function createFrienship (login,password,user)
	print('-----enviando update')
	msg = 'POST /friendships/create/'..user..'.xml HTTP/1.1\n'..
			'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
			'Host: twitter.com\n'..
			'Content-Length: 0\n'..
			'Cache-Control: no-cache\n\n'
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function destroyFrienship (login,password,user)
	print('-----enviando update')
	msg = 'POST /friendships/destroy/'..user..'.xml HTTP/1.1\n'..
			'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
			'Host: twitter.com\n'..
			'Content-Length: 0\n'..
			'Cache-Control: no-cache\n\n'
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function sendDirect (login,password,text,user)
	if string.len(text)>140 then
		event.post('in', { class='user',type = 'twi', data = 'error', value = '> 140' })
		return
	end
	print('-----enviando update')
	msg = 'POST /direct_messages/new.xml HTTP/1.1\n'..
			'Authorization: Basic '..base.enc(login..':'..password)..'\n'..
			'Host: twitter.com\n'..
			'Content-length: '..(11+string.len(text)+string.len(user))..'\n'..
			'Cache-Control: no-cache\n\n'..
			'text='..text..'&user='..user
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
end

function getFriendsNames (user)
	print('-----enviando update')

	msg = 'GET /statuses/friends/'..user..'.xml HTTP/1.1\n'..
		'Host: twitter.com\n'..
		'Cache-Control: no-cache\n\n'
		
    event.post {
        class      = 'tcp',
        type       = 'data',
        connection = identifier,
        value      = msg,
    }
    print('-----update enviado')
    event.timer(10000,requisitionCheck)
    requi = true
end