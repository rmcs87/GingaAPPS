local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable,efeitos
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable,require 'efeitos'


print('TESTE1');

ef = efeitos.Efeitos:new();
co = componente.Componente:new('midia/p1.png');

--ef:slideR(co,{0,0},{200,200});

--ef:slideL(co,{200,200},{0,0});

--ef:slideD(co,{100,100},{300,300});

ef:slideU(co,{300,300},{100,100});
