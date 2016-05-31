local 	_G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, anim, 		  engine, 		 componente		      ,keyListener		   ,efeitos
	  = _G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require'anim', require'engine',require 'componente',require'keyListener',require'efeitos'

module 'menu';

tw, th = 0,0;
eng = nil;
ef = nil;
status = '';
pontuacao = 0;
perguntas = {};
head = componente.Componente:new('midia/head.png');
nPerguntas = 7;
pergAtual = 0;
gabarito = {1,2,3,4,4,4,4};
respostas = {0,0,0,0,0,0,0};
posMenu = {849 , 32};
pontos = 0;
res = nil;
sin = nil;
bola = nil;
velo = 50;

function fim()
	for k = 1,nPerguntas do
		if respostas[k] == 0 then
			return
		end
	end
	status = 'fim';
	for k = 1,nPerguntas do
		if respostas[k]>0 then
			pontos = pontos + 1;
		end
	end
	res:setTexto(pontos..'', 100,100);
	ef:slideL(res, {tw , posMenu[2]} , {posMenu[1],posMenu[2]});	
end

function init()
	eng = engine.Engine:new();
	tw,th = eng:getCanvasSize();
	print(tw .. th)
	ef = efeitos.Efeitos:new();
	carregaPerguntas();
	res = componente.Componente:new('midia/res.png');
	sin = componente.Componente:new('midia/sinopse.png');
	bola = componente.Componente:new('midia/bola.png');
	bola:setPosicao({100,20});
	keyListener.startListener(left, right, up, down, ok, numerico, exit, red, green, yellow, blue);
end

function carregaPerguntas()
	for i = 1,nPerguntas do
		table.insert(perguntas,{});
		table.insert(perguntas[i], componente.Componente:new('midia/p'..i..'.png'));
		table.insert(perguntas[i], componente.Componente:new('midia/certo.png'));
		table.insert(perguntas[i], componente.Componente:new('midia/e'..i..'.png'));
	end
end

function left()
	t = bola:getPosicao();
	if status == 'bola' and t[1] > 0 then
		t[1] = t[1] - velo;
		bola:setPosicao(t);
		eng:limpar();
		eng:buffer(bola);
		eng:atualizar();
	end
end

function right()
	t = bola:getPosicao();
	if status == 'bola' and t[1] < tw - bola:getWidth() then
		t[1] = t[1] + velo;
		bola:setPosicao(t);
		eng:limpar();
		eng:buffer(bola);
		eng:atualizar();
	end
end

function up()
	t = bola:getPosicao();
	if status == 'bola' and t[2] > 0 then
		t[2] = t[2] - velo;
		bola:setPosicao(t);
		eng:limpar();
		eng:buffer(bola);
		eng:atualizar();
	end
end

function down()
	t = bola:getPosicao();
	if status == 'bola' and t[2] < th - bola:getHeight() then
		t[2] = t[2] + velo;
		bola:setPosicao(t);
		eng:limpar();
		eng:buffer(bola);
		eng:atualizar();
	end
end

function ok()	
	if status == 'respondido' or status == '' or status == 'fim' or status == 'sinopse' then
		eng:limpar();
		eng:atualizar();
		status = '';
	end
end

function red()
	if status == 'respondendo' then
		if gabarito[pergAtual] == 1 then
			respostas[pergAtual] = 1;
			ef:slideL(perguntas[pergAtual][2],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );		
			status = 'respondido';
		else
			respostas[num] = -1;
			ef:slideL(perguntas[pergAtual][3],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );
			status = 'respondido';
		end
		fim();
	end
end

function green()
	if status == 'respondendo' then
		if gabarito[pergAtual] == 2 then
			respostas[pergAtual] = 1;
			ef:slideL(perguntas[pergAtual][2],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );		
			status = 'respondido';
		else
			respostas[num] = -1;
			ef:slideL(perguntas[pergAtual][3],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );
			status = 'respondido';
		end
		fim();
	end
end

function yellow()
	if status == 'respondendo' then
		if gabarito[pergAtual] == 3 then
			respostas[pergAtual] = 1;
			ef:slideL(perguntas[pergAtual][2],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );		
			status = 'respondido';
		else
			respostas[num] = -1;
			ef:slideL(perguntas[pergAtual][3],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );
			status = 'respondido';
		end
		fim();
	end
end

function blue()
	if status == 'respondendo' then
		if gabarito[pergAtual] == 4 then
			respostas[pergAtual] = 1;
			ef:slideL(perguntas[pergAtual][2],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1],posMenu[2]}
				 );		
			status = 'respondido';
		else
			respostas[num] = -1;
			ef:slideL(perguntas[pergAtual][3],
				 	{tw , posMenu[2]} , 
				 	{posMenu[1] ,posMenu[2]}
				 );
			status = 'respondido';
		end
		fim();
	end
end

function numerico(tecla)
	num = tecla + 0;
	if num <= nPerguntas and respostas[num] == 0 and num~=0 then
		status = 'respondendo';
		pergAtual = num;
		ef:slideDHead(perguntas[num][1],{tw , posMenu[2]} ,{posMenu[1], posMenu[2]},head);
		--ef:slideL(perguntas[num][1], {tw , posMenu[2]} , {posMenu[1], posMenu[2]},head);		 
		
	elseif num == nPerguntas + 1 then
		ef:slideDHead(sin, {tw , posMenu[2]} , {tw - head:getWidth(),posMenu[2]}, head);
		--ef:slideL(sin, {tw , posMenu[2]} , {tw - head:getWidth(),posMenu[2]}, head);
		status = 'sinopse';
	elseif num == 0 then
		if status == 'bola' then
			status = '';
			eng:limpar();
			eng:atualizar();
		else
			status = 'bola';
			eng:limpar();
			eng:buffer(bola);
			eng:atualizar();
		end
	end
end

function exit()
	print('erro propo'..{{}});	
end

init();
