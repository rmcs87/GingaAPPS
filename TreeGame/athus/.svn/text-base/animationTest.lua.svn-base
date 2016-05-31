--Neste teste temos duas animações que atualizao valores de variaveis;
--A primeira animacao tem periodo de 1s, enquanto a segunta tem de 0,25s;
--Apos 20 atualizacoes da segunda animacao, esta e pausada e depois retomada;
local animation = require'animation'

x = 0;
y = 0;

--funcao de update 1
function u1()
	if x == 20 then
		y = y + 1;
		x = x + 1;	
		a2:resume();
	else
		x = x + 1;
	end
end

--funcao de desenho 1
function d1()
	print('X = '.. x);
end

--funcao de update 2
function u2()	
	if y == 20 then
		a2:pause();
	else
		y = y + 1;		
	end
end

--funcao de desenho 2
function d2()
	print('Y = ' .. y);
end

--Animação 1
a1 = animation.Animation:new();
a1:setPeriod(1000);
a1:start(u1,d1);

--Animação 2
a2 = animation.Animation:new();
a2:setPeriod(250);
a2:start(u2,d2);
