<!---
  --- loginPageValidation
  --- -------------------
  ---
  --- author: abhijitm
  --- date:   8/17/16
  --->
<cfcomponent accessors="true" output="true" persistent="true">
		<cffunction
			name = "checkFromDb"
			access = "public"
			returnType = "string">
				<cfquery
				name = "accessDB"
				dataSource = "REGFORM">
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
						dataSource = "REGFORM">
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

			</cffunction>
</cfcomponent>