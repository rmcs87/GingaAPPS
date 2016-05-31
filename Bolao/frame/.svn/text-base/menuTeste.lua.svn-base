require 'menu'
require 'componente'

m2 = menu.Menu:new('agenda_bg',400,400,0,0);
m2:addOp('btn_mensagens', 'func', function() print('casa') end);
m2:addOp('btn_mensagens', 'func', function() print('casa') end);
m2:addOp('btn_mensagens', 'func', function() print('casa') end);

m = menu.Menu:new('agenda_bg',400,400,0,0);

m:addOp('btn_agenda', 'func', function() print('casa') end);
m:addOp('btn_compromissos', 'func', function() print('casa') end);
m:addOp('btn_mensagens', 'sub', m2 );


canvas:compose(0,0,m:desenha():getImg());

canvas:flush();

function listener (evt)
	if evt.class == 'key' and evt.type == 'press' then
		print(evt.key)
		if evt.key == 'CURSOR_LEFT' then
			canvas:clear();
			m:action('back');
			canvas:compose(0,0,m:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'CURSOR_RIGHT' then
			canvas:clear();
			m:action('ok');
			canvas:compose(0,0,m:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'CURSOR_DOWN' then
			canvas:clear();
			m:action('down');
			canvas:compose(0,0,m:desenha():getImg());
			canvas:flush();	
		elseif evt.key == 'CURSOR_UP' then
			canvas:clear();
			m:action('up');
			canvas:compose(0,0,m:desenha():getImg());
			canvas:flush();					
		elseif evt.key == 'ENTER' then
			--f:ok();
		elseif evt.key == '1' or evt.key == '2' or evt.key == '3' or evt.key == '4' or evt.key == '5' or evt.key == '6' or evt.key == '7' or evt.key == '8' or evt.key == '9' or evt.key == '0' then
			--f:numerico(evt.key);
			--canvas:compose(200,100,f:desenha():getImg());
			--canvas:flush();		
		end		
	end
end
event.register(listener)