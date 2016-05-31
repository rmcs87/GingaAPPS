local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, partidas,		  componente
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'partidas',require 'componente'

module 'jogo';

Jogo = {
			time1 = '',
			time2 = '',
			img = nil,			
			pl = nil,
			pontos = 0,
			hora = '',
			data = '',
			grupo = '',
			sq1 = nil,
			sq2 = nil,
			pos = 0,
			fundo = nil,
			fonte = 20,
			posHora = {10,0},
			posData = {20,0},
			posGrupo = {30,0},
			posFlag1 = {30,0},
			posFlag2 = {190,0},
			posPla1 = {100,2},
			posPla2 = {160,2},
			posPontos = {190,2},
			flag = false;
		}
Class_Metatable = { __index = Jogo }

function Jogo:new (jog, par)

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	temp.data = partidas.tabela[jog][1];
	temp.hora = partidas.tabela[jog][2];
	temp.grupo = partidas.tabela[jog][3];
	temp.time1 = partidas.tabela[jog][4];
	temp.time2 = partidas.tabela[jog][5];
	
	temp.flagA = componente.Componente:new('midia/flags/'..temp.time1..'.png');
	temp.flagB = componente.Componente:new('midia/flags/'..temp.time2..'.png');
	
	temp.pl = {0,0}		
	
	if par then
		--temp.fundo = componente.Componente:new('midia/fundo/par.png');
		temp.img = componente.Componente:new('midia/fundo/par.png');
		temp.fundo = componente.Componente:new('midia/fundo/par.png');
	else
		--temp.fundo = componente.Componente:new('midia/fundo/impar.png');
		temp.img = componente.Componente:new('midia/fundo/impar.png');
		temp.fundo = componente.Componente:new('midia/fundo/impar.png');
	end
	
	--temp.img = componente.Componente:new('',695,33);
	temp.img = componente.Componente:new('',695,33);
	
	return temp;
end

function Jogo:desenha(all)
	if self.flag == false or all then
		self.img:limpar();
		self.img:composeImage(0,0,self.fundo:getImg());	
		
		self.img:composeImage(self.posFlag1[1], self.posFlag1[2], self.flagA:getImg() );
		if self.pos == 1 then	
			self.img:drawSquare(self.posPla1[1],self.posPla1[2],30,'white');
		else
			self.img:drawSquare(self.posPla1[1],self.posPla1[2],30,'gray');
		end
		self.img:setTexto(self.pl[1], self.posPla1[1], self.posPla1[2], 'red', self.fonte);
		
		self.img:composeImage(self.posFlag2[1], self.posFlag2[2], self.flagA:getImg());
		if self.pos == 2 then	
			self.img:drawSquare(self.posPla2[1],self.posPla2[2],30,'white');
		else
			self.img:drawSquare(self.posPla2[1],self.posPla2[2],30,'gray');
		end
		self.img:setTexto(self.pl[2], self.posPla2[1], self.posPla2[2], 'red', self.fonte);
		
		--self.img:setTexto(self.hora, self.posHora[1], self.posHora[2], 'red', self.fonte);
		--self.img:setTexto(self.data, self.posData[1], self.posData[2], 'red', self.fonte);
		--self.img:setTexto(self.grupo, self.posGrupo[1], self.posGrupo[2], 'red', self.fonte);
		
		--self.img:drawSquare(self.posPontos[1],self.posPontos[2],30,'white');
		--self.img:setTexto(self.pontos, self.posPontos[1], self.posPontos[2], 'red', self.fonte);
		self.img:atualizar();
		--self.img:limpar();
		self.flag = true;
	end
	return self.img;
end


function Jogo:getPlacar()
	return self.pl;
end

function Jogo:setPlacar(pla)
	self.pl[1] = pla[1];
	self.pl[2] = pla[2];
end

function Jogo:setSquare(num)
	self.pos = num;
end

function Jogo:getSquare(num)
	return self.pos;
end

function Jogo:getTimes()
	return {self.time1,self.time2};
end

function Jogo:getJogo()
	return nil;
end

function Jogo:unSet()
	self.pos = 0;
end

function Jogo:getPos()
	return self.pos;
end
