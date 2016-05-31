<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="gameNcl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<!-- Regioes -->
		<regionBase>
			<region id="rgTv">
				<region id="rgMenu" height="100%" width="100%" zIndex="1"/>
				<region id="rgInteractive" height="10%" width="10%" zIndex="2" right="2.5%" top="2.5%"/> 
			</region>
		</regionBase>
		<!-- Descritores -->
		<descriptorBase>
			<descriptor id="dMenu" region="rgMenu" focusIndex="luaMenu" />
			<descriptor id="dInteractive" region="rgInteractive"/>
		</descriptorBase>
		<!-- Conectores -->
		<connectorBase>
			<importBase documentURI="connectorBase.ncl" alias="cone"/>
		</connectorBase>
	</head>
	<body>
		<!-- Porta -->
		<port component="menu" id="pBody"/>
		<!--<port component="interactive" id="pInteractive"/>-->
		<!-- Medias -->
		<media id="programSettings" type="application/x-ginga-settings">
			<property name="service.currentKeyMaster" value="luaMenu"/>
		</media>
			<!-- Audio -->
		<media descriptor="dMenu" id="menu" src="frame/menu.lua"/>
		<media descriptor="dInteractive" id="interactive" src="frame/midia/i.png"/>
	</body>
</ncl>
