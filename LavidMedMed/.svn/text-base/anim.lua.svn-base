local num = 1
local img = canvas:new('3d/'..num..'.png')

function f()
	img = canvas:new('3d/'..num..'.png')
	desenha()
	event.timer(50, f)

end
function desenha()	

	canvas:attrColor(255,255,255,0)
	canvas:clear(0, 0, canvas:attrSize())
	
	canvas:compose(0, 0, img)
	canvas:flush()
	
	if num < 32 then
		num = num + 1
	else
		num = 1
	end
	
end

f()

