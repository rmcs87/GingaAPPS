<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region width="100%"  height="100%" id="rgLuaText" zIndex="1"/>
		</regionBase>

		<descriptorBase>
			<descriptor id="dLuaText" region="rgLuaText"/>
		</descriptorBase>

		<connectorBase>
			<importBase alias="connectors" documentURI="connectorBase.ncl"/>
		</connectorBase>
			
	</head>
	<body>
		<port component="lua" id="pInicio"/>
		
		<media id="lua" src="main.lua" type="application/x-ginga-NCLua" descriptor="dLuaText">
        	<area id="fim"/>
    	</media>
	
	</body>
</ncl>
