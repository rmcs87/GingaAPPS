local _G, coroutine, event, assert, pairs, type, string, math, pcall, print, canvas
    = _G, coroutine, event, assert, pairs, type, string, math, pcall, print, canvas

module 'interface'

function init()
	print('EM INTERFACE')
	canvas:attrColor('white')
	canvas:drawRect("fill",0,0,canvas:attrSize())	
	canvas:flush()
end

function exibeTexto(texto,x,y,fonte,cor)
	canvas:attrColor(cor)
    canvas:attrFont('arial',fonte,'bold')
	canvas:drawText(x,y,texto)	
	canvas:flush()
end