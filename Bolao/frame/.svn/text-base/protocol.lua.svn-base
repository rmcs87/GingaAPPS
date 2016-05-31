local 	_G, tonumber,coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, xml,		  fase			,jogo			,rank
	  = _G, tonumber,coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'xml',require 'fase',require 'jogo',require 'rank'

module 'protocol';

id = 0;
idFases = {'A','B','C','D','E','F','G','H','8','4','2','1'};

function askRanking()
	id = id +1;

	return '<app><head><id>'..id..'</id><message-type>requisition</message-type></head><content>GET_SHOTS</content></app>';
end

function askShots()
	id = id +1;

	return '<app><head><id>'..id..'</id><message-type>requisition</message-type></head><content>GET_RANK</content></app>';
end

function authentication(user,md5)
	id = id +1;

	return '<app><head><id>'..id..'</id><message-type>authentication</message-type></head><content><username>'..user..'</username>'..md5..'</content></app>';
end

function makeShots(fases)
	id = id +1;
	pro = '<app><head><id>'..id..'</id><message-type>attribution</message-type></head><content>';
	
	for i = 1,#fases do
		pro = pro..'<phase><id>'..idFases[i]..'</id>';
		pro = pro..'<games>';
			for j = 1, #fases[i]:getJogos() do
				pro = pro..'<game>';
				
				pro = pro..'<team>';
				pro = pro..'<id>'..fases[i]:getJogos()[j]:getTimes()[1]..'</id>';
				pro = pro..'<score>'..fases[i]:getJogos()[j]:getPlacar()[1]..'</score>';
				pro = pro..'</team>';
				
				pro = pro..'<team>';
				pro = pro..'<id>'..fases[i]:getJogos()[j]:getTimes()[2]..'</id>';
				pro = pro..'<score>'..fases[i]:getJogos()[j]:getPlacar()[2]..'</score>';
				pro = pro..'</team>';
				
				pro = pro..'</game>';
			end
		pro = pro..'</games></phase>'; 
	end
	
	pro = pro ..'</content></app>'; 
	return pro;
end

function translate(xm)
	local tabela = xml.collect(xm);
	--conteudo do id da head;
	print('TIPO DE MENSGEM = '..tabela[1][1][2][1]);
	
	if tabela[1][1][2][1] == 'AUTHENTICATION' then
		return 'AUTHENTICATION',tabela[1][1][1][1],tabela[1][2][1][1];
	elseif tabela[1][1][2][1] == 'CONFIRMATION' then
		return 'CONFIRMATION',tabela[1][1][1][1],tabela[1][2][1][1];
	elseif tabela[1][1][2][1] == 'ANSWER_SHOTS' then
		local phases = {};
		for i = 1, #tabela[1][2][1] do
			--imprime o id da fase
			print('Fase = '..tabela[1][2][1][i][1][1]);
			table.insert(phases, fase.Fase:new(tabela[1][2][1][i][1][1], 'head', 'bottom', {0,0}));
			for j = 1, #tabela[1][2][1][i][2] do
				print('id Jogo' .. tabela[1][2][1][i][2][j][1][1] )
				
				local gid = tabela[1][2][1][i][2][j][1][1] + 0;				

				phases[i]:addJogo(jogo.Jogo:new( gid ,false));
				print('times = '..tabela[1][2][1][i][2][j][2][1][1]..' x '..tabela[1][2][1][i][2][j][3][1][1])
				print('Placar = '..tabela[1][2][1][i][2][j][2][2][1]..' x '..tabela[1][2][1][i][2][j][3][2][1])
				--print(#tabela[1][2][1][2])
			end
		end
		
		return 'ANSWER_SHOTS', phases;
	elseif tabela[1][1][2][1] == 'ANSWER_RANK' then
		local ranks = rank.Rank:new();
		
		local me = {}		
		
		print('me = '..tabela[1][2][1][1][1][1]..' '..tabela[1][2][1][1][2][1]..' '..tabela[1][2][1][1][3][1]);
		
		for i = 1, #tabela[1][2][1][2] do
			print('USER ' .. tabela[1][2][1][2][i][1][1])
			ranks:addRank(tabela[1][2][1][2][i][3][1] + 0, tabela[1][2][1][2][i][1][1] , tabela[1][2][1][2][i][2][1] + 0);				
		end
		
		ranks:addRank(tabela[1][2][1][1][3][1] + 0, tabela[1][2][1][1][1][1] , tabela[1][2][1][1][2][1] + 0);
		
		return 'ANSWER_RANK', ranks;
	elseif tabela[1][1][2][1] == 'ERROR' then
		return 'ERROR', tabela[1][1][1][1] ,tabela[1][2][1][1];
	end
	
end








