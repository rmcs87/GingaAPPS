require 'login'
require 'keyListener'

lo = login.Login:new('midia/flags/01.png', 'midia/fundo/par.png', 'midia/fundo/impar.png', 0, 0, 0, 75, 0, 100);

canvas:compose(0, 0, lo:desenhaLogin():getImg());
--canvas:compose(0,0,canvas:new('midia/hbs/head.png'));
canvas:flush();

function left()
	print('LEFT');
end

function right()
	print('RIGHT');
end

function up()
	print('UP');
	keyListener.startKeyboard(function(text) print(text); lo:setText(text); canvas:compose(0, 0, lo:desenhaLogin():getImg()); canvas:flush(); end,'alfa', lo:getFoco())
end

function down()
	print('DOWN');
	lo:action('down');
	canvas:compose(0, 0, lo:desenhaLogin():getImg());
	--canvas:compose(0,0,canvas:new('midia/hbs/head.png'));
	canvas:flush();
end

function ok()
	print('OK');
end

function exit()
	print('EXIT');
end

keyListener.startListener(left, right, up, down, ok, exit);