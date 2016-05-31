<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="unimed" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! CABEÇALHO DO PROGRAMA
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
	<head>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE REGRAS:
       ! definem regras utilizadas em switches para a seleção de nós
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<ruleBase>
			<rule comparator="eq" id="r1" value="1" var="opcao"/>
			<rule comparator="eq" id="r2" value="2" var="opcao"/>
			<rule comparator="eq" id="r3" value="3" var="opcao"/>
			<rule comparator="eq" id="r32" value="32" var="opcao"/>
		</ruleBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE REGIÕES:
       ! define as regiões na tela onde as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<regionBase>
			<region id="rgTV" top="2.5%" left="2.5%" width="95%" height="95%">
				<region id="rgAlerta" width="51%" height="17%" top="43%" left="40%" zIndex="2"/>
				<region id="rgIcon" width="10%" height="10%" bottom="5%" right="5%" zIndex="2"/>
				<region id="rgLogo" width="22.5%" height="19%" zIndex="2"/>
				<region id="rgResultado" width="50%" height="50%" left="40%" top="30%" zIndex="2"/>
				<region id="rgResultado2" width="50%" height="50%" left="40%" top="30%" zIndex="2"/>
				<region id="rgResultado3" width="50%" height="50%" left="40%" top="30%" zIndex="2"/>
				<region id="rgFundo" width="22.5%" height="59%" top="20%" zIndex="2">
					<region id="rgOpcao1" width="90%" height="9%" left="5%" top="1%" zIndex="2"/>
					<region id="rgOpcao2" width="90%" height="9%" left="5%" top="11%" zIndex="2"/>
					<region id="rgOpcao3" width="90%" height="9%" left="5%" top="21%" zIndex="2"/>
				</region>
			</region>
		</regionBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE DESCRITORES:
       ! define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<descriptorBase>
			<descriptor focusIndex="1" focusSrc="img/btn_mensagens_on.png" id="dOpcao1" focusBorderWidth="0" moveDown="2" moveUp="3" region="rgOpcao1"/>
			<descriptor focusIndex="2" focusSrc="img/btn_agenda_on.png" id="dOpcao2" focusBorderWidth="0" moveDown="3" moveUp="1" region="rgOpcao2"/>
			<descriptor focusIndex="3" focusSrc="img/btn_compromissos_on.png" id="dOpcao3" focusBorderWidth="0" moveDown="1" moveUp="2" region="rgOpcao3"/>
			<descriptor id="dApp" region="rgResultado"/>
			<descriptor id="dApp2" region="rgResultado2"/>
			<descriptor id="dApp3" region="rgResultado3"/>
			<descriptor id="dFundo" region="rgFundo"/>
			<descriptor id="dLogo" region="rgLogo"/>
			<descriptor id="dAlerta" region="rgAlerta"/>
			<descriptor id="dIcon" region="rgIcon" explicitDur="15s"/>
		</descriptorBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE CONECTORES:
       ! definem o comportamento dos elos
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<connectorBase>
			<causalConnector id="onBegin1StartN">
				<simpleCondition role="onBegin"/>
				<simpleAction max="unbounded" qualifier="par" role="start"/>
			</causalConnector>
			<causalConnector id="onSelection1SetNStopNStartN">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="par" role="set" value="$var"/>
					<simpleAction max="unbounded" qualifier="par" role="stop"/>
					<simpleAction max="unbounded" qualifier="par" role="start"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelection1StopNStartN">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="par" role="stop"/>
					<simpleAction max="unbounded" qualifier="par" role="start"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelection1SetNStartN">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="par" role="set" value="$var"/>
					<simpleAction max="unbounded" qualifier="par" role="start"/>
				</compoundAction>
			</causalConnector>
			<importBase alias="connectors" documentURI="connectorBase.ncl"/>
		</connectorBase>
	</head>
	<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! CORPO DO PROGRAMA:
       ! define as mídias e estrutura do programa
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
	<body>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! PONTO DE ENTRADA:
       ! indica o componente onde o programa inicia
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		
		<port component="icon" id="pFundo"/>
				
		
		<media id="nodeSettings" type="application/x-ginga-settings">
			<property name="opcao"/>
		</media>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! MÍDIAS:
       ! define o local dos arquivos de mídia e as associa com seus descritores
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<media descriptor="dLogo" id="logo" src="img/unimed_logomarca.png"/>	
		<media descriptor="dFundo" id="fundo" src="img/menu_bg.png"/>	
		<media descriptor="dOpcao1" id="opcao1" src="img/btn_mensagens.png"/>
		<media descriptor="dOpcao2" id="opcao2" src="img/btn_agenda.png"/>
		<media descriptor="dOpcao3" id="opcao3" src="img/btn_compromissos.png"/>
		<media descriptor="dIcon" id="icon" src="img/msg_icone_verde.png"/>
		<media descriptor="dIcon" id="ani" src="anim.lua"/>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! SWITCH:
       ! contém os nós dentre os quais um será selecionado
       ! com base nas regras definidas por bindRule
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				
		<media descriptor="dApp" id="selecao1" src="img/mensagens_bg.png"/>
				
		<media descriptor="dAlerta" id="selecao32" src="img/emergencia.png"/>
						
		<media descriptor="dApp2" id="selecao2" src="img/agenda_bg.png"/>	
			
		<media descriptor="dApp3" id="selecao3" src="img/compromissos_bg.png"/>

		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! ELOS
       ! define os elos que regem o sincronismo entre as mídias
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		
		<link id="start" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="icon" role="onSelection">
				<bindParam name="keyCode" value="GREEN"/>
			</bind>
			<bind component="icon" role="stop"/>
			<bind component="logo" role="start"/>
			<bind component="fundo" role="start"/>

		</link>
			
		<link id="endMsgm" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="selecao1" role="onSelection">
				<bindParam name="keyCode" value="CURSOR_LEFT"/>
			</bind>
			<bind component="selecao1" role="stop"/>
			<bind component="opcao1" role="start"/>
		</link>
		<link id="endAgenda" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="selecao2" role="onSelection">
				<bindParam name="keyCode" value="ENTER"/>
			</bind>
			<bind component="selecao2" role="stop"/>
			<bind component="opcao1" role="start"/>
		</link>
		<link id="endComp" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="selecao3" role="onSelection">
				<bindParam name="keyCode" value="ENTER"/>
			</bind>
			<bind component="selecao3" role="stop"/>
			<bind component="opcao1" role="start"/>
		</link>
		<link id="endEmerUP" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="selecao32" role="onSelection">
				<bindParam name="keyCode" value="CURSOR_UP"/>
			</bind>
			<bind component="selecao32" role="stop"/>
			<bind component="opcao1" role="start"/>
		</link>
		<link id="endEmerOK" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="selecao32" role="onSelection">
				<bindParam name="keyCode" value="ENTER"/>
			</bind>
			<bind component="selecao32" role="stop"/>
			<bind component="opcao1" role="start"/>
		</link>

		<link id="fundoStart" xconnector="onBegin1StartN">
			<bind component="fundo" role="onBegin"/>
			<bind component="opcao1" role="start"/>
		</link>
			
		<link id="Selecao_OK1" xconnector="onSelection1StopNStartN">
			<bind component="opcao1" role="onSelection"/>
			<bind component="selecao1" role="start"/>
			<bind component="opcao1" role="stop"/>
		</link>
		<link id="Selecao_OK2" xconnector="onSelection1StopNStartN">
			<bind component="opcao2" role="onSelection"/>
			<bind component="selecao2" role="start"/>
			<bind component="opcao1" role="stop"/>
		</link>
		<link id="Selecao_OK3" xconnector="onSelection1StopNStartN">
			<bind component="opcao3" role="onSelection"/>
			<bind component="selecao3" role="start"/>
			<bind component="opcao1" role="stop"/>
		</link>
			
			
		<link id="opcaoStart" xconnector="onBegin1StartN">
			<bind component="opcao1" role="onBegin"/>
			<bind component="opcao2" role="start"/>
			<bind component="opcao3" role="start"/>
		</link>
		<link id="opcaoStop" xconnector="connectors#onEnd1StopN">
			<bind component="opcao1" role="onEnd"/>
			<bind component="opcao2" role="stop"/>
			<bind component="opcao3" role="stop"/>
		</link>	
		<link id="fecha" xconnector="connectors#onKeySelection1StopN">
			<bind component="opcao1" role="onSelection">
				<bindParam name="keyCode" value="BLUE" />
			</bind>
			<bind component="opcao1" role="stop" />
			<bind component="fundo" role="stop" />
			<bind component="logo" role="stop" />	
		</link>
	</body>
</ncl>
