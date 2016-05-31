local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable,componente			,engine
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable,require 'componente',require 'engine'


print('TESTE1');

co = componente.Componente:new('midia/p1.png');

s1 = engine.Engine:new();
print('TESTE2')

s1:buffer(co);

--s1:limpar(co);

s1:atualizar();

--canvas:compose(200,200,co:getImg());
--canvas:flush();
