--Proximas versoes adicionar comandos para editar o tamanho da screen;
module ('tools', package.seeall)

Tools = {}
Class_Metatable = { __index = Tools }

function Tools:new ()
	local temp = {}
	setmetatable ( temp, Class_Metatable )
    return temp;
end

--Retorna a altura da tela que esta sendo utilizada pelo jogo;
function Tools:getScreenHeigth()
	local w,h = canvas:attrSize();
	return h;
end

--Retorna a largura da tela que esta sendo utilizada pelo jogo;
function Tools:getScreenWidth()
	local w,h = canvas:attrSize();
	return w;
end

--Executa uma funcao 'func' depois de um tempo 'time'; 
function Tools:timer(time,func)
	event.timer(time,func);
end
