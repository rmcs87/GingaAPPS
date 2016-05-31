local 	_G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, menu, 		   engine, 		   keyListener,		   componente          ,login		   ,conn			,md5		  ,protocol
	  = _G, coroutine, event, canvas, assert, pairs, type, string, math, table, io, print, table, canvas, print, setmetatable, require 'menu' ,require'engine',require'keyListener',require'componente',require 'login',require 'conn'  ,require 'md5',require 'protocol'

module 'main';

status = 'starting';
--status = 'ranking';
--status = 'shots';
statusCon = nil;
--status = 'conectado'
mainMenu = nil;
fasesMenu = nil;
eng = nil;
log = nil;
conexao = nil;
rank = nil;
shots = nil;
faseAtual = nil;

imgPart = componente.Componente:new('midia/ops/participar.png');
imgPart:setPosicao({332,395});
imgReg = componente.Componente:new('midia/ops/regulamento.png');
imgReg:setPosicao({332,396});
imgTab = componente.Componente:new('midia/ops/tabela.png');
imgTab:setPosicao({334,102});

function conListener(msg,data)
	print('MSG === '..msg);
	if msg == 'connected' then
		print('conectou');
		eng:timer(1000,function() 
								--[[print('casa' .. status)
								if status == 'autenticando' then 
									print('casa' .. status)
									log:setMsg('Erro ao Conectar');
									status = 'login';
									conexao:disconnect(); 
								end]]--
								--Para teste
								status = 'conectado';
								mainMenu:removeOp();
				mainMenu:addOp('mainOp41', 'func', function() 
											print('casa')
											status = 'rankingAsk';	
											--conexao:send(protocol:askRanking());
											eng:timer(1000,function() 
													--[[
														print('casa' .. status)
														if status == 'rankingAsk' then 
															print('casa' .. status)
															log:setMsg('Falha ao conectar');
															--exibir erro
															status = 'login';
															conexao:disconnect(); 
														end--]]
													--Para teste
													--[
													status = 'ranking';
													msg, tab = protocol.translate(
														[[
														<app>
														  <head>
														    <id>1</id>
														    <message-type>ANSWER_RANK</message-type>
														  </head>
														  <content>
														    <rank>
														      <me>
														        <login>Dih</login>
														        <score>192</score>
														        <position>10</position>
														      </me>
														      <top>
														      <me>
														        <login>Dih</login>
														        <score>192</score>
														        <position>10</position>
														      </me>
														        <user>
														          <login>Rico</login>
														          <score>190</score>
														          <position>10</position>
														        </user>
														        <user>
														          <login>Tati</login>
														          <score>180</score>
														          <position>10</position>
														        </user>
														        <user>
														          <login>Guido</login>
														          <score>170</score>
														          <position>10</position>
														        </user>

														        <user>
														          <login>Lacet</login>
														          <score>160</score>
														          <position>10</position>
														        </user>

														        <user>
														          <login>Adriano</login>
														          <score>150</score>
														          <position>10</position>
														        </user>

														        <user>
														          <login>Ivan</login>
														          <score>140</score>
														          <position>10</position>
														        </user>

														        <user>
														          <login>Ana</login>
														          <score>20</score>
														          <position>10</position>
														        </user>

														        <user>
														          <login>Kelly</login>
														          <score>10</score>
														          <position>10</position>
														        </user>
														      </top>
														    </rank>
														  </content>
														</app>
														]]
														);
													rank = tab;
													--]]
													--fim do teste
													desenha();
												end);										
									  end);
				mainMenu:addOp('mainOp42', 'func', function() 
											print('casa')
											status = 'shotsAsk';	
											--conexao:send(protocol:askShots());
											eng:timer(1000,function() 
													status = 'shots';
													
													
													
													
													
											local msg, tab = protocol.translate(
					[[
					
					<app>
					  <head>
					    <id>1</id>
					    <message-type>ANSWER_SHOTS</message-type>
					  </head>
					  <content>
					    <phases>
					      <phase>
					        <id>A</id>
					        <games>
					          <game>
					            <id>1</id>
					            <team>
					              <id>3</id>
					              <score>44</score>
					            </team>
					            <team>
					              <id>4</id>
					              <score>44</score>
					            </team>
					          </game>
					          <game>
					            <id>2</id>
					            <team>
					              <id>1</id>
					              <score>44</score>
					            </team>
					            <team>
					              <id>2</id>
					              <score>44</score>
					            </team>
					          </game>
					        </games>
					      </phase>
					      <phase>
					        <id>B</id>
					        <games>
					          <game>
					            <id>3</id>
					            <team>
					              <id>5</id>
					              <score>44</score>
					            </team>
					            <team>
					              <id>6</id>
					              <score>44</score>
					            </team>
					          </game>
					        </games>
					      </phase>
					    </phases>
					  </content>
					</app>			
					]]
			);
													
													
													
									shots = tab;			
													
													
													
													
													
													
													
													desenha();
												end);											
									  end);
								--fim do teste
								desenha();
							end);
	elseif msg == 'received' then
		local m , t1, t2 = protocol.translate(data);
		
		if m == 'AUTHENTICATION' and status == 'autenticando' then
			conexao:send(protocol:authentication(log:getUser(), md5.crypt(t2..':'..md5.crypt(log:getUser()..':'..log:getPass()) ) ));
			status = 'confirmando';			
		elseif m == 'CONFIRMATION' and status == 'confirmando' then
			if t2 == 'SUCESS' then
				status = 'conectado';
				mainMenu:removeOp();
				mainMenu:addOp('mainOp41', 'func', function() 
											print('casa')
											status = 'rankingAsk';	
											conexao:send(protocol:askRanking());
											eng:timer(1000,function() 
													--[
														print('casa' .. status)
														if status == 'rankingAsk' then 
															print('casa' .. status)
															log:setMsg('Falha ao conectar');
															--exibir erro
															status = 'login';
															conexao:disconnect(); 
														end--]]
													--Para teste
													--[[status = 'conectado';
													mainMenu:removeOp();
													mainMenu:addOp('mainOp3', 'img', 'tabela', 0, 100);
													mainMenu:addOp('mainOp3', 'img', 'tabela', 0, 100);]]--
													--fim do teste
													desenha();
												end);										
									  end);
				mainMenu:addOp('mainOp42', 'func', function() 
											print('casa')
											status = 'shotsAsk';	
											conexao:send(protocol:askShots());
											eng:timer(1000,function() 
													--[
														print('casa' .. status)
														if status == 'shotsAsk' then 
															print('casa' .. status)
															log:setMsg('Falha ao conectar');
															--exibir erro
															status = 'login';
															conexao:disconnect(); 
														end--]]
													--Para teste
													--[[status = 'conectado';
													mainMenu:removeOp();
													mainMenu:addOp('mainOp3', 'img', 'tabela', 0, 100);
													mainMenu:addOp('mainOp3', 'img', 'tabela', 0, 100);]]--
													--fim do teste
													desenha();
												end);											
									  end);
			else
				log:setMsg('Erro na Autenticação');
				status = 'login';
				conexao:disconnect();
			end
		elseif m == 'ANSWER_SHOTS' then
			status = 'shots';
			shots = t1;
		elseif m == 'ANSWER_RANK' then
			status = 'ranking';
			rank = t1;
		elseif m == 'ERROR' then
		
		end
		desenha();				
	end
end

function init()
	--[
	
	eng = engine.Engine:new();
	log = login.Login:new('midia/ops/backL.png', 'midia/ops/aOffL.png', 'midia/ops/aOnL.png', 151, 135, 151, 176, 329, 324);
	conexao = conn.Connection:new(conListener);
	event.register(function(evt) conexao:listener(evt); end)
	
	--mainMenu = menu.Menu:new('mainMenu', 245 , 100, 316 , 638, 79, 122);
	--[
	mainMenu = menu.Menu:new('mainMenu', 79 , 31, 316 , 638, 79, 115);
	mainMenu:addOp('mainOp1', 'func', desenhaParticipar, 745, 826);
	mainMenu:addOp('mainOp2', 'func', desenhaRegulamento, 751, 824);
	mainMenu:addOp('mainOp3', 'func', desenhaTabela, 752, 820);
	mainMenu:addOp('mainOp4', 'func', function() --554
											status = 'login';											
									  end);
									  --]]
	--cria Menu de fases, com as 8 fases; fase
	--[
	fasesMenu = menu.Menu:new('bgFases',334,102, 800 , 800 , 79, 122);
	fasesMenu:addOp('f1', 'func', function() 
											print('casa');
											faseAtual = shots[1];
											status = 'palpitando';											
									    end);
	fasesMenu:addOp('f2', 'func', function() 
											print('casa');
											faseAtual = shots[2];
											status = 'palpitando';											
									    end);
	
--]]									    								    									    									    									    	
	--Fim do menu da fases;									    	
	
	keyListener.startListener(left, right, up, down, ok, numerico, exit, red, green, yellow, blue);

	
	status = 'main';
	--status = 'ranking';
	--status = 'shots';
	statusCon = status;
	desenha();
end

function left()
	print(status)
	if status == 'main' or status == 'conectado' or status == 'part' or	status == 'reg' or status == 'tab' then
		mainMenu:action('back');
		print(status)
		if status ~= 'main' or status ~= 'conectado' then
			status = statusCon;
			print('statusCon'..statusCon);
		end  
	elseif status == 'login' then
		status = 'main';
	elseif status == 'ranking' then
		status = 'conectado';
	elseif status == 'shots' then
		fasesMenu:action('back');
		status = 'conectado';
	elseif status == 'palpitando' then
		faseAtual:left();
	end
	desenha();
end

function right()
	if status == 'main' or status == 'conectado' then
		mainMenu:action('ok');
	elseif status == 'login' then
		if log:getFocoIndex() == 1 then
			keyListener.startKeyboard(function(text) log:setText(text); desenha(); end,'alfa', log:getFoco());
		else
			keyListener.startKeyboard(function(text) log:setText(text); desenha(); end,'num', log:getFoco());
		end
	elseif status == 'shots' then
		fasesMenu:action('ok');
	elseif status == 'palpitando' then
		faseAtual:right();
	end
	desenha();
end

function up()
	if status == 'main' or status == 'conectado' then
		mainMenu:action('up');	
	elseif status == 'login' then
		log:action('up');
	elseif status == 'shots' then
		fasesMenu:action('up');
	elseif status == 'palpitando' then
		faseAtual:up();
	end
	desenha();
end

function down()
	if status == 'main' or status == 'conectado' then
		mainMenu:action('down');		
	elseif status == 'login' then
		log:action('down');
	elseif status == 'shots' then
		fasesMenu:action('down');
	elseif status == 'palpitando' then
		faseAtual:down();
	end
	desenha();
end

function ok()	
	right();
end

function red()
	if status == 'palpitando' then
		status = 'shots';
		desenha();
	end
end

function green()
	print('onGreen');
	if status == 'login' then
		status = 'autenticando';
		log:setMsg('autenticando');
		conexao:connect('150.165.132.104',10000);		
	end
	desenha();
end

function yellow()

end

function blue()

end

function numerico(tecla)
	if status == 'palpitando' then
		faseAtual:numerico(tecla);
	end
	desenha();
end

function desenha()
	eng:limpar();
	
	if status == 'login' or status == 'autenticando' then
		eng:buffer(log:desenhaLogin());
	elseif status == 'ranking' then
		eng:buffer(rank:getRank());
	elseif status == 'shots' then
		print('Deveria desenhar o menu de fases');
		eng:buffer(fasesMenu:desenha());
		--eng:buffer(mainMenu:desenha());
	elseif status == 'palpitando' then
		print('DESNHANDO FASSASEEEEEEEEEEEEEEEEEEEEEEEEEEEEES');
		eng:buffer(faseAtual:desenha());
		print('FIMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
	elseif status == 'part'then
		eng:buffer(imgPart);
	elseif status == 'reg' then
		eng:buffer(imgReg);
	elseif status == 'tab' then
		eng:buffer(imgTab);
	--else
		--eng:buffer(mainMenu:desenha());
		--eng:buffer(fasesMenu:desenha());
	end
	--if status ~= 'login' and status ~= 'autenticando' then
	--if status ~= 'palpitando' then
		eng:buffer(mainMenu:desenha());
	--end
	--end
	eng:atualizar();
end 

function desenhaParticipar()
	--eng:buffer(imgPart);
	--eng:atualizar();
	statusCon = status;
	status = 'part';	
	--desenha();
end

function desenhaRegulamento()
	--eng:buffer(imgReg);
	--eng:atualizar();
	statusCon = status;
	status = 'reg';
	--desenha();
end

function desenhaTabela()
	--eng:buffer(imgTab);
	--eng:atualizar();
	statusCon = status;
	status = 'tab';
	--desenha();
end

init()