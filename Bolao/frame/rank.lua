local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, partidas,		  componente
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'partidas',require 'componente'

module 'rank';

Rank = {
			ranks = nil,
			pos = nil,
			img = nil,
			posPos = nil,
			posApe = nil,
			posPon = nil,
			fonte = 20,
			fator = 28,
			fundo = nil,
		}
Class_Metatable = { __index = Rank }

function Rank:new ()

	local temp = {}

    setmetatable ( temp, Class_Metatable )
	
	temp.ranks = {};
	temp.pos = {0,0};
	temp.fundo = componente.Componente:new('midia/fundo/bgRanking.png');
	temp.img = componente.Componente:new('midia/fundo/bgRanking.png');
	--temp.img = componente.Componente:new('', temp.fundo:getWidth(), temp.fundo:getHeight());
	temp.img:setPosicao({333,120});
	temp.posPos = {143,132};
	temp.posApe = {224,132};
	temp.posPon = {576,132};	
	
	return temp;
end

function Rank:addRank(posicao, apelido, pontos)
	table.insert(self.ranks, {posicao..'', apelido..'', pontos..''});
end

function Rank:getRank()
	self.img:limpar();
	local posi = {self.pos[1],132};
	
	self.img:composeImage(0,0,self.fundo:getImg());
	
	for i=1,#self.ranks do
		
		if i == #self.ranks then
			self.img:setTexto(self.ranks[i][1], self.posPos[1], posi[2] + 56, 'green', self.fonte);
			self.img:setTexto(self.ranks[i][2], self.posApe[1], posi[2] + 56, 'green', self.fonte);
			self.img:setTexto(self.ranks[i][3], self.posPon[1], posi[2] + 56, 'green', self.fonte);
		else
			--self.img:setTexto(self.ranks[i][1], self.posPos[1], posi[2], 'red', self.fonte);
			self.img:setTexto(self.ranks[i][2], self.posApe[1], posi[2], 'black', self.fonte);
			self.img:setTexto(self.ranks[i][3], self.posPon[1], posi[2], 'black', self.fonte);
		end
		
		posi[2] = posi[2] + self.fator;
	end
	
	self.img:atualizar();
	return self.img;
end
