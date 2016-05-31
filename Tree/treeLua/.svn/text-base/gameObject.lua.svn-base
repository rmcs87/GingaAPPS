module ('gameObject', package.seeall)

GameObject = {
	alive  = false,
	centerX = 0,
	centerY = 0,		
	img = nil,
	positionX = 0,
	positionY = 0,
	rotation = 0,
	scale = 1,
	speedX = 0,
	speedY = 0,
	widthF = 0;
	heightF = 0;
}
Class_Metatable = { __index = GameObject }

function GameObject:new ()
	local temp = {};
	setmetatable ( temp, Class_Metatable );

    return temp;
end

-- Retorna e atribui se o objeto esta ativo;
function GameObject:isAlive()
	return self.alive;
end
function GameObject:setAlive(alive)
	self.alive = alive;
end

-- Retorna e atribui a posicao central do objeto;
function GameObject:getCenter()
	return {self.centerX,self.centerY};
end
function GameObject:setCenter(center)
	self.centerX = center[1];
	self.centerY = center[2];
end

-- Retorna o canvas do objeto;
function GameObject:getImg()
	return self.img;
end

-- Retorna e atribui a posicao de desenho do objeto;
function GameObject:getPosition()
	return {self.positionX,self.positionY};
end
function GameObject:setPosition(position)
	self.positionX = position[1];
	self.positionY = position[2];
end

-- Retorna o angulo de rotacao aplicado ao objeto;
function GameObject:getRotation()
	return self.rotation;
end
-- Aplica uma rotacao no objeto;
function GameObject:rotate(angle,x,y)
	self.rotation = angle;
	-- A ser implementado;
	-- Levará em conta posicao onde se deseja rotacionar o objeto;
end

-- Retorna a escala
function GameObject:getScale()
	return self.escala
end
-- Aumenta ou diminui a escala do objeto;
function GameObject:scale(proportion)
	self.scale = proportion;
	-- A ser implementado;
end

-- Retorna o tamanho dos sprites;
function GameObject:getSize()
	return {self.widthF, self.heightF};
end
-- Atribui o tamanho do objeto;
function GameObject:setSize(size)
	self.widthF = size[1];
	self.heightF = size[2];
end

-- Retorna e atribui a velocidade do objeto;
function GameObject:getSpeed()
	return {self.speedX,self.speedY};
end
function GameObject:setSpeed(speed)
	self.speedX = speed[1];
	self.speedY = speed[2];
end
