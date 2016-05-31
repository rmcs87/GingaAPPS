<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region width="100%"  height="100%" id="rgLuaText" zIndex="2"/>
			<region width="100%"  height="100%" id="rgFundo" zIndex="1"/>
			<region height="15%" width="10%" id="rgLavid" right="10%" bottom="10%" zIndex="2"/>
		</regionBase>
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
       !  BASE DE DESCRITORES:
       !  define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<descriptorBase>
			<descriptor id="dLuaText" region="rgLuaText"/>
			<descriptor id="dFundo" region="rgFundo"/>
			<descriptor id="dLavid" region="rgLavid"/>
		</descriptorBase>

		<connectorBase>
			<importBase alias="connectors" documentURI="connectorBase.ncl"/>
		</connectorBase>
	</head>
	<body>
		<port component="lua" id="pInicio"/>
		
		<media id="fundo" src="media/fundo.png" descriptor="dFundo"/>
		<media descriptor="dLavid" id="lavid" src="media/lavid.png"/>
		<media id="lua" src="main.lua" type="application/x-ginga-NCLua" descriptor="dLuaText">
        	<area id="fim"/>
    	</media>
    		
    		<link id="inicio" xconnector="connectors#onBegin1StartN">
			<bind component="lua" role="onBegin"/>
			<bind component="fundo" role="start"/>
			<bind component="lavid" role="start"/>
		</link>
	
	</body>
</ncl>
