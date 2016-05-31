<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="unimed" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! CABEÇALHO DO PROGRAMA
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
	<head>
	   <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE REGIÕES:
       ! define as regiões na tela onde as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<regionBase>
			<region id="rgTV" height="100%" width="100%">
				<region id="rgI" width="10%" height="10%" bottom="5%" right="5%" zIndex="2"/>				
				<region id="rgLua" height="100%" width="100%"/>
			</region>
		</regionBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! BASE DE DESCRITORES:
       ! define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<descriptorBase>
			<descriptor id="dI" region="rgI"/>
			<descriptor id="dLua" region="rgLua" focusIndex="luaMenu" />			
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
			<causalConnector id="onEnd1StopN">
				<simpleCondition role="onEnd"/>
				<simpleAction max="unbounded" qualifier="par" role="stop"/>
			</causalConnector>
			<causalConnector id="onBeginStartNStopN">
				<simpleCondition role="onBegin"/>
				<compoundAction operator="par">
					<simpleAction max="unbounded" qualifier="par" role="start"/>					
					<simpleAction max="unbounded" qualifier="par" role="stop"/>	
				</compoundAction>				
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
		

		<port component="controlador" id="pControl"/>
				
		
		<media id="programSettings" type="application/x-ginga-settings">
			<property name="service.currentKeyMaster" value="luaMenu"/>
		</media>
		
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! MÍDIAS:
       ! define o local dos arquivos de mídia e as associa com seus descritores
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->		
		<media descriptor="dI" id="icon" src="img/msg_icone_verde.png"/>	
		<media descriptor="dLua" id="controlador" src="frame/main.lua"/> 

		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       ! ELOS
       ! define os elos que regem o sincronismo entre as mídias
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		
		
	</body>
</ncl>
