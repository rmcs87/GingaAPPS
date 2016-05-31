local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, text
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable, getmetatable, require 'text'

module 'keyListener';

left, right, up, down, ok, exit = nil;
setText = nil; 
status = 'listener';
input = '';
charac = '';
adicionar = true;
stopped = false;
tipo = 'alfa';

--Verifica se a tecla é compativel com o sistema
function teclaValida(tecla)
	if tecla == 'ENTER' or tecla == 'CURSOR_RIGHT' or tecla == 'CURSOR_LEFT' or tecla == 'CURSOR_UP'
		--or tecla == 'CURSOR_DOWN' or tecla == 'INFO' or tecla == 'ENTER' or tecla == 'MENU'
		or tecla == 'CURSOR_DOWN' or tecla == 'ENTER'
		or tecla == '9' or tecla == '8' or tecla == '7' or tecla == '6' or tecla == '5'
		or tecla == '4' or tecla == '3' or tecla == '2' or tecla == '1' or tecla == '0'
		or tecla == 'RED' or tecla == 'GREEN' or tecla == 'YELLOW' or tecla == 'BLUE'
		or tecla == 'x' or tecla == 'c' or tecla == 'v' or tecla == 'b' or tecla == 'e'
			then
		return true
	else
		return false
	end
end

function startListener(leftF, rightF, upF, downF, okF, numericoF, exitF, redF, greenF, yellowF, blueF)
	left, right, up, down, ok, numerico , exit, red, green, yellow, blue = leftF, rightF, upF, downF, okF, numericoF, exitF, redF, greenF, yellowF, blueF;
end

function startKeyboard(set,t,textoInicial)
	input = textoInicial;
	setText = set;
	status = 'board';
	tipo = t;
end

function stopKeyboard()
	status = 'listener';
end

function stopListener()
	stopped = true;
end

function restartListener()
	stopped = false;
end

-- Funcao de tratamento de eventos:
function listener (evt)
	if stopped then
		return;
	end
	if evt.class == 'key' and teclaValida(evt.key) and evt.type == 'press' then
		if status == 'listener' then
			if evt.key == 'CURSOR_LEFT' then
				left();
			elseif evt.key == 'CURSOR_RIGHT' then
				right();
			elseif evt.key == 'CURSOR_DOWN' then
				down();
			elseif evt.key == 'CURSOR_UP' then
				up();
			elseif evt.key == 'ENTER' then
				ok();
			elseif evt.key == '1' or evt.key == '2' or evt.key == '3' or evt.key == '4' or evt.key == '5' or evt.key == '6' or evt.key == '7' or evt.key == '8' or evt.key == '9' or evt.key == '0' then
				numerico(evt.key);
			elseif evt.key == 'e' then
				exit();
			elseif evt.key == 'RED' then
			--elseif evt.key == 'x' then
				red();
			elseif evt.key == 'GREEN' then
			--elseif evt.key == 'c' then
				green();
			elseif evt.key == 'YELLOW' then
			--elseif evt.key == 'v' then
				yellow();
			elseif evt.key == 'RED' then
			--elseif evt.key == 'b' then
				blue();
			end
		elseif status == 'board' then
		
			text.setTipo(tipo);
		
			if evt.key == 'ENTER' then
				
				status = 'listener'
				input = '';
			
				return
			end
		
			adicionar,charac = text.caracter(evt.key)			
			
			if adicionar==true then
				input = input..charac
			elseif string.len(input) > 0 then
				input = string.sub(input, 0 , string.len(input)-1)..charac;
			end
			
			setText(input);
		end				
	end
end
event.register(listener)
