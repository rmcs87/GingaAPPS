local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable
	  = _G, coroutine, event, assert, pairs, type, string, math, table, io, print, table, setmetatable

module 'anim';

function start(update)
	update();
end

local config = {
				funcUpdate,
				funcDraw,
				running = false,					--Para controle da animacao
				NO_DELAYS_PER_YIELD = 100,			--delays maximos
				MAX_FRAME_SKIPS = 5,				--no. of frames that can be skipped in any one animation loop i.e the games state is updated but not rendered
			}
local times = {
				before,timeDiff,sleep,after,
				overSleep = 0,
				delays = 0,
				period = 67,
				excess = 0,
			}

--Inicia tudo
function start(update,draw)
	config.funcUpdate = update;
	config.funcDraw = draw;
	config.running = true;
	times.before = event.uptime();
	run();
end

--Para o jogo
function stop()
	config.running = false;
end

--atualiza o jogo
function gameUpdate()
	config.funcUpdate();
end

function gameBuffer()
	config.funcDraw();
end

function run()
	if config.running then
		gameUpdate();
		gameBuffer();

		times.after = event.uptime();
		times.timeDiff = times.after - times.before;
		times.sleep = (times.period - times.timeDiff) - times.overSleep;

		if times.sleep > 0 then --update/render took longer than period
			event.timer(times.sleep, runAux2);
		else
			times.overSleep = 0;
			times.delays = times.delays + 1;
			if times.delays >= config.NO_DELAYS_PER_YIELD then
				times.delays = 0;
				--liberar thread para outras coisas ... como???
			end
			runAux();
		end

	end
end
--auxiliar para calculo de erros do timer
function runAux2()
	times.excess = times.excess - times.sleep;
	times.overSleep = (event.uptime() - times.after) - times.sleep;
	runAux();
end
function runAux()
	times.before = event.uptime();

	local skips = 0;
	while((times.excess > times.period) and (skips < config.MAX_FRAME_SKIPS)) do
		times.excess = times.excess - times.period;
		gameUpdate(); 		--update state but don't render
		skips= skips + 1;
	end

	run();
end

function getFps()
--print(1000/times.period)
	return (1000/times.period);
end
