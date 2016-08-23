<!---
===============================================================
FILE NAME : logout.cfm
FILE TYPE : COLD FUSION MARKUP LANGUAGE PAGE
PURPOSE : CONTAINS CFHTML CODE TO LOGOUT OF APPLICATION
DATE CREATED : 16/08/2016
TIME CREATED : 06:25PM
CREATED BY : Abhijit Mohanty
================================================================
--->

<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>

			<cfoutput>
			alert("You have successfully logged out!");
			</cfoutput>
			<cfset session.loggedin = false />
			<cflock timeout=20 scope="Session" type="Readonly">
			<cfset StructClear(Session)>


			</cflock>
			<cfset StructClear (Cookie) />

			<cflocation
			url="login_page.cfm"
			>



	</body>
</html>