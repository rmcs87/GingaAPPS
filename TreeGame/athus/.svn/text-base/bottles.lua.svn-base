module ('bottles', package.seeall)

bs = {
	{sprite.Sprite:new('imgs/lixeiros/lixeira-vermelha.png' , 129 , 100 , 129 , 100) , 1},
	{sprite.Sprite:new('imgs/lixeiros/lixeira-verde.png' , 129 , 99 , 129 , 99) , 2},
	{sprite.Sprite:new('imgs/lixeiros/lixeira-amarela.png' , 129 , 98 , 129 , 98) , 3},
	{sprite.Sprite:new('imgs/lixeiros/lixeira-azul.png' , 129 , 100 , 129 , 100) , 4}
}

function setPositions()
	bs[1][1]:setPosition({40,361});
	bs[2][1]:setPosition({168,359});
	bs[3][1]:setPosition({418,358});
	bs[4][1]:setPosition({559,354});
end
setPositions();

function getPosLeft(xpos,focus,lastPoint)
	local aux = -math.huge;
	local pos = focus;
	local lixo = nil;
	
	for i = 1, #bs do
		if bs[i][1]:getPosition()[1] < xpos and bs[i][1]:getPosition()[1] > aux then
			aux = bs[i][1]:getPosition()[1]; 
			pos = i;
			lixo = bs[i][1];
		end
	end
	
	if aux == -math.huge then
		aux = xpos;
		lixo = lastPoint;
	end

	return lixo,pos;
end

function getPosRight(xpos,focus,lastPoint)
	local aux = math.huge;
	local pos = focus;
	local lixo = nil;
	
	for i = 1, #bs do
		if bs[i][1]:getPosition()[1] > xpos and bs[i][1]:getPosition()[1] < aux then
			aux = bs[i][1]:getPosition()[1]; 
			pos = i;
			lixo = bs[i][1];
		end
	end
	
	if aux == math.huge then
		aux = xpos;
		lixo = lastPoint;
	end

	return lixo,pos;
end

function getPosColor(color)
	if color == 'red' then	
		return bs[1][1],1;
	elseif color == 'green' then
		return bs[2][1],2;
	elseif color == 'yellow' then
		return bs[3][1],3;
	elseif color == 'blue' then
		return bs[4][1],4;
	end
end
