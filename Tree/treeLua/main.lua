local protocol = require 'protocol'
local conn = require 'conn'
local menu = require'menu'
local option = require'option'
local dicas = require'dicas'
local transc = require'transc'
local comerce = require'comerce'
local twitter = require'twitter'
local textos = require'textos'

function f(msg,data)
	
	if msg == 'connected' then
		if conn.isConn() == true then
			comerce.setConn(true,function(msg) conn.send(msg); end);
		end
		
		m = protocol.ask('TWITTER_ALL');
		conn.send(m);
	end
	
	print('MSG === '..msg);
	if data ~= nil then
		print('DATA === '..data);
	end
	
	if data ~= nil then
		tab = protocol.translateResult(data);
		print(type(tab[1][1][1]))
		if type(tab[1][1][1]) == 'string' then
			temp = tab[1][1][1];
			temp2 = tab[1][2][1];
			comerce.receive(temp,temp2);
		else
			print('TWITTER ON')
			local twimsgs = {}
			for j = 1,#tab[1][1] do
				table.insert(twimsgs, tab[1][1][j][2][1]);
				print(twimsgs[j]);
			end
			if #twimsgs > 1 then
				textos.twits = twimsgs;
			end
		end	
	end
end

conn.new(f);
conn.connect(textos.ip,textos.porta);

--Professor
o1 = option.Option:new('programa',dicas.start);
o1:setSprite('imgs/dicas.png' , 208 , 50 , 52 , 50);
o1:setName('imgs/nome_dicas.png' , 70, 12 , 70 , 12);
o1:setFrame(3);
o1:setPosition({359,412});

o2 = option.Option:new('programa',comerce.start);
o2:setSprite('imgs/compra.png' , 208 , 50 , 52 , 50);
o2:setName('imgs/nome_tcommerce.png' , 70 , 12 , 70 , 12);
o2:setFrame(3);
o2:setPosition({359,412});

o3 = option.Option:new('programa',transc.start);
o3:setSprite('imgs/transcri.png' , 208 , 50 , 52 , 50);
o3:setName('imgs/nome_transcricao.png' , 70 , 12 , 70 , 12);
o3:setFrame(3);
o3:setPosition({359,412});

o4 = option.Option:new('programa',twitter.start);
o4:setSprite('imgs/twi.png' , 208 , 50 , 52 , 50);
o4:setName('imgs/nome_twitter.png' , 70 , 12 , 70 , 12);
o4:setFrame(3);
o4:setPosition({359,412});

--Kid
ok1 = option.Option:new('programa',function(resume,bg) menu.setBg(1); resume(); end);
ok1:setSprite('imgs/girls.png' , 208 , 50 , 52 , 50);
ok1:setName('imgs/ana.png' , 70 , 12 , 70 , 12);
ok1:setFrame(3);
ok1:setPosition({359,412});

ok2 = option.Option:new('programa',function(resume,bg) menu.setBg(2); resume(); end);
ok2:setSprite('imgs/dog.png' , 208 , 50 , 52 , 50);
ok2:setName('imgs/virgulino.png' , 70 , 12 , 70 , 12);
ok2:setFrame(3);
ok2:setPosition({359,412});

ok3 = option.Option:new('programa',function(resume,bg) menu.setBg(3); resume(); end);
ok3:setSprite('imgs/kiko.png' , 208 , 50 , 52 , 50);
ok3:setName('imgs/kiko_name.png' , 70 , 12 , 70 , 12);
ok3:setFrame(3);
ok3:setPosition({359,412});

ok4 = option.Option:new('programa',function(resume,bg) menu.setBg(4); resume(); end);
ok4:setSprite('imgs/anak.png' , 208 , 50 , 52 , 50);
ok4:setName('imgs/anaximandro.png' , 70 , 12 , 70 , 12);
ok4:setFrame(3);
ok4:setPosition({359,412});

ops = { o1,o2,o3,o4 };
ops2 = { ok1,ok2,ok3,ok4 };

menu.setOps(1,ops2);
menu.setOps(2,ops);
menu.start();
