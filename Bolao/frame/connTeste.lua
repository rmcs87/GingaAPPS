require 'conn'

function f(msg,data)
	print('MSG === '..msg);
	if data ~= nil then
		print('DATA === '..data);
	end
end

c = conn.Connection:new(f);

event.register(function(evt) print('asdasdasdas');c:listener(evt); end)
c:connect('150.165.132.104',10000);

event.timer(5000,function() c:send('casa') end)

function listener2 (evt)
	print('EVENTO PLACEBO');
	print(evt.class);
end
event.register(listener2)