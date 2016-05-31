--Proximas versoes adicionar comandos para editar o tamanho da screen;
module ('option', package.seeall)

local sprite = require'sprite'

Option = {}
Class_Metatable = { __index = Option }

function Option:new (kind,action)
	local temp = {}
	
	temp.spr = nil;
	temp.name = nil;
	temp.type = kind;
	temp.action = action;
	
	setmetatable ( temp, Class_Metatable )
    return temp;
end

function Option:act()
	return self.action;
end

function Option:setPosition(pos)
	self.spr:setPosition(pos);
end
function Option:getPosition()
	return self.spr:getPosition();
end

function Option:getType()
	return self.type;
end

function Option:getImg()
	return self.spr:getImg();
end

function Option:setSprite(path , tw , th , fw , fh)
	self.spr = sprite.Sprite:new(path , tw , th , fw , fh);
end

function Option:getName()
	return self.name:getImg();
end

function Option:setName(path , tw , th , fw , fh)
	self.name = sprite.Sprite:new(path , tw , th , fw , fh);
end

function Option:getNamePosition()
	local aux = self.spr:getPosition();
	return {283  , 456};
end

function Option:setFrame(frame)
	self.spr:setFrame(frame);
end

function Option:nextFrame()
	self.spr:nextFrame();
end

function Option:previousFrame()
	self.spr:previousFrame();
end
