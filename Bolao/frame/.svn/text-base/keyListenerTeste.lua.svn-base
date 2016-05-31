local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, keyListener
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, require 'keyListener'
tex = '';

function texto(string)
	tex = string;
	print(tex);
end

function left()
	print('LEFT');
end

function right()
	print('RIGHT');
end

function up()
	print('UP');
	keyListener.startKeyboard(texto,'num')
end

function down()
	print('DOWN');
end

function ok()
	print('OK');
end

function exit()
	print('EXIT');
end

keyListener.startListener(left, right, up, down, ok, exit);