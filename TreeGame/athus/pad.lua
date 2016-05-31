module ('pad', package.seeall)

-- free : nada aconteceu
-- press : botão está sendo apertado
-- release : botão solto		

Pad = {
	keys = {
		RED = 'free',
		GREEN = 'free',
		BLUE = 'free',
		YELLOW = 'free',
		['0'] = 'free',
		['1'] = 'free',
		['2'] = 'free',
		['3'] = 'free',
		['4'] = 'free',
		['5'] = 'free',
		['6'] = 'free',
		['7'] = 'free',
		['8'] = 'free',
		['9'] = 'free',
		MENU = 'free',
		INFO = 'free',
		CURSOR_DOWN = 'free',
		CURSOR_UP = 'free',
		CURSOR_LEFT = 'free',
		CURSOR_RIGHT = 'free',
		ENTER = 'free',
	}
}
Class_Metatable = { __index = Pad }

function Pad:new()
	local temp = {};
	setmetatable ( temp, Class_Metatable );

    return temp;
end

-- Verifica se a tecla é compativel com o sistema;
function Pad:keyValidate(key)
	if key == 'ENTER' or key == 'CURSOR_RIGHT' or key == 'CURSOR_LEFT' or key == 'CURSOR_UP'
		or key == 'CURSOR_DOWN' or key == 'INFO' or key == 'ENTER' or key == 'MENU'
		or key == '9' or key == '8' or key == '7' or key == '6' or key == '5'
		or key == '4' or key == '3' or key == '2' or key == '1' or key == '0'
		or key == 'RED' or key == 'GREEN' or key == 'YELLOW' or key == 'BLUE'
		--or tecla == 'x' or tecla == 'c' or tecla == 'v' or tecla == 'b'
	then
		return true
	else
		return false
	end
end

-- Limpa todos os estados dos botões;
-- Not working
function Pad:cleanStates()
	for i = 1,21 do				--21 teclas da tabela;
		self.keys[i] = 'free';
	end
end

-- Retorna o status da tecla passada como parâmetro;
function Pad:getKey(key)
	local aux = self.keys[key];
	--if aux == 'release' then
		self.keys[key] = 'free';
	--end
	
	return aux;
end

-- Funcao de tratamento de eventos nativo do ncLua;
function Pad:keyListener(evt)
	if evt.class == 'key' and self:keyValidate(evt.key) then
		if evt.type == 'press' then
			self.keys[evt.key] = 'press';
		end
		if evt.type == 'release'then
			self.keys[evt.key] = 'release';
		end
	end
end
event.register(function(evt) Pad:keyListener(evt) end)
