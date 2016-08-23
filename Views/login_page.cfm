<!---
===============================================================
FILE NAME : login_page.cfm
FILE TYPE : COLD FUSION MARKUP LANGUAGE PAGE
PURPOSE : CONTAINS CFHTML CODE TO SHOW A LOG IN PAGE
DATE CREATED : 16/08/2016
TIME CREATED : 11:31AM
CREATED BY : Abhijit Mohanty
================================================================
--->



<!DOCTYPE html>
<html>
<head>
	<title>
		Login Page
	</title>

	<link rel="stylesheet" type= "text/css" href="../Assets/Stylesheets/login_stylesheet.css" />
	<!--- <script type="text/javascript" language ="javascript" src="ASSETS/SCRIPT/signup_page.js" >	</script> --->
		<body>
				<!--- basic form elements --->
				</br></br></br></br></br></br></br></br></br>

				<cfparam name="session.loggedin" default="false" />
					<cfif NOT session.loggedin>
						<h1 id="head" class="header" >
							Welcome
						</h1>
						<cfform id="login_form" class="forms" mthod="post" action="../Controllers/login_page_action.cfm">
							<fieldset>
		 	 					<legend>
										Log In
								</legend>
							<div>
							<label>
							User Name :
							<cfinput type="text" id = "login_uname" name = "Form.login_uname" maxlength="15">
							</label>
							<span id = "login_uname_span">
								<!--- User Name Span --->
							</span>
							</div>
							<div>
							<label>
								</br>
							Password :
							<cfinput type="password" id="login_password" name = "Form.login_password" maxlength="8">
							<span id = "login_pswrd_span">
								<!--- Password Span --->
							</span>
							</label>
							</div>
							</br>
							<div id="submit_button">
								<label>
									<input type="submit" value= "Log In" id="login_submit_button" class="buttons">
								</label>
							</div>

							</fieldset>
						</cfform>
						<!--- form design ends --->

  					<cfelse>
						<cflocation url= "../index.cfm">
					</cfif>


		</body>
</head>