require 'tcp'

--Variaveis Globais
protocolo = {}
vez = 1
pontos = {0,0}
objetos={}
status = -1
result = '5'
i = 0

--funcao para limpar a tela
function limpa()
	canvas:attrColor(255,255,255,0)
	canvas:clear()
end

--funcao de inicializacao de variaveis
function init()
	local img = canvas:new('media/b1.png')
	local n1dx, n1dy = img:attrSize()
	
	local img2 = canvas:new('media/b2.png')
	local n2dx, n2dy = img2:attrSize()
	
	local img3 = canvas:new('media/b3.png')
	local bdx, bdy = img3:attrSize()
	
	barra1={0,x = 100, y = 300,imagem = img,dx = n1dx,dy = n1dy, vx = 0 , vy = 0}
	barra2={0,x = 1100,y = 300,imagem = img2,dx = n2dx,dy = n2dy , vx = 0 , vy = 0}
	bola={x=1000,y=300,imagem = img3,dx = bdx,dy = bdy,vx = 10,vy = 10, pastx = 0, pasty =0}
end

--funcao de desenho
function f()

	limpa()
	
	bola.pastx = bola.x
	bola.pasty = bola.y
	bola.x = bola.x + bola.vx
	bola.y = bola.y + bola.vy
	bolabordas()
	barraColisao()
	--placar()
	
	canvas:compose(barra1.x, barra1.y, barra1.imagem)
	canvas:compose(barra2.x, barra2.y, barra2.imagem)
	canvas:compose(bola.x, bola.y, bola.imagem)
	
	canvas:flush()	
   	event.timer(42, f)
end

--funcao para detectar colisao com as bordas
function bordas()
	--nave1
	if barra1.x < 0 then
		barra1.x = 0
	elseif barra1.x > 415 then
		barra1.x = 415
	end
	if barra1.y < 0 then
		barra1.y = 0
	elseif barra1.y > 520 then
		barra1.y = 520
	end
	--nave2
	if barra2.x < 815 then
		barra2.x = 815
	elseif barra2.x > 1230 then
		barra2.x = 1230 
	end
	if barra2.y < 0 then
		barra2.y = 0
	elseif barra2.y > 520 then
		barra2.y = 520
	end
end

function bolabordas()
	if bola.y <= 0 or bola.y >= (720 - bola.dy) then
		bola.vy = bola.vy * (-1)
	end
	
	if bola.x <= 0 or bola.x >= (1280 - bola.dx) then
		bola.x = 690
		bola.y = 360
		bola.vy = 0
		if vez < 0 then
			pontos[1] = pontos[1] +1 
		else
			pontos[2] = pontos[2] +1
		end
		bola.vx = 10 * vez
	end
end

function barraColisao()
	local m = (bola.pasty - bola.y)/(bola.pastx - bola.x)
	local y = m*(barra1.x - bola.x) + bola.y
	
	local m2 = (bola.pasty - bola.y)/(bola.pastx - bola.x)
	local y2 = m2*(barra2.x - bola.x) + bola.y
	
	if (bola.x <= barra1.x + barra1.dx) and (y >= barra1.y and y <= barra1.y + barra1.dy) and (vez<0) then
		bola.vx = (bola.vx )* (-1) + barra1.vx
		bola.vy = bola.vy + barra1.vy/2
		vez = vez * (-1)
		bola.x = 2*barra1.x + 2*barra1.dx - bola.x - bola.dx
	end
	
	if (bola.x + bola.dx >= barra2.x) and (y2 >= barra2.y and y2 <= barra2.y + barra2.dy) and (vez>0) then
		bola.vx = (bola.vx ) * (-1) + barra2.vx
		bola.vy = bola.vy + barra2.vy/2
		vez = vez * (-1)
		bola.x = barra2.x - (barra2.x - bola.x)
	end
end

function placar()
	canvas:attrColor('white')
      canvas:attrFont('arial',50,'bold')
	canvas:drawText(600,50,pontos[2]..'   -   '..pontos[1])	
	canvas:flush()
end


--funcao de tratamento de eventos
function keyHandler (evt)
	if evt.class == 'tcp' then 
		if evt.type == 'data' then
			result = evt.value
			i = 1
			
			for g in string.gmatch(result, "-*%d+[.]*%d*") do
				protocolo[i] = g +0
				i= i+1
			end
			--atualiza posicao dos objetos
			if (protocolo[1]==1) then
				barra1.vx = protocolo[4]
				barra1.vy = protocolo[3]
				barra1.y = barra1.y + barra1.vy 
				barra1.x = barra1.x + barra1.vx
			else
				barra2.vx = protocolo[4]
				barra2.vy = protocolo[3]
				barra2.y = barra2.y + barra2.vy
				barra2.x = barra2.x + barra2.vx
			end
			--detecta se chegou nas bordas
			bordas()
		end
	end
	--inicializacao
	if status== -1 then
		init()
    	tcp.execute(
		  	function ()
          		tcp.connect('netbook.lavid.ufpb.br', 4444)
          		tcp.send("casa\n")
        	end
    	)
    	status = 0
    	f()
	end	
  
end
event.register(keyHandler)