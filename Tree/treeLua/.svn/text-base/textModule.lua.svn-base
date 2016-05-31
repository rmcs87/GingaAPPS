module ('textModule', package.seeall)
local gameObject = require 'gameObject';

-- Funcao para fazer com que a classe Sprite herde da GameObject
function inherit(  )
    local new_class = {}
    local class_mt = { __index = new_class }

    function new_class:new(str , width , heigth)

        local temp = {};
		setmetatable( temp, class_mt );
		
		temp.text = str;
		temp.font = "vera";
		temp.size = 10;
		temp.color = "white";
		temp.style = nil;
		temp.valign = "top";
		temp.halign = "left";
		temp.vpadding = 0;
		temp.hpadding = 0;
		temp.spacing = 0;
		temp.tabTam = 8;
		temp.img = canvas:new(width, heigth);
		temp.widthF, temp.heightF = width , height;

        return temp
    end

    if gameObject.GameObject then
        setmetatable( new_class, { __index = gameObject.GameObject } )
    end

    return new_class
end

TextModule = inherit();

function TextModule:getImg()
	return self.img;
end

function TextModule:setText(str)
	self.text = str;
end

--Preprocessa uma string escapando caracteres especiais
local function preProStr(str, tabTam)

	local p = 1;
	while (p <= #str) do
	
		if (string.byte(str, p) == string.byte('\t')) then
		
			local parti = string.sub(str, 1, p - 1);
			local partf = string.sub(str, p + 1);
			local i;
			for i = 1, tabTam, 1 do
			
				if (parti ~= nil) then
				
					parti =  parti .. ' ';
				else
				
					parti = ' ';
				end
			end
			
			if (partf ~= nil) then
			
				str = parti .. partf;
			else
				
				str = parti;
			end
		end
		
		p = p + 1;
	end
	
	return str;
end

function TextModule:attrSpacing(ns)

	if (ns == nil) then
	
		return self.spacing;
	end
	
	self.spacing = ns;
end

function TextModule:attrTabSize(ntt)

	if (ntt == nil) then
	
		return self.tabTam;
	end
	
	self.tabTam = ntt;
end

function TextModule:attrStyle(ns)

	if (ns == nil) then
	
		return self.style;
	end
	
	self.style = ns;
end

function TextModule:attrSize(ns)

	if (ns == nil) then
	
		return self.size;
	end
	
	self.size = ns;
end

function TextModule:attrText(newText)

	if (newText == nil) then
	
		return self.text;
	end
	
	self.text = newText;
end

function TextModule:attrWidth(nw)

	if (nw == nil) then
	
		return self.widthF;
	end
	
	self.widthF = nw;
end

function TextModule:attrFont(nf)

	if (nf == nil) then
	
		return self.font;
	end
	
	self.font = nf;
end

function TextModule:attrHeight(nh)

	if (nh == nil) then
	
		return self.height;
	end
	
	self.height = nh;
end

function TextModule:attrVPadding(nv)

	if (nv == nil) then
	
		return self.vpadding;
	end
	
	self.vpadding = nv;
end

function TextModule:attrHPadding(nv)

	if (nv == nil) then
	
		return self.hpadding;
	end
	
	self.hpadding = nv;
end

function TextModule:attrHAlign(nv)

	if (nv == nil) then
	
		return self.halign;
	end
	
	self.halign = nv;
end

function TextModule:attrVAlign(nv)

	if (nv == nil) then
	
		return self.valign;
	end
	
	self.valign = nv;
end

function TextModule:attrColor(nc) 

	if (nc == nil) then
	
		return self.color;
	end
	
	self.color = nc;
end

-- Função responsável por desenhar o texto em determinado canvas.
-- Função recebendo um parâmetro, o alinhamento será feito em relação ao canvas.
-- Caso contrário, o alinhamento será feito pelo tamanho da caixa que é especificado
-- pelos paraêmtros extras width e height
function TextModule:draw()
	
	self.img:attrColor(0,0,0,0);
	self.img:clear();
	
	--Nada para desenhar =P
	if (#self.text == 0) then
		print('nada a desenhar');
		return;
	end
	
	local cW, cH;
	local width, height = self.widthF, self.heigthF;
	local dx, dy = 0, 0;
	local lines = {};
	local initIndex = 1;
	local endIndex = #self.text;
	local i = string.find(self.text, '\n', initIndex);
	local nLinhas = 1;
	
	while (i ~= nil) do
	
		lines[nLinhas] = string.sub(self.text, initIndex, i - 1);
		initIndex = i + 1;
		nLinhas = nLinhas + 1;
		i = string.find(self.text, '\n', initIndex);
	end
	
	lines[nLinhas] = string.sub(self.text, initIndex);
	local pos = {};
	
	--print("HERE - CANVAS");
	--Cria um novo canvas para caixa
	if (px ~= nil) then
	
		--print("Canvas local");
		cW, cH = width, height;	
	else --Cria em relação ao canvas principal
	
		--print("Canvas global");
		cW, cH = self.img:attrSize();
	end
	
	--print("PROP");
	self.img:attrFont(self.font, self.size, self.style);
	self.img:attrColor(self.color);
	
	--print("HORIZONTAL");
	--Alinhamento horizontal
	local k = 1;
	while (k <= #lines) do
		
		lines[k] = preProStr(lines[k], self.tabTam);
		if (self.halign == "right") then			
			
			local tW = self.img:measureText(lines[k]);
			pos[k]= {x = cW - self.hpadding - tW}
		elseif (self.halign == "center") then
			
			local tW = self.img:measureText(lines[k]);
			pos[k]= {x =  cW / 2 - tW / 2}
		elseif (self.halign == "justify") then
		
			--print("TAM TEST. LINE: " .. k);
			pos[k] = {x = self.hpadding};
			local tamText = self.img:measureText(lines[k]);
			--Verifica se a linha cabe na caixa e a quebra caso necessário
			while (tamText > cW - 2 * (self.hpadding)) do
				
				--Achou um espaço. Joga para próxima linha
				if (string.byte(lines[k], -1) == string.byte(' ')) then
				
					--Verifica se a linha existe
					if (lines[k + 1] ~= nil) then
						
						lines[k + 1] = ' ' .. lines[k + 1];
					else
						
						lines[k + 1] = ' ';
					end
					
					lines[k] = string.sub(lines[k], 1, #lines[k] - 1);
				else --Procura o fim da palavra e a joga para próxima linha
				
					local posFim = -1;
					while (string.byte(lines[k], posFim) ~= string.byte(' ') and posFim > -#lines[k]) do
					
						posFim = posFim - 1; --Volta uma posição
					end
			
					--print("POS FIM: " .. posFim);
					--Verifica se existe a próxima linha
					if (lines[k + 1] ~= nil) then		
						
						lines[k + 1] = string.sub(lines[k], posFim) .. lines[k + 1];
					else
						
						lines[k + 1] = string.sub(lines[k], posFim);
					end
					
					lines[k] = string.sub(lines[k], 1, posFim - 1);
				end
				
				tamText = self.img:measureText(lines[k]); --Pega a nova medida da linha
				--print("END TAM TEST");
			end

			local tamEspaco = self.img:measureText(' ');			
			--Verifica o tamanho mínimo para adicionar espaços
			if (tamText >= cW - 20 * tamEspaco) then
				
				--print("ADD SPACE");
				--Verifica o tamanho da linha e adiciona espaços se necessário
				local indexInit = 1;
								
				--Procura o trecho em branco mais ou menos no meio da linha
				local maior = 1;
				local indexIni1, indexIni2, indexFim1, indexFim2 = 1, 0, 1, 0;
				local reversed = string.reverse(lines[k]);
				local tamLinhaR = #reversed;
				local indexReversed = #reversed;
				
				--print("MIDDLE SPACE");
				repeat
				
					indexIni1, indexIni2 = string.find(lines[k], ' +', indexIni1);
					indexFim2, indexFim1 = string.find(reversed, ' +', indexFim2);
					indexReversed =  tamLinhaR - indexFim2;
					indexIni1 = indexIni2 + 1; --Pula o treco em branco
					indexFim2 = indexFim1 + 1;
					--print('ii1 ' .. indexIni1);
					--print('ir ' .. indexReversed);
				until (indexIni1 >= indexReversed or indexReversed == 0); 
		
				indexInit = indexIni1;
				
				--print("ADDING SPACE");
				while (tamText + tamEspaco <= cW - 2 * (self.hpadding)) do
				
					--print("INDEX INIT: " .. indexInit);
					--Procura o trecho de espacos entre palavras
					local tamLinha = #lines[k];
					local espacoPosIni, espacoPosFim = string.find(lines[k], ' +', indexInit);
					
					--Não há espaço no pedaço atual da linha
					if (espacoPosIni == nil) then
					
						--Não há espaço na linha inteira, adiciona no final
						if (indexInit == 1) then
						
							lines[k] = lines[k] .. ' ';
							--Faz a próxima procura iniciar da posição de foi inserido o espaço,
							--pois já sabemos que não há em outro lugar aumento um índice por causa
							--do espaço adicionado
							indexInit = tamLinha + 2; 
						else --Volta ao início da palavra	
						
							indexInit = 1;							
						end
					else 
					
						lines[k] = string.sub(lines[k], 1, espacoPosIni - 1) .. ' '
								.. string.sub(lines[k], espacoPosIni);
						--Passa para o fim do trecho somando a posição do espaço adicionado
						indexInit = espacoPosFim + 2; 
						--Chegou ao fim da palavra
						if (indexInit >= tamLinha) then
						
							indexInit = 1;
						end
					end --posInit == nil
					
					tamText = self.img:measureText(lines[k]);
				end --While tam
			end --Tam mínimo
		else --Alinhamento padrão left
		
			pos[k] = {x = self.hpadding};
		end
		
		k = k + 1;
		--print("NEXT LINE");
	end
	
	nLinhas = #lines;
	--print("HERE - TIPO");
	--Alinhamento vertical
	if (self.valign == "bottom") then
	
		local k;
		local ante = 0;
		for k = nLinhas, 1, -1 do
			
			local _, th = self.img:measureText(lines[k]);
			--Linha k pos y
			pos[k].y = cH - (th + ante + self.vpadding + (k - 1) * self.spacing);				
			ante = ante + th;
		end
	elseif (self.valign == "center") then
		
		--Número de linhas pares
		if (nLinhas % 2 == 0) then
			
			local mid = nLinhas / 2;
			local diffCenter = self.spacing / 2;
			local ante = 0;
			local k;
			--Desenha linhas antes do centro
			for k = mid, 1, -1 do

				local _, th = self.img:measureText(lines[k]);					
				pos[k].y = cH / 2 - (diffCenter + th + ante + (mid - k) * self.spacing);
				ante = ante + th;
			end
			
			--Desenha linhas após centro
			ante = 0;
			for k = mid + 1, nLinhas, 1 do
			
				pos[k].y = cH / 2 + diffCenter + ante + (mid - k - 1) * self.spacing;
				local _, th = self.img:measureText(lines[k]);
				ante = ante + th;
			end
		else
		
			local posPivot = math.ceil(#lines / 2);
			local _, tamPivot = self.img:measureText(lines[posPivot]);
			tamPivot = tamPivot / 2; --Calcula centro do pivot
			local ante = 0; --Tamanho do elemento anterior
			
			--Calcula as coordenadas do pivot
			pos[posPivot].y = cH / 2 - tamPivot;
			
			--Calcula as coordenadas dos elementos após o pivot
			local k;
			for k = posPivot + 1, nLinhas, 1 do
			
				pos[k].y = cH / 2  + tamPivot + ante + (k - posPivot) * self.spacing;
				local _, th = self.img:measureText(lines[k]);
				ante = ante + th;
			end
			
			ante = 0;
			--Calcula as coordenas dos elementos anteriores ao pivot
			for k = posPivot - 1, 1, -1 do
			
				local _, th = self.img:measureText(lines[k]);
				pos[k].y = cH / 2 - (ante + tamPivot + th + (posPivot - k) * self.spacing);
				ante = ante + th;
			end
		end --Pares
	else --Padrão: top
	
		--print("HERE - TOP");
		local k;
		local ante = 0;
		for k = 1, nLinhas, 1 do
			
			--print("FOR-TOP");
			--Linha k pos y
			pos[k].y = ante + self.vpadding + (k - 1) * self.spacing;
			--print("MEASURING");
			local _, th = self.img:measureText(lines[k]);
			ante = ante + th;
		end
		--print("END - TOP");
	end --if tipo vertical
	
	--Desenha no canvas atual
	local k;
	
	
	for k = 1, nLinhas, 1 do			
		self.img:drawText(pos[k].x, pos[k].y, lines[k]);
	end
	self.img:flush();
	

end --draw