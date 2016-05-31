module ('protocol', package.seeall)
local xml = require 'xml'

function ask(content)
	return '<request><value>'..content..'</value></request>';
end

function buy(amount,id,cpf)
	return '<t-commerce><amount>'..amount..'</amount><product-id>'..id..'</product-id><user-cpf>'..cpf..'</user-cpf></t-commerce>';
end

function twit(cpf,msg)
	return '<tweet><user-cpf>'..cpf..'</user-cpf><message>'..msg..'</message></tweet>';
end

function translateResult(xm)
	local tabela = xml.collect(xm);
	--return tabela[1][1][1],tabela[1][2][1];
	return tabela;
end
--<result>
   --<value>
     --  valor
   --</value>
   --<message>
     --  uma mensagem de informacao
   --</message>
--</result>

function translateTwitter(xm)
	local tabela = xml.collect(xm);
	return tabela;
end

--<twitter-messages>
      --<tweet>
        --<user>
          --    ricardo
        --</user>
        --<menssage>
          ---      hahahahaha
        --</message>
     --</tweet>
      --<tweet>
        --<user>
          --  ricardo
        --</user>
        --<menssage>
          --      hahahahaha
        --</message>
      --</tweet>
--</twitter-messages>









