local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable

module 'componente';

Componente = {
			width  = 0,
			height = 0,			
			posicao = {0, 0},
			img = nil,
		}
Class_Metatable = { __index = Componente }

function Componente:new (caminho)

	local temp = {}

    setmetatable ( temp, Class_Metatable )

	temp.img = canvas:new(caminho);
	temp.width, temp.height = temp.img:attrSize ();
	
	return temp;
end


-- Retorna a escala
function Componente:getWidth()
	return self.width;
end
function Componente:setWidth(width)
	self.width = width;
end

-- Retorna o centro
function Componente:getHeight()
	return self.height;
end
function Componente:setHeight(height)
	self.height = height;
end

-- Retorna a posição
function Componente:getPosicao()
	return self.posicao;
end
function Componente:setPosicao(posicao)
	self.posicao = posicao;
end

-- Retorna a velocidade
function Componente:getImg()
	return self.img;
end
function Componente:setImg(img)
	self.img = img;
end

function Componente:setTexto(texto, x,y)
	self.img:attrColor('white');
	self.img:attrFont('vera', 20, 'bold');
	self.img:drawText(x, y, texto);
end
