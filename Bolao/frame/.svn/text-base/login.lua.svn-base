local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, partidas,		  componente
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'partidas',require 'componente'

module 'login';

Login = {
			user = '',
			password = '',
			img = nil,
			posL = nil,
			posS = nil,
			posM = nil,
			areaOn =nil, 
			areaOff = nil,
			back = nil,
			msg = '',
			foco = 1,
			fonte = 20,
		}
Class_Metatable = { __index = Login }

function Login:new(back, aOn, aOff, xl, yl, xs, ys, xm, ym)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	--temp.areaOn = aOn;
	temp.areaOn = componente.Componente:new(aOn); 
	--temp.areaOff = aOff;
	temp.areaOff = componente.Componente:new(aOff);
	--temp.back = back;
	
	--ima = canvas:new(back);
	
	temp.img = componente.Componente:new(back);
	temp.back = componente.Componente:new(back);
	--temp.img = componente.Componente:new('',ima:attrSize());
	temp.img:setPosicao({319, 294});
	temp.posL = {xl, yl};
	temp.posS = {xs, ys};
	temp.posM = {xm, ym};
	
	temp.msg = 'TESTE';

	return temp;
end

function Login:desenhaLogin()	
	
	self.img:limpar();
	
	--self.img:setImage(0, 0, self.back);
	self.img:composeImage(0,0, self.back:getImg());
	
	if self.foco == 1 then
		--print(self.posL[1])
		--print(self.posL[2])
		--print(self.areaOn)
		--self.img:setImage(self.posL[1], self.posL[2], self.areaOn);
		self.img:composeImage(self.posL[1], self.posL[2], self.areaOn:getImg());
		self.img:composeImage(self.posS[1], self.posS[2], self.areaOff:getImg());
	elseif self.foco == 2 then
		--self.img:setImage(self.posL[1], self.posL[2], self.areaOff);
		self.img:composeImage(self.posL[1], self.posL[2], self.areaOff:getImg());
		self.img:composeImage(self.posS[1], self.posS[2], self.areaOn:getImg());
	end
	self.img:setTexto(self.user, self.posL[1], self.posL[2], 'red', self.fonte);
	
	--[[if self.foco == 2 then
		--self.img:setImage(self.posS[1], self.posS[2], self.areaOn);
		self.img:composeImage(self.posS[1], self.posS[2], self.areaOn:getImg());
	elseif self.foco == 1 then
		--self.img:setImage(self.posS[1], self.posS[2], self.areaOff);
		self.img:composeImage(self.posS[1], self.posS[2], self.areaOff:getImg());
	end]]--
	
	local ast = '';
	for k = 1, string.len(self.password) do
		ast = ast .. '*';
	end
	
	--self.img:setTexto(self.password, self.posS[1], self.posS[2], 'red', self.fonte);
	self.img:setTexto(ast, self.posS[1], self.posS[2], 'red', self.fonte);
	
	self.img:setTexto(self.msg, self.posM[1], self.posM[2], 'red', self.fonte);
	
	self.img:atualizar();
	
	return self.img;
end

function Login:setText(text)
	if self.foco == 1 then
		self.user = text;
	elseif self.foco == 2 then
		self.password = text;
	end	
end

function Login:action(key)
	if key == 'up' then
		self.foco = 1
	else 
		self.foco = 2
	end
end

function Login:getFoco()
	if self.foco == 1 then
		return self.user;
	elseif self.foco == 2 then
		return self.password;
	end	 
end

function Login:getUser()
	return self.user; 
end

function Login:getPass()
	return self.password;
end

function Login:getFocoIndex()
	return self.foco;	 
end

function Login:setMsg(m)
	self.msg = m;	 
end
