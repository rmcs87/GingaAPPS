--VG's
arquivo = {"votos.txt","votosPior.txt"}		--arquivo de armazenamento
ignore = false								--ao final e durante animacao ignorar teclas
escolha = 0									--escolha do usuario
fator = 8									--fator de deslocamento da animcao
i = -406									--ate onde vai a anomacao na tela
j = 0										--ate onde vai a anomacao na tela
votos = {{'','','','','','',''},{'','','','','','',''}}				--vetor de votos
status = 0									--em que status esta o programa
soma = 0									--total de votos
img={'media/pergunta.png','media/descricao1.png','media/finallimpo.png'}	--vetor de imagens
pos = 1										--quantas imagens foram lidas
imgAtual = canvas:new(img[1])				--imagem atual para exibicao
imgNext = canvas:new(img[2])				--proxima imagem para animcao
nPerguntas = 2								--numero de perguntas
resultado = {{'','','','','','',''},{'','','','','','',''}}				--resultados da votacao(total, recebidos,opcao
alternativas = {'Saúde','Policiamento','Calçamento','Transporte','Iluminação','Área de lazer','Saneamento'}
total = 120

function exibeTexto(texto,x,y,fonteL,cor)
	canvas:attrColor(cor)
    canvas:attrFont('arial',fonteL,'bold')
	canvas:drawText(x,y,texto)	
	canvas:flush()
end

--exibe resultado
function f2()
	if i >0 then
		i =-406
		j = 0
		
		--arquivo de resultados
		melhor = ''
		pior = ''
		for count3 = 1,7 do
			melhor = melhor ..count3..'.'..alternativas[count3]..' - '..((votos[1][count3]/soma)*100)..' %\n'
			pior = pior ..count3..'.'..alternativas[count3]..' - '..((votos[2][count3]/soma)*100)..' %\n'
		end
		
		cabecalho = 'UFPB - UNIVERSIDADE FEDERAL DA PARAÍBA\n'..
					'LAVID - Laboratório de Aplicações em Vídeo Digital\n\n\n'..
					'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX APURAÇÃO DA ENQUETE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n'..
					'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "O BAIRRO QUE EU QUERO" XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\n'..
					'RESULTADOS:\n\n\n'..
					'MELHOR SERVIÇO	    % DE VOTOS\n\n\n'		
		final = '\n\nTOTAL DE VOTOS:'
		
		file = assert(io.open('resultado.txt', "w"))		
		file:write(cabecalho..melhor..'\n\nPIOR SERVIÇO	    % DE VOTOS\n\n\n'..pior..final..soma)
		file:close()
		
		return
	end

	i = i+fator
	j = j+fator
	
	canvas:attrColor(255,255,255,0)
	canvas:clear()
	
	canvas:compose(0, i, imgNext)
	canvas:compose(0, j, imgAtual)
	
	--canvas:drawText(0,i+50,'melhor: '..alternativas[resultado[1][3]]..math.ceil((resultado[1][2]/resultado[1][1])*100))	
	
	for count2 = 1,7 do
	 
	 	const = i+70+count2*35
		c = (votos[1][count2]/soma)*total
		canvas:attrColor('green')
		canvas:drawRect('fill', 165-c,const,c, 10)
		
		c = (votos[2][count2]/soma)*total
		canvas:attrColor('red')
		canvas:drawRect('fill', 170,const,c, 10)
		
	end
	
	canvas:flush()
	
   	event.timer(50, f2)
end

--animacao
function f()
	if i >0 then
		i =-406
		j = 0
		next()
		return
	end

	i = i+fator
	j = j+fator
	
	canvas:attrColor(255,255,255,0)
	canvas:clear()
	
	canvas:compose(0, i, imgNext)
	canvas:compose(0, j, imgAtual)
	canvas:flush()
   	event.timer(50, f)
end

--escreve os votos em arquivo atualizando-os
function votar()
	file = assert(io.open(arquivo[status], "r"))

	file:read()
	votos[status][1] = file:read()
	votos[status][2] = file:read()
	votos[status][3] = file:read()
	votos[status][4] = file:read()
	votos[status][5] = file:read()
	votos[status][6] = file:read()
	votos[status][7] = file:read()
	file:close()
				
	votos[status][escolha] = votos[status][escolha] +1 
			
	file = assert(io.open(arquivo[status], "w"))
				
	file:write('\n',votos[status][1],'\n',votos[status][2],'\n',votos[status][3],'\n',votos[status][4],'\n',votos[status][5],'\n',votos[status][6],'\n',votos[status][7],'\n')
	file:close()
	soma = votos[status][1] + votos[status][2] + votos[status][3] + votos[status][4] + votos[status][5] + votos[status][6] + votos[status][7]

end

--carrega proxima imagem
function next()
	pos = pos + 1
	imgAtual = canvas:new(img[pos])
	imgNext = canvas:new(img[pos+1])
	status = status + 1
	ignore = false
end

function keyHandler (evt)

	if ignore then
		return
	end
	
	if status==0 then
		canvas:compose(0, 0, imgAtual)
		canvas:flush()
		status=1
		return
	end
	
	if status==1 or status==2 then
		if evt.class == 'key' and evt.type == 'press' then
			if evt.key=='1' or evt.key=='2' or evt.key=='3' or evt.key=='4' or evt.key=='5' or evt.key=='6' or evt.key=='7' then
				if pos == nPerguntas then
					ignore = true
					escolha = evt.key + 0
					votar()
					f2()
				else
					ignore = true
					escolha = evt.key + 0
					votar()
					f()
				end
			end
		end
	end
end
event.register(keyHandler)