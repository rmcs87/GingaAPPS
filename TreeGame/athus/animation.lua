module ('animation', package.seeall)

Animation = {}
Class_Metatable = { __index = Animation }

function Animation:new ()
	local temp = {};
	setmetatable ( temp, Class_Metatable );
	
	--Variaveis de configuracao;
	temp.config = {
				funcUpdate = nil,					--Variavel para guardar a funcao de update;
				funcDraw = nil,						--Variavel para guardar a funcao de desenho;
				running = false,					--Variavel para pausar ou rodar o loop;
				NO_DELAYS_PER_YIELD = 100,			--Máximo de atrasos suportados pelo algoritmo;
				MAX_FRAME_SKIPS = 5,				--No. de frames que podem ser pulados na animcao;
			};
			
	--Variaveis auxiliares para calculos do algoritmo; 
	temp.times = {
				before = 0,
				timeDiff = 0,
				sleep = 0,
				after = 0,
				overSleep = 0,
				delays = 0,
				period = 67,
				excess = 0,
			};
    return temp;
end

--Funcao para salvar as funcoes de update e desenho, e iniciar o loop;
function Animation:start(update,draw)
	self.config.funcUpdate = update;
	self.config.funcDraw = draw;
	self.config.running = true;
	self.times.before = event.uptime();
	self:run();
end

--Funcao de pausa do loop;
function Animation:pause()
	self.config.running = false;
	self:run();
end

--Funcao para retornar o loop;
function Animation:resume()
	self.config.running = true;
	self.times.before = event.uptime();
	self:run();
end

--Funcao para definir um novo periodo de intervalo de cada loop;
function Animation:setPeriod(time)
	self.times.period = time;
end

--Chamada da funcao de update do loop;
function Animation:gameUpdate()
	self.config.funcUpdate();
end

--Chamada de desenho do loop;
function Animation:gameBuffer()
	self.config.funcDraw();
end

--Abaixo o algoritmo de loop adaptado do livro: "Killer Game Programming in Java";
function Animation:run()
	if self.config.running then
		self:gameUpdate();
		self:gameBuffer();

		self.times.after = event.uptime();
		self.times.timeDiff = self.times.after - self.times.before;
		self.times.sleep = (self.times.period - self.times.timeDiff) - self.times.overSleep;

		if self.times.sleep > 0 then
			event.timer(self.times.sleep, function() self:runAux2(); end);
		else
			self.times.overSleep = 0;
			self.times.delays = self.times.delays + 1;
			if self.times.delays >= self.config.NO_DELAYS_PER_YIELD then
				self.times.delays = 0;
				--A ser melhorado;
			end
			self:runAux();
		end

	end
end

function Animation:runAux2()
	self.times.excess = self.times.excess - self.times.sleep;
	self.times.overSleep = (event.uptime() - self.times.after) - self.times.sleep;
	self:runAux();
end

function Animation:runAux()
	self.times.before = event.uptime();

	local skips = 0;
	while((self.times.excess > self.times.period) and (skips < self.config.MAX_FRAME_SKIPS)) do
		self.times.excess = self.times.excess - self.times.period;
		self.gameUpdate();
		skips= skips + 1;
	end

	self:run();
end
