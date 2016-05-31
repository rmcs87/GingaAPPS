local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, jogo,		  componente
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'jogo',require 'componente'
--No emulador parece estar com problemas, pois não espera o flush para atualizar a tela!!!
module 'fase';

Fase = {
			jogos = nil,
			id = 0,
			head = '',
			bottom = '',
			fw = 0,
			fh = 0,
			pos ={0,0},
			img = nil,
			foco = 1,
			focoAnterior = 1;
			coluna = 1,
			fator = 33,			
		}
Class_Metatable = { __index = Fase }

function Fase:new (identificador, he, bo, position)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	temp.id = identificador;
	temp.head = componente.Componente:new('midia/hbs/'..he..'.png');
	temp.bottom = componente.Componente:new('midia/hbs/'..bo..'.png');
	temp.pos = {position[1],position[2]};
	temp.jogos = {};
	print('casa1');
	temp.img = componente.Componente:new('midia/ops/mainMenu.png');
	print('casa12');
	--temp.img:setPosicao({339,295});
	temp.img:setPosicao({500,300});
	print('casa13');
	
	return temp;
end


function Fase:desenha()
	--print('----------------------DESENHANDO')
	self.img:limpar();
	local posi = {self.pos[1],self.pos[2]};
	local mudado = false;
	self.img:composeImage(posi[1], posi[2], self.head:getImg());
	
	posi[2] = posi[2] + self.fator + 60;
	for i = 1, #self.jogos do
		print('----------------------DESENHANDO jogo ----------------------------'..#self.jogos)
		if i == self.foco or i == self.focoAnterior then		
			self.img:composeImage(posi[1], posi[2], self.jogos[i]:desenha(true):getImg());
		else
			self.img:composeImage(posi[1], posi[2], self.jogos[i]:desenha(false):getImg());
		end
		posi[2] = posi[2] + self.fator;
	end
	
	self.img:composeImage(posi[1], posi[2],self.bottom:getImg());
	self.img:atualizar();
	
	return self.img;
end

function Fase:getJogos()
	return self.jogos;
end

function Fase:addJogo(game)
	table.insert(self.jogos, game);
	if #self.jogos == 1 then
		self.jogos[self.foco]:setSquare(1);
	end
end

function Fase:setPos(po)
	self.pos = po;
end

function Fase:getPos()
	return self.pos;
end

function Fase:getHeight()
	return self.fh;
end

function Fase:getWidth()
	return self.fw;
end

function Fase:up()
	local p = self.jogos[self.foco]:getSquare();
	self.jogos[self.foco]:unSet();
	self.focoAnterior = self.foco;
	if self.foco > 1 then
		self.foco = self.foco - 1;		
	else
		self.foco = #self.jogos;
	end
	self.jogos[self.foco]:setSquare(p);
end

function Fase:down()
	local p = self.jogos[self.foco]:getSquare();
	self.jogos[self.foco]:unSet();
	self.focoAnterior = self.foco;
	if self.foco < #self.jogos then
		self.foco = self.foco + 1;
	else
		self.foco = 1;
	end
	self.jogos[self.foco]:setSquare(p);
end

function Fase:right()
	local p = self.jogos[self.foco]:getPos();
	self.focoAnterior = self.foco;
	if p == 1 then
		self.jogos[self.foco]:setSquare(2);
		self.coluna = 2;
	elseif p == 2 then
		self.jogos[self.foco]:setSquare(1);
		self.coluna = 1;
	end
end

function Fase:left()
	local p = self.jogos[self.foco]:getPos();
	self.focoAnterior = self.foco;
	if p == 2 then
		self.jogos[self.foco]:setSquare(1);
		self.coluna = 1;
	elseif p == 1 then
		self.jogos[self.foco]:setSquare(2);
		self.coluna = 2;
	end
end

function Fase:numerico(num)
	local pl = self.jogos[self.foco]:getPlacar();
	self.focoAnterior = self.foco;
	--print(pl[1] ..' x ' ..pl[2])
	pl[self.coluna] = num;
	--print(pl[1] ..' x ' ..pl[2])
	self.jogos[self.foco]:setPlacar(pl);
end
