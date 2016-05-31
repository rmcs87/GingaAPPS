require 'rank'
require 'componente'

j = rank.Rank:new();
j:addRank(1,'CAIO1',25);
j:addRank(2,'CAIO2',24);
j:addRank(3,'CAIO3',23);
j:addRank(4,'CAIO4',22);
j:addRank(5,'CAIO5',21);
j:addRank(6,'CAIO6',20);
j:addRank(7,'CAIO7',19);
j:addRank(8,'CAIO8',18);
j:addRank(9,'CAIO9',17);
j:addRank(10,'CAIO10',16);
j:addRank(10,'CAIOREAL',1);

canvas:compose(200,100,j:getRank():getImg());

canvas:flush();
