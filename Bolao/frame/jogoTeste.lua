require 'jogo'
require 'componente'

function f()
	j:setSquare(2,false);
	--canvas:clear();
	canvas:compose(200,200,j:desenha():getImg());
	canvas:flush();
end

function f2()
	j:setPlacar({0,2});
	--canvas:clear();
	canvas:compose(200,200,j:desenha():getImg());
	canvas:flush();
end

j = jogo.Jogo:new(1,true);
j:setSquare(1);

i = jogo.Jogo:new(2,false);

canvas:compose(200,100,j:desenha():getImg());
canvas:compose(200,200,i:desenha():getImg());
canvas:flush();
--canvas:clear();
--event.timer(5000,f);

--event.timer(10000,f2);

print(j:getPlacar()[1]);
print(j:getTimes()[1]);