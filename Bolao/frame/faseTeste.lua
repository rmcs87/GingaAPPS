require 'jogo'
require 'componente'
require 'fase'


f = fase.Fase:new('A', 'head', 'bottom', {0,0});

f:addJogo(jogo.Jogo:new(1,false));
f:addJogo(jogo.Jogo:new(2,true));
f:addJogo(jogo.Jogo:new(3,false));
f:addJogo(jogo.Jogo:new(4,true));
f:addJogo(jogo.Jogo:new(5,false));
f:addJogo(jogo.Jogo:new(6,true));
f:addJogo(jogo.Jogo:new(7,false));
f:addJogo(jogo.Jogo:new(8,true));


--print(f:desenha())

canvas:compose(200,100,f:desenha():getImg());

canvas:flush();

function listener (evt)
	if evt.class == 'key' and evt.type == 'press' then
		print(evt.key)
		if evt.key == 'CURSOR_LEFT' then
			f:left();
			canvas:compose(200,100,f:desenha():getImg());
			canvas:flush();			
		elseif evt.key == 'CURSOR_RIGHT' then
			f:right();
			canvas:compose(200,100,f:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'CURSOR_DOWN' then
			f:down();
			canvas:compose(200,100,f:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'CURSOR_UP' then
			f:up();
			canvas:compose(200,100,f:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'ENTER' then
			--f:ok();
		elseif evt.key == '1' or evt.key == '2' or evt.key == '3' or evt.key == '4' or evt.key == '5' or evt.key == '6' or evt.key == '7' or evt.key == '8' or evt.key == '9' or evt.key == '0' then
			f:numerico(evt.key);
			canvas:compose(200,100,f:desenha():getImg());
			canvas:flush();		
		end		
	end
end
event.register(listener)