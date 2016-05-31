<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>

		<regionBase>
			<region height="15%" width="10%" id="rgInterative" left="5%" top="5%"/>
			<region height="30%" width="35%" id="rgLua" left="5%" bottom="15%" zIndex="1"/>
			<region height="40%" width="35%" id="rgPergunta" left="5%" bottom="37%" zIndex="2"/>
		</regionBase>

		<descriptorBase>
			<descriptor id="dInterativo" region="rgInterative"/>
			<descriptor id="dLua" region="rgLua"/>
			<descriptor id="dPergunta" region="rgPergunta"/>
		</descriptorBase>
	
		<connectorBase>
			<importBase alias="connectors" documentURI="connectorBase.ncl"/>
		</connectorBase>
			
	</head>
		
	<body>
		
		<port component="interactive" id="pInicio"/>
		
		<media descriptor="dInterativo" id="interactive" src="media/interactive.png"/>
		<media descriptor="dLua" id="lua" src="main.lua" type="application/x-ginga-NCLua"/>
		<media descriptor="dPergunta" id="pergunta" src="pergunta.lua" type="application/x-ginga-NCLua"/>
		
		<link id="inicio" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="interactive" role="onSelection">
				<bindParam name="keyCode" value="BLUE"/>
			</bind>
			<bind component="lua" role="start"/>
			<bind component="pergunta" role="start"/>
			<bind component="interactive" role="stop"/>
		</link>
			
		<link id="final" xconnector="connectors#onKeySelection1StartNStopN">
			<bind component="lua" role="onSelection">
				<bindParam name="keyCode" value="RED"/>
			</bind>
			<bind component="lua" role="stop"/>
			<bind component="pergunta" role="stop"/>
			<bind component="interactive" role="start"/>
		</link>
	</body>
</ncl>
