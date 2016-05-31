local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable

module 'componente';

Componente = {
			width  = 0,
			height = 0,			
			posicao = nil,
			img = nil,
		}
Class_Metatable = { __index = Componente }

function Componente:new (caminho, w, h)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	temp.posicao = {0, 0};
	if caminho == '' then
		temp.img = canvas:new(w,h);
		temp.width, temp.height = w,h;
	else
		temp.img = canvas:new(caminho);
		temp.width, temp.height = temp.img:attrSize ();
	end
		
	return temp;
end


-- Retorna a escala
function Componente:getWidth()
	return self.width;
end

-- Retorna o centro
function Componente:getHeight()
	return self.height;
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

function Componente:setTexto(texto, x, y, cor, fonte)
	self.img:attrColor(cor);
	self.img:attrFont('vera', fonte, 'bold');
	self.img:drawText(x, y, texto);
end

function Componente:setImage(x, y, caminho)
	self.img:compose(x, y, canvas:new(caminho));
end

function Componente:drawSquare(x, y, l, cor)
	self.img:attrColor (cor);
	self.img:drawRect ('fill', x, y, l, l);
end

function Componente:limpar()
	self.img:attrColor(0,0,0,0);
	--self.img:attrColor( 'blue');
	self.img:clear();
	--canvas:clear();
end

function Componente:composeImage(x,y,can)
	self.img:compose(x, y, can);	
end

function Componente:atualizar()
	--problema no flush, pois não atuaiza apenas local, atualiza o canvas geral tbm;Comentar para rodar no virtual
	--self.img:flush();
end
