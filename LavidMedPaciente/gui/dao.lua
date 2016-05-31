local 	_G, coroutine, event, assert, pairs, type, string, math, table, io, print, xml
		= _G, coroutine, event, assert, pairs, type, string, math, table, io, print, require 'xml'

module 'dao'

local vars = {
	tabela = {}
}

function getGuia()
	local temp = ''
	for line in io.lines('guia.xml') do
		temp = temp ..'\n' .. line

	end
	vars.tabela = xml.collect(temp)
	return vars.tabela
end

function setGuia(tab)
	vars.tabela = tab
end
