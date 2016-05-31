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
			<rule comparator="eq" id="r4" value="4" var="opcao"/>
			<rule comparator="eq" id="r5" value="5" var="opcao"/>
		</ruleBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE REGIÕES:
       ! define as regiões na tela onde as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<regionBase>
			<region id="rgTV" top="2.5%" left="2.5%" width="95%" height="95%">
				<region id="rgApp" width="100%" height="18.5%" top="80%" zIndex="2"/>
				<region id="rgGuia" width="100%" height="18.5%" top="80%" zIndex="2"/>
				<region id="rgAlerta" width="51%" height="17%" bottom="20%" right="10%" zIndex="2"/>
				<region id="rgAgenda" width="51%" height="50%" bottom="20%" right="10%" zIndex="2"/>
				<region id="rgLogo" width="22.5%" height="19%" zIndex="2"/>
				<region  id="rgResultado" width="50%" height="50%" left="40%" top="30%" zIndex="2"/>
				<region id="rgFundo" width="22.5%" height="59%" top="20%" zIndex="2">
					<region id="rgOpcao2" width="90%" height="9%" left="5%" top="1%" zIndex="2"/>
					<region id="rgOpcao3" width="90%" height="9%" left="5%" top="11%" zIndex="2"/>
					<region id="rgOpcao32" width="90%" height="9%" left="5%" top="21%" zIndex="2"/>
				</region>
			</region>
		</regionBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE DESCRITORES:
       ! define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<descriptorBase>
			<descriptor focusIndex="2" focusSrc="img/menu_btn_guia_on.png" id="dOpcao2" focusBorderWidth="0" moveDown="3" moveUp="32" region="rgOpcao2"/>
			<descriptor focusIndex="3" focusSrc="img/menu_btn_testes_on.png" id="dOpcao3" focusBorderWidth="0" moveDown="32" moveUp="2" region="rgOpcao3"/>
			<descriptor focusIndex="32" focusSrc="img/menu_btn_emergencia_on.png" id="dOpcao32" focusBorderWidth="0" moveDown="2" moveUp="3" region="rgOpcao32"/>
			<descriptor id="dApp" region="rgApp"/>
			<descriptor id="dAgenda" region="rgAgenda"/>
			<descriptor id="dGuia" region="rgGuia"/>
			<descriptor id="dFundo" region="rgFundo"/>
			<descriptor id="dLogo" region="rgLogo"/>
			<descriptor id="dResultado" region="rgResultado">
				<descriptorParam name="scroll" value="automatic"/>
			</descriptor>
			<descriptor id="dAlerta" region="rgAlerta"/>
			<descriptor id="dRemedio" region="rgAlerta" explicitDur="20s"/>
			<descriptor id="dAudio"/>
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
			<causalConnector id="onBegin1StartNdelay">
				<simpleCondition role="onBegin"/>
				<simpleAction max="unbounded" qualifier="par" role="start" delay="30s"/>
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
		<port component="fundo" id="pFundo"/>
		<port component="logo" id="pLogo"/>		
		<media id="nodeSettings" type="application/x-ginga-settings">
			<property name="opcao"/>
		</media>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! MÍDIAS:
       ! define o local dos arquivos de mídia e as associa com seus descritores
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<media descriptor="dLogo" id="logo" src="img/unimed_logomarca.png"/>	
		<media descriptor="dFundo" id="fundo" src="img/menu_bg.png"/>	
		<media descriptor="dOpcao2" id="opcao2" src="img/menu_btn_guia.png"/>
		<media descriptor="dOpcao3" id="opcao3" src="img/menu_btn_testes.png"/>
		<media descriptor="dOpcao32" id="opcao32" src="img/menu_btn_emergencia.png"/>
		<media descriptor="dRemedio" id="remedio" src="img/caixa_horario_medicamento.png"/>
		<media descriptor="dAlerta" id="emer2" src="img/caixa_emergencia.png"/>
			
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! SWITCH:
       ! contém os nós dentre os quais um será selecionado
       ! com base nas regras definidas por bindRule
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<switch id="switchOpcao">
			<!-- caso a regra ri seja válida, dispara o nó selecaoi -->
			<bindRule constituent="switchSubOpcao" rule="r1"/>
			<bindRule constituent="guia" rule="r2"/>
			<bindRule constituent="selecao32" rule="r32"/>
			<bindRule constituent="testes" rule="r3"/>
			<media descriptor="dAlerta" id="selecao32" src="img/caixa_emergencia.png"/>
			
			<context id="guia">
				<port id="pGuiaBg" component="guiaBg"/>
				<port id="pguia" component="selecao2"/>					
				<media descriptor="dGuia" id="selecao2" src="gui/main.lua" type="application/x-ginga-NCLua">
					<area id="areaAgenda"/>
				</media>
				<media descriptor="dGuia" id="guiaBg" src="img/guia_bg.png"/>
				<media descriptor="dAgenda" id="agenda" src="img/agenda_dr1.png"/>
					
				<link id ="endGuia2" xconnector="connectors#onEnd1StopN">
					<bind component="selecao2" role="onEnd"/>
					<bind component="guiaBg" role="stop"/>
				</link>	
				<link xconnector="connectors#onBegin1StartN">
        			<bind role="onBegin" component="selecao2" interface="areaAgenda"/>
					<bind role="start" component="agenda"/>
				</link>
				<link xconnector="connectors#onEnd1StopN">
        			<bind role="onEnd" component="selecao2" interface="areaAgenda"/>
					<bind role="stop" component="agenda"/>
				</link>
				
			</context>
			
			
			<context id="testes">
				<port id="pt2" component="testesBg"/>
				<port id="pt1" component="selecao3"/>				
				<media descriptor="dApp" id="selecao3" src="testes/main.lua" type="application/x-ginga-NCLua"/>
				<media descriptor="dApp" id="testesBg" src="img/testes_bg.png"/>
				<link id ="endTestes" xconnector="connectors#onEnd1StopN">
					<bind component="selecao3" role="onEnd"/>
					<bind component="testesBg" role="stop"/>
				</link>
			</context>
		</switch>

		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! ELOS
       ! define os elos que regem o sincronismo entre as mídias
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<link id ="endGuia" xconnector="connectors#onEndStart">
			<bind component="switchOpcao" role="onEnd"/>
			<bind component="opcao2" role="start"/>
		</link>
			
		<link id="endEmergenciaOK" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="switchOpcao" role="onSelection">
				<bindParam name="keyCode" value="ENTER"/>
			</bind>
			<bind component="switchOpcao" role="stop"/>
			<bind component="opcao2" role="start"/>
		</link>
		<link id="endEmergenciaUP" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="switchOpcao" role="onSelection">
				<bindParam name="keyCode" value="CURSOR_UP"/>
			</bind>
			<bind component="switchOpcao" role="stop"/>
			<bind component="opcao2" role="start"/>
		</link>



		<link id="fundoStart" xconnector="onBegin1StartN">
			<bind component="fundo" role="onBegin"/>
			<bind component="opcao2" role="start"/>
		</link>
		<link id="fundoStartRemedio" xconnector="onBegin1StartNdelay">
			<bind component="fundo" role="onBegin"/>
			<bind component="remedio" role="start"/>
		</link>

		<link id="Selecao_OK2" xconnector="onSelection1SetNStopNStartN">
			<bind component="opcao2" role="onSelection"/>
			<bind component="nodeSettings" interface="opcao" role="set">
				<bindParam name="var" value="2"/>
			</bind>
			<bind component="switchOpcao" role="start"/>
			<bind component="opcao2" role="stop"/>
		</link>
		<link id="Selecao_OK3" xconnector="onSelection1SetNStopNStartN">
			<bind component="opcao3" role="onSelection"/>
			<bind component="nodeSettings" interface="opcao" role="set">
				<bindParam name="var" value="3"/>
			</bind>
			<bind component="switchOpcao" role="start"/>
			<bind component="opcao2" role="stop"/>
		</link>
		<link id="Selecao_OK32" xconnector="onSelection1SetNStopNStartN">
			<bind component="opcao32" role="onSelection"/>
			<bind component="nodeSettings" interface="opcao" role="set">
				<bindParam name="var" value="32"/>
			</bind>
			<bind component="switchOpcao" role="start"/>
			<bind component="opcao2" role="stop"/>
		</link>
		<link id="emer" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="opcao32" role="onSelection">
				<bindParam name="keyCode" value="RED" />
			</bind>
			<bind component="opcao2" role="stop" />
			<bind component="emer2" role="start" />
		</link>
		<link id="endEmerOK" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="emer2" role="onSelection">
				<bindParam name="keyCode" value="ENTER"/>
			</bind>
			<bind component="emer2" role="stop"/>
			<bind component="opcao2" role="start"/>
		</link>
		<link id="endEmerUP" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="emer2" role="onSelection">
				<bindParam name="keyCode" value="CURSOR_UP"/>
			</bind>
			<bind component="emer2" role="stop"/>
			<bind component="opcao2" role="start"/>
		</link>
			
		<link id="opcaoStart" xconnector="onBegin1StartN">
			<bind component="opcao2" role="onBegin"/>
			<bind component="opcao3" role="start"/>
			<bind component="opcao32" role="start"/>
		</link>
		<link id="opcaoStop" xconnector="connectors#onEnd1StopN">
			<bind component="opcao2" role="onEnd"/>
			<bind component="opcao3" role="stop"/>
			<bind component="opcao32" role="stop"/>
		</link>	
		<link id="fecha" xconnector="connectors#onKeySelection1StopN">
			<bind component="opcao2" role="onSelection">
				<bindParam name="keyCode" value="BLUE" />
			</bind>
			<bind component="opcao2" role="stop" />
			<bind component="fundo" role="stop" />
			<bind component="logo" role="stop" />	
		</link>			
	</body>
</ncl>
