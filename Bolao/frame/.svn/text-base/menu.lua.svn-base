local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, partidas,		  componente
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'partidas',require 'componente'

--O problema do lixo na tela é que o compose ta com um flush embutido nele;

module 'menu';

Menu = {
			bg = nil,
			ops = nil,
			opsAtual = nil,
			img = nil,
			pos = nil,
			passo = nil,
			foco = nil,
			status = nil,
			posOP = nil,
		}
Class_Metatable = { __index = Menu }

function Menu:new (bg,x,y,w,h,opx,opy)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	temp.bg = componente.Componente:new('midia/ops/'..bg..'.png');
	temp.img = componente.Componente:new('midia/ops/'..bg..'.png');
	temp.ops = {};
	--temp.img = componente.Componente:new('', w, h);
	temp.passo = 30;
	temp.pos = {0,0};
	temp.posOP = {opx,opy};
	temp.status = 'main';
	temp.foco = 1;	
	temp.img:setPosicao({x,y});
	
	return temp;
end

function Menu:desenha()	

	if self.status == 'main' or self.status == 'img' then
		self.img:limpar();
		local posi = {}; 
		posi[1],posi[2] = self.pos[1],self.pos[2];
		
		self.img:composeImage(posi[1],posi[2], self.bg:getImg());
		
		posi[1],posi[2] = self.posOP[1],self.posOP[2];
		
		for i = 1, #self.ops do
			posi[2] = posi[2] + self.passo;
			if self.foco == i then
				self.img:composeImage(posi[1],posi[2], self.ops[i].opOn:getImg());
			else				
				self.img:composeImage(posi[1],posi[2], self.ops[i].op:getImg());
			end
		end
		
		if self.status == 'img' then
			--self.img:setImage(self.ops[self.foco].px, self.ops[self.foco].py, 'midia/ops/'..self.ops[self.foco].acao..'.png');
			self.img:composeImage(self.ops[self.foco].px, self.ops[self.foco].py, self.ops[self.foco].acao:getImg());
			print('deveria desenhar');
		end
						
		self.img:atualizar();
		return self.img;
	elseif self.status == 'sub' then
		return self.ops[self.foco].acao:desenha();						
	else		
		return
	end
	
end

function Menu:addOp(source, tipo, action, x, y)
		
	local t = {
				op = componente.Componente:new('midia/ops/'..source..'.png'),
				opOn = componente.Componente:new('midia/ops/'..source..'_on.png'),
				type = tipo,
				acao = nil,
				px = x,
				py = y,
			}
	if tipo == 'img' then
		t.acao = componente.Componente:new('midia/ops/'..action..'.png');
	else
		t.acao = action;
	end
	
	table.insert(self.ops, t);

	return self.pl;
end

function Menu:removeOp()
	
	table.remove(self.ops);

end

function Menu:action(type)
	if type == 'up' then
		if self.status == 'main' then
			if self.foco > 1 then
				self.foco = self.foco - 1;
			else
				self.foco = #self.ops;
			end
		end
	elseif type == 'down' then
		if self.status == 'main' then
			if self.foco < #self.ops then
				self.foco = self.foco + 1;
			else
				self.foco = 1;
			end
		end
	elseif type == 'ok' then
		if self.ops[self.foco].type == 'func' then
			self.ops[self.foco].acao();
		elseif self.ops[self.foco].type == 'sub' then
			self.status = 'sub';
		elseif self.ops[self.foco].type == 'img' then
			--self.img:setImage(self.ops[self.foco].px, self.ops[self.foco].py, 'midia/ops/'..self.ops[self.foco].acao..'.png');
			--print('em IMG');
			self.status = 'img';
		else	
			return		
		end
	elseif type == 'back' then
		self.status = 'main';
	else
		return
	end
end
