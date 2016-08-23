<!---
=========================================================================
FILE NAME : login_page_action.cfm
FILE TYPE : COLD FUSION MARKUP LANGUAGE PAGE
PURPOSE : CONTAINS CFHTML CODE TO SHOW A SUCCESSFUL OR FAILED LOG IN FORM
DATE CREATED : 16/08/2016
TIME CREATED : 03:08PM
CREATED BY : Abhijit Mohanty
=========================================================================
--->
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type= "text/css" href="../Assets/Stylesheets/login_stylesheet.css">

</head>
	<body>
				<cfparam name="session.loggedin" default="false" />
				<cfif NOT session.loggedin>
							</br></br></br></br></br></br></br></br>
					<cfquery
						name = "accessDB"
						dataSource = "REGFORM"

						>
						SELECT USERNAME FROM FORM_DATA
						WHERE  USERNAME = '#Form.login_uname#'
						AND PASSWORD = '#Form.login_password#'
	 				</cfquery>
					<cfif accessDB.RecordCount NEQ 0 >
						<blockquote>
						<h1 id="login_success">
						Hi
						<cfquery
						name = "accessFname"
						dataSource = "REGFORM"
						>
						SELECT FIRST_NAME,LAST_NAME
						FROM FORM_DATA
						WHERE USERNAME = '#Form.login_uname#'
						</cfquery>
						<cfoutput query="accessFname">
						#accessFname.FIRST_NAME# #accessFname.LAST_NAME#
						</br>
						You are successfully logged in.
						</cfoutput>
						</h1>
						</blockquote>

					<cfelse>
						<blockquote>
							<h1>
								User Name or Password Not Correct.</br>
								Please try again.
							</h1>
						</blockquote>
					</cfif>


					<div id="formResult">
					<cfform id="formResult" method="post" action="../Views/logout.cfm">
					<cfinput type="submit" id="logout" value="Log Out" name="logout">
					</cfform>
					</div>
					<cfset session.loggedin = true />
					<cfset sessionRotate() />
				<cfelse>
					<cfoutput>You cannot view this page without logging in.</cfoutput>
				</cfif>



				<!--- <cfset Session.userid = "#Session.CFID#" /> --->

	</body>
</html>
