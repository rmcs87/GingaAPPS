local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, anim			 , componente		   , engine
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'anim', require 'componente', require 'engine'

module 'efeitos';

Efeitos = {
			eng = nil,
			speed = 25,
		}
Class_Metatable = { __index = Efeitos }

function Efeitos:new ()

	local temp = {};

    setmetatable ( temp, Class_Metatable );

	temp.eng = engine.Engine:new();
	temp.speed = 20;
	
	return temp;

end

function Efeitos:slideR(obj, p1, p2)
	obj:setPosicao(p1);
	anim.start(
		function()				
			if obj:getPosicao()[1] < p2[1] then
				obj:setPosicao({obj:getPosicao()[1] + self.speed, obj:getPosicao()[2]});
			else
				anim.stop();
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:buffer(obj);
			self.eng:atualizar();
		end
		);
end

function Efeitos:slideL(obj, p1, p2)
	obj:setPosicao(p1);
	anim.start(
		function()				
			if obj:getPosicao()[1] > p2[1] then
				obj:setPosicao({obj:getPosicao()[1] - self.speed, obj:getPosicao()[2]});
			else
				anim.stop();
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:buffer(obj);
			self.eng:atualizar();
		end
		);
end

function Efeitos:slideD(obj, p1, p2)
	obj:setPosicao(p1);
	anim.start(
		function()				
			if obj:getPosicao()[2] < p2[2] then
				obj:setPosicao({obj:getPosicao()[1], obj:getPosicao()[2]+self.speed});
			else
				anim.stop();
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:buffer(obj);
			self.eng:atualizar();
		end
		);
end

function Efeitos:slideU(obj, p1, p2)
	obj:setPosicao(p1);
	anim.start(
		function()				
			if obj:getPosicao()[2] > p2[2] then
				obj:setPosicao({obj:getPosicao()[1], obj:getPosicao()[2]-self.speed});
			else
				anim.stop();
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:buffer(obj);
			self.eng:atualizar();
		end
		);
end

function Efeitos:slideDG(obj, p1, p2, head)
	obj:setPosicao(p1);
	--fator = obj:getHeight();
	fator = 0;
	--self.speed = 5;
	anim.start(
		function()				
			--if obj:getPosicao()[2] < p2[2] - self.speed then
			if fator < obj:getHeight() then
				--obj:setPosicao({obj:getPosicao()[1], obj:getPosicao()[2]+self.speed});
				obj:setPosicao(p2);
				--fator = fator - self.speed;
				fator = fator + self.speed;
			else
				anim.stop();
				--fator = obj:getHeight();
				--obj:setPosicao(p2);
				--self.eng:limpar();
				--self.eng:bufferParte(obj, 0, fator, obj:getWidth(),  obj:getHeight());
				--self.eng:buffer(head);
				--self.eng:atualizar();				
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:bufferParte(obj, 0, 0, obj:getWidth(), fator);
			self.eng:buffer(head);
			self.eng:atualizar();
		end
		);
end

function Efeitos:slideDHead(obj, p1, p2, head)
	head:setPosicao(p1);
	anim.start(
		function()				
			if head:getPosicao()[1] > p2[1] + self.speed then
				head:setPosicao({head:getPosicao()[1] - self.speed, head:getPosicao()[2]});
			else
				anim.stop();
				head:setPosicao(p2);
				
				self.eng:limpar();
				self.eng:buffer(head);
				self.eng:atualizar();
				
				self:slideDG(obj, {p2[1], p2[2] - obj:getHeight()} , {p2[1] , p2[2]} ,head);			
			end			
		end,
		function() 
			self.eng:limpar();
			self.eng:buffer(head);
			self.eng:atualizar();
		end
		);
end
