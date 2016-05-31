local 	_G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, componente
	  = _G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, require 'componente'

module 'engine';

Engine = {
		tempi = nil,
	}
Class_Metatable = { __index = Engine }

function Engine:new ()

	local temp = {}

    setmetatable ( temp, Class_Metatable )

	return temp;
end

--Teste
function Engine:buffer(obj)
	local temp = obj:getPosicao();
	canvas:compose(temp[1],temp[2],obj:getImg());
end

--A
function Engine:getCanvasSize()
	local w,h = canvas:attrSize();
	return w,h;
end

function Engine:limpar()
	canvas:clear();
end

function Engine:limparParte(obj)
	canvas:clear(obj:getPosicao()[1], obj:getPosicao()[2], obj:getWidth(), obj:getHeight());
	--canvas:attrColor(255,255,255,0);
	--canvas:drawRect('fill',obj:getPosicao()[1], obj:getPosicao()[2], obj:getWidth(), obj:getHeight());
end

function Engine:atualizar()
	canvas:flush();
end

function Engine:timer(tempo,func)
	event.timer(tempo,func);
end

function Engine:exibeTexto(x, y, texto, size)
	canvas:attrColor('white');
	canvas:attrFont('vera', size, 'bold');
	canvas:drawText(x, y, texto);
	canvas:attrColor('black');
end
