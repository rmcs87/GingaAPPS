module ('conn', package.seeall)

local id = nil;
local host = nil;
local port = nil;
local timeOut = nil;
local mainFunction = nil;	
local buffer = nil;

function isConn()
	if id == nil then
		return false;
	else
		return true;
	end
end

function new(func)
	
	timeOut = 2000;
	mainFunction = func;

end

function connect(host,port)	
	if host ~= nil and port ~= nil then 
		event.post {
	        class = 'tcp',
	        type  = 'connect',
	        host  = host,
	        port  = port,
	        --timeout = timeOut,
	    }
	    host = host;
	    port = port;
	else
		print('ERROR - Parametros invalidos');
	end
end

function disconnect()
	if id ~= nil then
		event.post {
			class      = 'tcp',
			type       = 'disconnect',
	    	connection = id,
		}
	else
	 	print('ERROR : Sem Conexao');
	end
end

function send(value)
	
	if id ~= nil and value ~= nil then
		event.post {
	        class      = 'tcp',
	        type       = 'data',
	        connection = id,
	        value      = value,
	        timeout    = timeOut,
	    }
	 else
	 	print('ERROR : Sem Conexao');
	 end
end

function listener(evt)
	if evt.class ~= 'tcp' then return end
		
	if evt.type == 'connect' then
				
		if evt.error ~= nil then		
			print('ERROR' .. evt.error);
			mainFunction('connError');
			return		
		end
		
		id = evt.connection;
		print(evt.connection);
		mainFunction('connected');
		
	end
	
	if evt.type == 'data' then
		if evt.connection == id then
			mainFunction('received',evt.value);
		elseif evt.error ~= nil then 
			print('ERROR' .. evt.error);
			mainFunction('sendError');	
		end
	end
end
event.register(listener)
