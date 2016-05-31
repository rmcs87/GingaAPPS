require 'componente'

print('TESTE1');

co = componente.Componente:new('midia/p1.png');



canvas:attrColor('white');
canvas:attrFont('vera',50,'bold');
canvas:drawText(100,100,'casa');

canvas:compose(200,200,co:getImg());
canvas:flush();
