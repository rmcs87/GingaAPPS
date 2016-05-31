local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable

module 'conn';

Connection = {
			id = nil,
			host = nil,
			port = nil,
			timeOut = nil,
			mainFunction = nil,	
			buffer = nil,		
		}
Class_Metatable = { __index = Connection }

function Connection:new(func)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	temp.timeOut = 2000;
	temp.mainFunction = func;

	return temp;
end

function Connection:connect(host,port)	
	if host ~= nil and port ~= nil then 
		event.post {
	        class = 'tcp',
	        type  = 'connect',
	        host  = host,
	        port  = port,
	        timeout = self.timeOut,
	    }
	    self.host = host;
	    self.port = port;
	else
		print('ERROR - Parametros invalidos');
	end
end

function Connection:disconnect()
	if self.id ~= nil then
		event.post {
			class      = 'tcp',
			type       = 'disconnect',
	    	connection = self.id,
		}
	else
	 	print('ERROR : Sem Conexao');
	end
end

function Connection:send(value)
	if self.id ~= nil and value ~= nil then
		event.post {
	        class      = 'tcp',
	        type       = 'data',
	        connection = self.id,
	        value      = value,
	        timeout    = self.timeOut,
	    }
	 else
	 	print('ERROR : Sem Conexao');
	 end
end

function Connection:listener(evt)
	if evt.class ~= 'tcp' then return end
	
	if evt.type == 'connect' then
		if evt.connection ~= nil and self.id == nil and self.host == evt.host and self.port == evt.port then
			self.id = evt.connection;
			--print(evt.connection);
			self.mainFunction('connected');
		elseif evt.error ~= nil then		
			print('ERROR' .. evt.error);
			self.mainFunction('connError');			
		end
	end
	
	if evt.type == 'data' then
		if evt.connection == self.id then
			self.mainFunction('received',evt.value);
		elseif evt.error ~= nil then 
			print('ERROR' .. evt.error);
			self.mainFunction('sendError');	
		end
	end
end

