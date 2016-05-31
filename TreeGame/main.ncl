<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="gameNcl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<!-- Regioes -->
		<regionBase>
			<region id="rgTv">
				<region id="rgIntro" height="100%" width="100%" zIndex="1"/>
				<region id="rgGame" height="100%" width="100%" zIndex="2"/>
			</region>
		</regionBase>
		<!-- Descritores -->
		<descriptorBase>
			<descriptor id="dIntro" region="rgIntro"/>
			<descriptor focusIndex="luaGame" id="dGame" region="rgGame"/>
			<descriptor id="dSong" region="rgTv"/>
		</descriptorBase>
		<!-- Conectores -->
		<connectorBase>
			<causalConnector id="onKeySelection1StartNStopN">
				<connectorParam name="keyCode"/>
				<simpleCondition key="$keyCode" role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" role="stop" qualifier="seq"/>
					<simpleAction max="unbounded"  role="start" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onStopStop">
				<simpleCondition role="onBegin"/>
				<simpleAction role="stop" max="unbounded"/>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<!-- Porta -->
		<port component="lua" id="pBody"/>
		<!-- Medias -->
		<media id="programSettings" type="application/x-ginga-settings">
			<property name="service.currentKeyMaster" value="luaGame"/>
		</media>
		<!-- Controle -->
		<media id="lua" src="athus/main.lua" descriptor="dGame">
			<area id="end"/>			
		</media>	
		
		<link id="StopApp" xconnector="onStopStop">
			<bind component="lua" interface="end" role="onBegin"/>
			<bind component="lua" role="stop"/>
			<bind component="programSettings" role="stop"/>
		</link>	
	
	</body>
</ncl>
