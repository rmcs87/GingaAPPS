require 'protocol'
require 'fase'

--teste 1
--[[
print('PEDIDO DO RANK');
print(protocol.askRanking());

print('PEDIDO DOs PALPITES');
print(protocol.askShots());

print('Autenticacao');
print(protocol.authentication('houdahfahfjabdgasf4a65sf4a5464'));
--]]
--teste 2
--[[
f = fase.Fase:new('A', 'head', 'bottom', {0,0});

f:addJogo(jogo.Jogo:new(1,false));
f:addJogo(jogo.Jogo:new(2,true));
f:addJogo(jogo.Jogo:new(3,false));
f:addJogo(jogo.Jogo:new(4,true));
f:addJogo(jogo.Jogo:new(5,false));
f:addJogo(jogo.Jogo:new(6,true));
f:addJogo(jogo.Jogo:new(7,false));
f:addJogo(jogo.Jogo:new(8,true));

f2 = fase.Fase:new('B', 'head', 'bottom', {0,0});

f2:addJogo(jogo.Jogo:new(9,false));
f2:addJogo(jogo.Jogo:new(10,true));
f2:addJogo(jogo.Jogo:new(11,false));
f2:addJogo(jogo.Jogo:new(12,true));
f2:addJogo(jogo.Jogo:new(13,false));
f2:addJogo(jogo.Jogo:new(14,true));
f2:addJogo(jogo.Jogo:new(15,false));
f2:addJogo(jogo.Jogo:new(16,true));

fases = {}
table.insert(fases,f);
table.insert(fases,f2);

print('Teste MakeShots')
print(protocol.makeShots(fases));
--]]
--teste3

--print(protocol.translate(
					--[[
					
					<app>
					  <head>
					    <id>1</id>
					    <message-type>AUTHENTICATION</message-type>
					  </head>
					  <content>
					    <value>hash</value>
					  </content>
					</app>
					
					]]
--			));
			
--print(protocol.translate(
					--[[
					
					<app>
					  <head>
					    <id>1</id>
					    <message-type>ERROR</message-type>
					  </head>
					  <content>
					    <error>lalala</error>
					  </content>
					</app>			
					]]
--			));
		
--canvas:compose(200,100,f:desenha():getImg());

--canvas:flush();

	
--msg, tab = protocol.translate(
					--[[
					
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
--			);
			
--canvas:compose(200,100,tab[1]:desenha():getImg());

--canvas:flush();

--TESTE RANKING

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
        <login>elenilson</login>
        <score>10</score>
        <position>10</position>
      </me>
      <top>
        <user>
          <login>elenilson4</login>
          <score>10</score>
          <position>10</position>
        </user>
        <user>
          <login>elenilson3</login>
          <score>10</score>
          <position>10</position>
        </user>
        <user>
          <login>elenilson2</login>
          <score>10</score>
          <position>10</position>
        </user>
      </top>
    </rank>
  </content>
</app>
]]
);

canvas:compose(200,100,tab:getRank():getImg());

canvas:flush();
			