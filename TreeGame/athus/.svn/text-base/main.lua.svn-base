--IMPORTS
local sprite = require'sprite'
local animation = require'animation'
local pad = require'pad'
local sequences = require'sequences'
local trashes = require'trashes'
local bottles = require'bottles'

--Variaveis
running = false;							--Variavel para controlar se o avatar corre ou não;
keys = nil;									--Variavel para armazenar as teclas utilizadas;
p1 = pad.Pad:new();							-- Cria um novo controle;
status = 'begin';							-- Values: (mt,mtm,,su,mb,mbm,drop,wrong,end);
nextPoint = trashes.ts[1][1];				-- valor usado para o deslocamento automatico;
nextPoint:nextFrame();
nextPoint:setPosition({nextPoint:getPosition()[1],nextPoint:getPosition()[2] + 5});
wasBottle = false;
focoT = 1;									-- diz em que lixo mirando;
focoB = 0;									-- diz em que lixeira esta mirando;
treeFrame = 0;								-- estado da arvore de acordo com os acertos;

anaki = sprite.Sprite:new('imgs/anaki.png' , 2575 , 116 , 103 , 116);	-- Cria os sprites do anaximandro;
anaki:setPosition({nextPoint:getPosition()[1] , 156});
bg = sprite.Sprite:new('imgs/bggame.png' , 720 , 480 , 720 , 480);		-- Cria o bg do jogo;
wind = sprite.Sprite:new('imgs/wind.png' , 570 , 136 , 95 , 136);		-- Cria os sprites do vento;
wind:setPosition({0,294});
wind:setAlive(false);
cloud = sprite.Sprite:new('imgs/cloud.png' , 678 , 141 , 226 , 141);	-- Cria os sprites da nuvem;
cloud:setPosition({nextPoint:getPosition()[1]-76 , 156});
tree = sprite.Sprite:new('imgs/tree.png' , 1832 , 229 , 229 , 229);		-- Cria os sprites da arvore;
tree:setPosition({184,215});

congrats = sprite.Sprite:new('imgs/parabens.png' , 462 , 103 , 462 , 103);	-- Cria a frase final;
congrats:setPosition({130,-103});
congrats:setAlive(false);

did = sprite.Sprite:new('imgs/conseguiu.png' , 451 , 31 , 451 , 31);		-- Cria a frase final;
did:setPosition({130,-150});
did:setAlive(false);

coloridos = sprite.Sprite:new('imgs/coloridos.png' , 451 , 31 , 451 , 31);		-- Cria a frase final;
coloridos:setPosition({300,-150});
coloridos:setAlive(false);

direcionais = sprite.Sprite:new('imgs/direcionais.png' , 124 , 32 , 31 , 32);		-- Cria a frase final;
direcionais:setPosition({322,292});
direcionais:setAlive(true);

bgBegin = sprite.Sprite:new('imgs/bgStart.jpeg' , 720 , 480 , 720 , 480);		-- Cria a frase final;
bgBegin:setPosition({0,0});
bgBegin:setAlive(true);

a1 = animation.Animation:new();				-- Cria a animcao;
a1:setPeriod(100);							-- Seta o periodo;

--FUNCOES

-- Funcao de atualizacao;
function update()
	-- Variaveis de controle das teclas; 
	
	keys = {p1:getKey('CURSOR_LEFT') , 
			p1:getKey('CURSOR_RIGHT') , 
			p1:getKey('ENTER'), 
			p1:getKey('RED'),
			p1:getKey('GREEN'),
			p1:getKey('YELLOW'),
			p1:getKey('BLUE'),
			p1:getKey('0'),
		};
	cloud:nextFrame();
	if  status == 'begin' then
		if sequences.auxBegin == true then
			direcionais:setFrame(sequences.seqBegin[1]);
			sequences.auxBegin = false;
		else
			direcionais:setFrame(sequences.seqBegin[2]);
			sequences.auxBegin = true;
		end
		if keys[1] == 'press' or keys[2] == 'press' or keys[3] == 'press' then
			bgBegin:setAlive(false);
			direcionais:setAlive(false);
			status = 'mt';				
		end
	elseif status == 'mt' then
		direcionais:setAlive(true);
		direcionais:setPosition({nextPoint:getPosition()[1]+35,120});
		direcionais:setFrame(3);
		if keys[1] == 'press' then
			if focoB == 0 and wasBottle == false then
				nextPoint:nextFrame();
				nextPoint:setPosition({nextPoint:getPosition()[1],nextPoint:getPosition()[2] + 5});
			elseif wasBottle == true then
				wasBottle = false
			end			
			nextPoint,focoT = trashes.getPosLeft(anaki:getPosition()[1],focoT,nextPoint);
			anaki:setSpeed({-10,0});
			cloud:setSpeed({-10,0});
			status = 'mtm';
			direcionais:setAlive(false);
		elseif keys[2] == 'press' then
			if focoB == 0 and wasBottle == false then
				nextPoint:nextFrame();
				nextPoint:setPosition({nextPoint:getPosition()[1],nextPoint:getPosition()[2] + 5});
			elseif wasBottle == true then
				wasBottle = false
			end	
			nextPoint,focoT = trashes.getPosRight(anaki:getPosition()[1],focoT,nextPoint);
			anaki:setSpeed({10,0});
			cloud:setSpeed({10,0});
			status = 'mtm';
			direcionais:setAlive(false);
		elseif keys[3] == 'press' and focoT ~= 0 then
			trashes.ts[focoT][1]:setSpeed({0.75,-15});
			wind:setAlive(true);
			status = 'su';
			direcionais:setAlive(false);
		elseif keys[8] == 'press' and focoT ~= 0 then
			congrats:setAlive(true);
			direcionais:setAlive(false);
			did:setAlive(true);
			congrats:setSpeed({0,40});
			did:setSpeed({0,40});
			status = 'end';
		end
		
	elseif status == 'mtm' then
			
		local speedTemp = anaki:getSpeed();
		local positionTemp = anaki:getPosition();
		
		local speedTemp2 = cloud:getSpeed();
		local positionTemp2 = cloud:getPosition();
		
		if (anaki:getSpeed()[1] > 0 and anaki:getPosition()[1] + anaki:getSpeed()[1] < nextPoint:getPosition()[1]) or (anaki:getSpeed()[1] < 0 and anaki:getPosition()[1] + anaki:getSpeed()[1] > nextPoint:getPosition()[1]) then		
			
			if anaki:getSpeed()[1] > 0 then
				anaki:setFrame(sequences.right[sequences.auxr]);
				if sequences.auxr < #sequences.right-1 then
					sequences.auxr = sequences.auxr + 1;				
				end
			else
				anaki:setFrame(sequences.left[sequences.auxl]);
				if sequences.auxl < #sequences.left-1 then
					sequences.auxl = sequences.auxl + 1;				
				end
			end
			
			anaki:setPosition({positionTemp[1] + speedTemp[1] , positionTemp[2] + speedTemp[2]});
			cloud:setPosition({positionTemp2[1] + speedTemp2[1] , positionTemp2[2] + speedTemp2[2]});
		else 
			anaki:setPosition({nextPoint:getPosition()[1] , positionTemp[2] + speedTemp[2]});
			cloud:setPosition({nextPoint:getPosition()[1]-76 , positionTemp2[2] + speedTemp2[2]});
			wind:setPosition({nextPoint:getPosition()[1] , 294});
			
			anaki:setSpeed({0,0});
			cloud:setSpeed({0,0});
			wind:setSpeed({0,0});
			
			sequences.auxr = 1;
			sequences.auxl = 1;	
			anaki:setFrame(0);	
			
			if focoB == 0 then
				nextPoint:nextFrame();
				nextPoint:setPosition({nextPoint:getPosition()[1],nextPoint:getPosition()[2] - 5});	
			end
			status = 'mt'; 
		end		
		
	elseif status == 'su' then
		
		local speedTemp = trashes.ts[focoT][1]:getSpeed();
		local positionTemp = trashes.ts[focoT][1]:getPosition();
		
		if trashes.ts[focoT][1]:getPosition()[2] > anaki:getPosition()[2] + anaki:getHeight() then
			trashes.ts[focoT][1]:setPosition({positionTemp[1] + speedTemp[1] , positionTemp[2] + speedTemp[2]});
			anaki:setFrame(sequences.sugar[sequences.auxs]);
			if sequences.auxs < #sequences.sugar-1 then
				sequences.auxs = sequences.auxs + 1;				
			end
			wind:nextFrame();
		else
			trashes.ts[focoT][1]:setSpeed({0,0});
			wind:setAlive(false);
			anaki:setFrame(0);
			sequences.auxs = 1;
			focoB = 0;
			status = 'mb';
		end		
	
	elseif status == 'mb' then
		coloridos:setAlive(true);
		coloridos:setPosition({nextPoint:getPosition()[1]+25,130});
		if keys[1] == 'press' then
			nextPoint,focoB = bottles.getPosLeft(anaki:getPosition()[1],focoB,nextPoint);
			anaki:setSpeed({-10,0});
			trashes.ts[focoT][1]:setSpeed({-10,0});
			cloud:setSpeed({-10,0});
			status = 'mbm';
			coloridos:setAlive(false);
		elseif keys[2] == 'press' then
			nextPoint,focoB = bottles.getPosRight(anaki:getPosition()[1],focoB,nextPoint);
			anaki:setSpeed({10,0});
			trashes.ts[focoT][1]:setSpeed({10,0});
			cloud:setSpeed({10,0});
			status = 'mbm';
			coloridos:setAlive(false);
		elseif keys[3] == 'press' and focoB ~= 0 then
			if trashes.ts[focoT][2] == bottles.bs[focoB][2] then
				trashes.ts[focoT][1]:setSpeed({0,10});				
				treeFrame = treeFrame + 1;
				tree:setFrame(sequences.treeSequence[treeFrame]); 
				status = 'drop';
			else
				status = 'wrong';
			end
			coloridos:setAlive(false);
		elseif keys[4] == 'press' then
			nextPoint,focoB = bottles.getPosColor('red');
			if anaki:getPosition()[1] < nextPoint:getPosition()[1] then
				anaki:setSpeed({10,0});
				trashes.ts[focoT][1]:setSpeed({10,0});
				cloud:setSpeed({10,0});
			else
				anaki:setSpeed({-10,0});
				trashes.ts[focoT][1]:setSpeed({-10,0});
				cloud:setSpeed({-10,0});
			end
			status = 'mbm';
			coloridos:setAlive(false);
		elseif keys[5] == 'press' then
			nextPoint,focoB = bottles.getPosColor('green');
			anaki:setSpeed({10,0});
			cloud:setSpeed({10,0});
			trashes.ts[focoT][1]:setSpeed({10,0});
			if anaki:getPosition()[1] < nextPoint:getPosition()[1] then
				anaki:setSpeed({10,0});
				trashes.ts[focoT][1]:setSpeed({10,0});
				cloud:setSpeed({10,0});
			else
				anaki:setSpeed({-10,0});
				trashes.ts[focoT][1]:setSpeed({-10,0});
				cloud:setSpeed({-10,0});
			end			
			status = 'mbm';
			coloridos:setAlive(false);
		elseif keys[6] == 'press' then
			nextPoint,focoB = bottles.getPosColor('yellow');
			anaki:setSpeed({10,0});
			cloud:setSpeed({10,0});
			trashes.ts[focoT][1]:setSpeed({10,0});
			if anaki:getPosition()[1] < nextPoint:getPosition()[1] then
				anaki:setSpeed({10,0});
				trashes.ts[focoT][1]:setSpeed({10,0});
				cloud:setSpeed({10,0});
			else
				anaki:setSpeed({-10,0});
				trashes.ts[focoT][1]:setSpeed({-10,0});
				cloud:setSpeed({-10,0});
			end
			status = 'mbm';
			coloridos:setAlive(false);
		elseif keys[7] == 'press' then
			nextPoint,focoB = bottles.getPosColor('blue');
			anaki:setSpeed({10,0});
			trashes.ts[focoT][1]:setSpeed({10,0});
			cloud:setSpeed({10,0});
			if anaki:getPosition()[1] < nextPoint:getPosition()[1] then
				anaki:setSpeed({10,0});
				trashes.ts[focoT][1]:setSpeed({10,0});
				cloud:setSpeed({10,0});
			else
				anaki:setSpeed({-10,0});
				trashes.ts[focoT][1]:setSpeed({-10,0});
				cloud:setSpeed({-10,0});
			end
			status = 'mbm';
			coloridos:setAlive(false);
		end
	
	elseif status == 'mbm' then
		
		local speedTempA = anaki:getSpeed();
		local positionTempA = anaki:getPosition();		
		
		local speedTempB = trashes.ts[focoT][1]:getSpeed();
		local positionTempB = trashes.ts[focoT][1]:getPosition();
		
		local speedTemp3 = cloud:getSpeed();
		local positionTemp3 = cloud:getPosition();
		
		if (anaki:getSpeed()[1] > 0 and anaki:getPosition()[1] + anaki:getSpeed()[1] < nextPoint:getPosition()[1]) or (anaki:getSpeed()[1] < 0 and anaki:getPosition()[1] + anaki:getSpeed()[1] > nextPoint:getPosition()[1]) then	 			
			anaki:setPosition({positionTempA[1] + speedTempA[1] , positionTempA[2] + speedTempA[2]});			
			cloud:setPosition({positionTemp3[1] + speedTemp3[1] , positionTemp3[2] + speedTemp3[2]});		
			trashes.ts[focoT][1]:setPosition({positionTempB[1] + speedTempB[1] , positionTempB[2] + speedTempB[2]});
			
			if anaki:getSpeed()[1] > 0 then
				anaki:setFrame(sequences.right[sequences.auxr]);
				if sequences.auxr < #sequences.right-1 then
					sequences.auxr = sequences.auxr + 1;				
				end
			else
				anaki:setFrame(sequences.left[sequences.auxl]);
				if sequences.auxl < #sequences.left-1 then
					sequences.auxl = sequences.auxl + 1;				
				end
			end
		else 
			anaki:setPosition({nextPoint:getPosition()[1] , positionTempA[2] + speedTempA[2]});
			cloud:setPosition({nextPoint:getPosition()[1]-76 , positionTemp3[2] + speedTemp3[2]});
			
			anaki:setSpeed({0,0});
			cloud:setSpeed({0,0});
			
			-- +13 para poder cair em cima do lixo, e nao meio de lado;
			trashes.ts[focoT][1]:setPosition({nextPoint:getPosition()[1] + 13 , positionTempB[2] + speedTempB[2]});
			trashes.ts[focoT][1]:setSpeed({0,0});
			
			sequences.auxr = 1;
			sequences.auxl = 1;	
			anaki:setFrame(0);	
			
			
			if trashes.ts[focoT][2] == bottles.bs[focoB][2] then
				trashes.ts[focoT][1]:setSpeed({0,10});				
				treeFrame = treeFrame + 1;
				tree:setFrame(sequences.treeSequence[treeFrame]); 
				status = 'drop';
			else
				status = 'wrong';
			end
			coloridos:setAlive(false); 
		end	
	
	elseif status == 'drop' then
		
		local speedTemp = trashes.ts[focoT][1]:getSpeed();
		local positionTemp = trashes.ts[focoT][1]:getPosition();
		
		if trashes.ts[focoT][1]:getPosition()[2] < bottles.bs[focoB][1]:getPosition()[2] then
			trashes.ts[focoT][1]:setPosition({positionTemp[1] + speedTemp[1] , positionTemp[2] + speedTemp[2]});
			anaki:setFrame(sequences.sugar[sequences.auxs]);
			if sequences.auxs < #sequences.sugar-1 then
				sequences.auxs = sequences.auxs + 1;				
			end
		else
			trashes.ts[focoT][1]:setSpeed({0,0});
			table.remove(trashes.ts,focoT);
			if #trashes.ts > 0 then
				focoT = 0;
				focoB = 0;	
				wasBottle = true;			
				status = 'mt';
			else
				congrats:setAlive(true);
				did:setAlive(true);
				congrats:setSpeed({0,20});
				did:setSpeed({0,20});
				status = 'end';
			end
			anaki:setFrame(0);
			sequences.auxs = 1;
		end
		
	elseif status == 'wrong' then
		
		anaki:setFrame(sequences.con[sequences.auxc]);
		if sequences.auxc < #sequences.con-1 then
			sequences.auxc = sequences.auxc + 1;
		else			
			anaki:setFrame(0);
			sequences.auxc = 1;
			
			status = 'mb';	
		end		
	
	elseif status == 'end' then
				
		anaki:setFrame(sequences.pro[sequences.auxp]);
		if sequences.auxp < #sequences.pro-1 then
			sequences.auxp = sequences.auxp + 1;
		end
		
		if congrats:getPosition()[2] < 60 and sequences.finish1 > 0 then
			congrats:setPosition({congrats:getPosition()[1],congrats:getPosition()[2] + congrats:getSpeed()[2]});
		elseif congrats:getPosition()[2] >= 60 and sequences.finish1 > 0 then
			sequences.finish1 = sequences.finish1*(-1);
			congrats:setSpeed({0,-20});
		elseif congrats:getPosition()[2] > 22 and sequences.finish1 < 0 then
			congrats:setPosition({congrats:getPosition()[1],congrats:getPosition()[2] + congrats:getSpeed()[2]});
		end
		
		if did:getPosition()[2] < 152 and sequences.finish2 > 0 then
			did:setPosition({did:getPosition()[1],did:getPosition()[2] + did:getSpeed()[2]});
		elseif did:getPosition()[2] >= 152 and sequences.finish2 > 0 then
			sequences.finish2 = sequences.finish2*(-1);
			did:setSpeed({0,-20});
		elseif did:getPosition()[2] > 123 and sequences.finish2 < 0 then
			did:setPosition({did:getPosition()[1],did:getPosition()[2] + did:getSpeed()[2]});
		else
			event.timer(5000,function()	
								event.post{
									class  = 'ncl',
									type   = 'presentation',
									label  = 'lua',
									action = 'stop',
								}
							end);
		end
		
		
	end
	
end

-- Funcao de desenho do avatar;
function draw()
	if status ~= 'begin' then
		canvas:clear();
		aux = nil;
		
		aux = bg:getPosition();	
		canvas:compose(aux[1],aux[2],bg:getImg());
		aux = cloud:getPosition();
		canvas:compose(aux[1],aux[2],cloud:getImg());
		aux = anaki:getPosition();
		canvas:compose(aux[1],aux[2],anaki:getImg());
		if wind:isAlive() then
			aux = wind:getPosition();
			canvas:compose(aux[1],aux[2],wind:getImg());
		end
				
		aux = tree:getPosition();
		canvas:compose(aux[1],aux[2],tree:getImg());
		
		if did:isAlive() then
			aux = did:getPosition();
			canvas:compose(aux[1],aux[2],did:getImg());
		end
		if congrats:isAlive() then
			aux = congrats:getPosition();
			canvas:compose(aux[1],aux[2],congrats:getImg());
		end
		if coloridos:isAlive() then
			aux = coloridos:getPosition();
			canvas:compose(aux[1],aux[2],coloridos:getImg());
		end
		if direcionais:isAlive() then
			aux = direcionais:getPosition();
			canvas:compose(aux[1],aux[2],direcionais:getImg());
		end
		
		for i = 1, #bottles.bs do
			aux = bottles.bs[i][1]:getPosition();
			canvas:compose(aux[1],aux[2],bottles.bs[i][1]:getImg());
		end
		for i = 1, #trashes.ts do
			aux = trashes.ts[i][1]:getPosition();
			canvas:compose(aux[1],aux[2],trashes.ts[i][1]:getImg());
		end
		
		canvas:flush();
	else
		canvas:clear();
		if bgBegin:isAlive() then
			print('begin');
			aux = bgBegin:getPosition();
			canvas:compose(aux[1],aux[2],bgBegin:getImg());
		end
		if direcionais:isAlive() then
			aux = direcionais:getPosition();
			canvas:compose(aux[1],aux[2],direcionais:getImg());
		end
		canvas:flush();
	end
end

-- inicia loop;
a1:start(update,draw);
