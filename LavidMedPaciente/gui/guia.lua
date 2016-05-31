local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, dao , table
		= _G, coroutine, event, assert, pairs, type, string, math, table, io, print, require 'dao', table

module 'guia'

local vars = {
	guide = dao.getGuia()
}

function getAno()
	return vars.guide[1][1][1]
end

--retorna especialidades
function getEspecialidades()

	local tabEsp = {}

	for count =1, #vars.guide[1] do
		table.insert(tabEsp, vars.guide[1][count][1][1])
	end

	return tabEsp

end

--retorna as letras que tem medico de uma especialidade
function getLetras(espIndex)

	local tabLet = {}

	for count = 2, (#vars.guide[1][espIndex+1]) do
		table.insert(tabLet,vars.guide[1][espIndex+1][count][1][1])
	end

	return tabLet
end

--retorna os medicos com suas informacoes(nome, especialidade, endereco, telefone) de uma letra de uma especialidade
function getMedicos(espIndex,letIndex)
	local tabMeds = {}

	for count = 2,(#vars.guide[1][espIndex+1][letIndex+1]) do
		table.insert(tabMeds,vars.guide[1][espIndex+1][letIndex+1][count])
		--table.remove(tabMeds[count-1],5)
	end

	return tabMeds
end

--retorna os dias em que o médico atende a partir da especialidade, letra e medico escolhidos
--arrumar para retornar o numero do dia da semana(1 domingo, 7 sabado)
function getDias(espIndex, letIndex, medIndex, mesIndex)

	local tabDias = {}
	local tabMes = {'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}

	for count = 1,(#vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5]) do

		local temp = {}

		for g in string.gmatch(vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5][count][1][1], "[%d]+") do
			table.insert(temp,g)
		end

		table.insert(temp,diaDaSemana(temp[1], temp[2], temp[3]))

		if tabMes[temp[2]+0] == mesIndex then
			table.insert(tabDias,temp)
		end
--		table.insert(tabDias,temp)
	end

	return tabDias
end

--retorna os meses
function getMes(espIndex, letIndex, medIndex)

	local tabMes = {'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}
	local tabMes2 = {}

	for count = 1,(#vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5]) do

		local temp = {}

		for g in string.gmatch(vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5][count][1][1], "[%d]+") do
			table.insert(temp,g)
		end

		table.insert(tabMes2,tabMes[temp[2]+0])

	end


	return tabMes2
end

--retorna os horarios de consultas de um dia
--arrumar para retornar uma array tri, com a hora de inicio, fim e status da consulta, de um dia ....
function getHoras(espIndex, letIndex, medIndex, diaIndex)

	local tabHoras = {}

	for count = 2,(#vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5][diaIndex]) do

		local temp = {}

		for g in string.gmatch(vars.guide[1][espIndex+1][letIndex+1][medIndex+1][5][diaIndex][count][1], "[%d]+") do
			table.insert(temp,g)
		end

		temp[1] = math.floor(temp[1]/60) ..':'..temp[1]%60
		temp[2] = math.floor(temp[2]/60) ..':'..temp[2]%60
		table.insert(tabHoras,temp)
	end
	return tabHoras
end

function diaDaSemana(diaS, mesS, anoS)
	tableM = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5}
	dias = {'Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'}

	local soma = (anoS + math.floor(anoS/4) + tableM[mesS+0] + diaS - 2)%7

	return dias[soma+1]
end

function setConsulta(dia, hora, numero, medico, especialidade)

end
