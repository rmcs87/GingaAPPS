module ('sprite', package.seeall)
local gameObject = require 'gameObject';

-- Funcao para fazer com que a classe Sprite herde da GameObject
function inherit(  )
    local new_class = {}
    local class_mt = { __index = new_class }

	-- Construtor de um Sprite: é passado o caminho, tamanho total da imagem (tw,th) e tamanho do frame (fw,fh);
    function new_class:new(path , tw , th , fw , fh)

        local temp = {};
		setmetatable( temp, class_mt );

		temp.img = canvas:new(path);
		temp.widthT = tw;
		temp.heightT = th;
		temp.widthF = fw;
		temp.heightF = fh;
	
		temp.states = th/fh;
		temp.frames = tw/fw;
	
		temp.state = 0;
		temp.frame = -1;
		temp.first = true;

        return temp
    end

    if gameObject.GameObject then
        setmetatable( new_class, { __index = gameObject.GameObject } )
    end

    return new_class
end

Sprite = inherit()

-- Retorna a imagem atual do Sprite;
function Sprite:getImg()
	if self.first then
		self:nextFrame();
		self.first = false;
	end
	return self.img;
end

function Sprite:getHeight()
	return self.heightF;
end

-- Determina qual a sequencia de animacao a ser usada;
function Sprite:setState(newState)
	if newState > self.states -1 then
		self.state = self.states -1;
	else
		self.state = newState;
	end
	
	self:nextFrame();
end

-- Retorna em qual sequencia a animacao se encontra;
function Sprite:getState()
	return self.state;
end

function Sprite:setFrame(value)
	self.frame = value - 1;
	self:nextFrame();
end

-- Atualiza a imagem local para o proximo frame da animacao;
function Sprite:nextFrame()
	if self.frame < self.frames-1 then
		self.frame = self.frame + 1;
	else
		self.frame = 0;
	end

	self.img:attrCrop (
				self.frame * self.widthF ,
				self.state * self.heightF,
				self.widthF ,
				self.heightF);
end
