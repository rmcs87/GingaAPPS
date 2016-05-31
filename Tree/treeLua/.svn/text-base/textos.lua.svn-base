--Declaracao do modulo:
module ('textos', package.seeall)

--Imports:
local textModule = require'textModule'

ip = '150.165.132.120';
porta = 2807;

--Textos da trancricao:
trasncricao = {					
		'Kiko - Noooooossaaa!!!! Este lugar está uma bagunça.', 
		
		'Kiko - HAHAHAHHA!!!! Olha so o que encontrei.',
		
		'Kiko - Pequenininhas. Enooooooooooorrrrmeeees!!!',
		
		'Kiko - Sayuri, Ana, subam aqui. Vejam só o que encontrei.',
		
		'Ana - Afe Maria, que bagunça.',
		
		'Kiko - Parece meu quarto.',
		
		'Sayuri - Kiko, eu não acredito que seu quarto é assim.',
		
		'Kiko - Ehhh ... acho que o lixo do meu quarto é diferente. Quer dizer,na verdade não é lixo, por que não quero que se jogue nada fora.', 
				
		'Kiko - São brinquedos!!! Têm pallitos que transformei num aviãozinho. Garrafas que fiz um disco voador.',
		
		'Sayuri - Ah gente, mas eu não quero deixar a casinha com a cara do quarto do Kiko não.',
		
		'Ana - Nem eu. Vamos arrumar.',
		'Kiko - Ta bom, vamos!!!',
		'Baiana - Não Kiko.',
		
		'Sayuri - Assim você limpa aki, mas suja lá e ainda machuca os outros.',
		
		'Ana - Ra, desculpe moço. Ai você hein!',
		
		'Kiko - Ahahaha. Hum, achei um saco. Vamos arrumar. To começando.Coletando tudinho.',
		
		'Virgulino - Hum hum.',
		
		'Crianças - AHHHHHHHHH!!!',
		
		'Ana - O lixo ta vivo. Ele ta vindo ai e a culpa é sua.',
		
		'Ana -  Você tratou o lixo mal e agora ele se transformou num enorme monstro que veio se vingar	dagente.',
		
		'Kiko - Para com isso Ana. Você esta assistindo muito filme de terror.',
		
		'Virgulino - Hum, hum, hum hum.',
		
		'Crianças - Ahhhhhhhhh.',
		 
		'Ana - O mosntro vai sair. Protejam-se, protejam-se todos.',
		
		'Virgulino - Hum, hum,hum.',
		'Crianças - Ahhhhhh.',
		'Sayuri - É um cachorrinho.',
		
		'Ana - Ah, não era um tapete velho?',
		'Virgulino - Não, era eu.',
		'Sayuri - Um cachorrinho lindo. Vem cá toto.',
		
		'Virgulino - Hum, hum. Eu vou. Mas corta essa de toto. Meu nome é Virgulino.',
		
		'Ana - Muito bem, Vir-gu-li-no. Mas, como você subiu na casa da árvore?',
		'Kiko - Cachorros não sobem em árvore.',
		
		'Virgulino - Hum,é mesmo? Eu não sabia.',
		'Sayuri - E se você quiser descer?',
		
		'Virgulino - Bom, agora que sei que não sei, não sei.',
		'Kiko - Que coisa complicada. Melhor seria se você não soubesse que não sabia.',
		
		'Sayuri - Ah, olha só tadinho, feriu a orelhinha.',
		
		'Ana - Puxa vida, então o lixeiro vai se machucar também. Esse lixo não deveria estar desse jeito. Deve haver uma outra forma de se arrumar.',
		
		'Virgulino - o Anaximandro deve saber. Vamos perguntar a ele.',
		'Crianças - Quem?',
		
		'Virgulino - Anaximandro. Bom preciso tirar uma dúvida, quadro magnético fala?',
		
		'Kiko - Bom, não aqueles que conhecemos. Mas também não conhecemos cachorros que falam, portanto pode existir um quadro que possa falar.',
		
		'Anaximandro - Muito bem meninos. Muito bem. Já que vocês me permitem, vou entrar então nesta conversa.', 
		
		'Anaximandro - Ahhh, sobre o que era mesmo? Ahh, sobre lixos, neh.',
		
		'Crianças - Ahhh.',
		'Ana - Você estava escutando nossa conversa ai escondido.',
		
		'Anaximandro - Rarara, não estava escondido. Não estava escondido. Vocês que não me viram.',
		
		'Anaximandro - Ah, eu não pude evitar Ana, eu não pude evitar, mas vamos ao lixo. O que vocês sugerem hein crianças?',
		
		'Ana - Bom, eu acho que as coisas poderiam ser separadas. Elas são feitas de material diferente.',
		
		'Sayuri - Eu também. Vamos separar por material.',
		
		'Sayuri - Plástico de um lado, latas em outro saco, vidro em outro, papel em mais um e restos de comida. ',
		
		'Kiko - Devo separar algumas coisas para mim, pois nem todo lixo é lixo.	Eu posso construir meus brinquedos!!!',
		
		'Ana - Ta bom Kiko.',
		'Kiko - Agora é so esperar pelo seu lixeiro. Lixeiro. Lixeiro. Ele chegou.',
		
};
t = nil;
function getTranscricao(i)
	if t == nil then
		t = textModule.TextModule:new(textos.trasncricao[i],420,98);
		t:attrColor('white');
		t:attrHAlign('justify');
		t:attrSize(18);
		t:attrStyle('bold');
		t:draw();
		t:setPosition({240,373});
	else
		t:setText(textos.trasncricao[i]);
		t:draw();
	end
	
	return t;	
end

--Textos das dicas:
dica ={
	'@mandybc oxe, vamos ter...quer incentivo maior que esse?! O show de U2 + Muse?! kkk vc vai ver q nosso artigo vai ficar perfeito dpois disso',
	'A cada vez q eu escuto a voz e as mungangas do apresentador do CasoDePolícia, eu lembro + ainda do filme Tropa de Elite 2. #sensacionalismoa',
	'sobre genetica: RT @thafigueiredo @yurimalheiros uma arma (poder) sem limites, pode anotar. e quanto mais eu estudo mais medo eu tenho.',
	'50% do que se fala brincando é verdade. Porque falar brincando é uma maneira gentil de dizer a verdade sem ofender a outra pessoa...',
	'que foto: http://bit.ly/gfPKGJ o policial com a bandeira do brasil atrás cheia de marcas de bala no complexo do alemão',
	'Reveja as reportagens de hoje do #bomdiaparaiba em nossa página na internet. www.paraiba1.com.br/bomdia',
}
d = nil;
function getDicas(i)
	
	if d == nil then
		d = textModule.TextModule:new(textos.dica[i],420,98);
		d:attrColor('white');
		d:attrHAlign('justify');
		d:attrSize(18);
		d:attrStyle('bold');
		
		d:draw();
		d:setPosition({240,373});
	else
		d:setText(textos.dica[i]);
		d:draw();
	end
	return d;
end

--Textos comerce:
--(id,descricao,valor,nome,imagem)
produtos = {
	{1,'Assita a hora que quiser seus personagens de TV favoritos .', 'R$ 5,00', 'DVD Turma da Árvore','imgs/produtos/dvd.png'},
	{2,'Jogo de tabuleiro com os personagens da turma.','R$ 24,99', 'Escolinha da Árvore','imgs/produtos/escolinha.png'},
	{3,'Lousa mágica no Tio Anaximandro, para aprender se divertindo..','R$ 12,99', 'Lousa do Anaki','imgs/produtos/lousa.png'},
}
produtosT = {}
p = nil;
pPrice = nil;
pname = nil;
function getProdutos(i)
	if p == nil then
		p = textModule.TextModule:new(textos.produtos[i][2],309,98);
		p:attrColor('white');
		p:attrHAlign('justify');
		p:attrSize(14);
		p:attrStyle('bold');
		p:draw();
		p:setPosition({245,393});
		
		pPrice = textModule.TextModule:new(textos.produtos[i][3],309,98);
		pPrice:attrColor('yellow');
		pPrice:attrHAlign('justify');
		pPrice:attrSize(15);
		pPrice:attrStyle('bold');
		pPrice:draw();
		pPrice:setPosition({488,428});
		
		pname = textModule.TextModule:new(textos.produtos[i][4],309,98);
		pname:attrColor('white');
		pname:attrHAlign('justify');
		pname:attrSize(18);
		pname:attrStyle('bold');
		pname:draw();
		pname:setPosition({295,370});
	else
		p:setText(textos.produtos[i][2]);
		p:draw();
		
		pPrice:setText(textos.produtos[i][3]);
		pPrice:draw();
		
		pname:setText(textos.produtos[i][4]);
		pname:draw();
	end
	
	local temp2 = sprite.Sprite:new(textos.produtos[i][5] , 117 , 109 , 117 , 109);
	temp2:setPosition({556,338});
	table.insert(produtosT , {p , pPrice , pname , temp2, produtos[i][1]});

	return produtosT;
end

--Textos twitter:
twits =nil;
tw = nil;
function getTwits(i)
	if twits ~= nil then
		if tw == nil then
			tw = textModule.TextModule:new(textos.twits[i],420,98);
			tw:attrColor('white');
			tw:attrHAlign('justify');
			tw:attrSize(15);
			tw:attrStyle('bold');
			tw:draw();
			tw:setPosition({240,373});
		else
			tw:setText(textos.twits[i]);
			tw:draw();
		end
	end
	return tw;
end
	