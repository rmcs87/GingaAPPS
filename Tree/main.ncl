<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="gameNcl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>		
		<!-- Regioes na PROVIEW -->
		<regionBase>
			<region id="rgTv">
				<region id="rgIntro" left = "60" width="600" height="400"  zIndex="1"/>
				<region id="rgGame" left = "0" width="720" height="480"  zIndex="2"/>
				<region id="rgI" left = "633" top="15" width="54" height="55"  zIndex="3"/>
				<region id="rgChange" left = "635" top="430" width="75" height="26"  zIndex="3"/>
			</region>
		</regionBase>
		
		<!-- Descritores -->
		<descriptorBase>
			<descriptor id="dIntro" region="rgIntro"/>
			<descriptor focusIndex="luaGame" id="dGame" region="rgGame"/>
			<descriptor id="dI" region="rgI"/>
			<descriptor id="dChange" region="rgChange"/>
		</descriptorBase>
		
		<!-- Conectores -->]
		<connectorBase>
			<causalConnector id="onKeySelection1StartNStopN">
				<connectorParam name="keyCode"/>
				<simpleCondition key="$keyCode" role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction max="unbounded" role="stop" qualifier="seq"/>
					<simpleAction max="unbounded"  role="start" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<!-- Porta -->
		<!--<port component="lua" id="pBody"/>-->
		<!--<port id="port" component="video"/>-->
		<port id="port" component="i"/>
		
		<!-- Medias -->			
		<media id="video" src="sbtvd-ts://video" descriptor="dIntro"/>
		
		<media id="i" src="treeLua/imgs/i.png" descriptor="dI"/>
		
		<media id="exit" src="treeLua/imgs/exit.png" descriptor="dI"/>
		
		<media id="programSettings" type="application/x-ginga-settings">
			<property name="service.currentKeyMaster" value="luaGame"/>
		</media>
		
		<media id="lua" src="treeLua/main.lua" descriptor="dGame"/>
		
		<!-- Links -->
		<link xconnector="onKeySelection1StartNStopN">
			<bind role="onSelection" component="i">
				<bindParam name="keyCode" value="BLUE"/>				
			</bind>
			<bind role="start" component="lua"/>
			<bind role="start" component="video"/>
			<bind role="start" component="exit"/>
			<bind role="stop" component="i"/>
		</link>
		
		<link xconnector="onKeySelection1StartNStopN">
			<bind role="onSelection" component="i">
				<bindParam name="keyCode" value="ENTER"/>				
			</bind>
			<bind role="start" component="lua"/>
			<bind role="start" component="video"/>
			<bind role="start" component="exit"/>
			<bind role="stop" component="i"/>
		</link>	
	</body>
</ncl>
