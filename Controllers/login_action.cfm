<!--
====================================================================================================
TITLE : login_action.cfm
FILE TYPE : COLD FUSION MARKUP LANGUAGE PAGE
PURPPOSE : ADDS SERVER SIDE VALIDATION OF REGISTRATION PAGE FORM ATTRIBUTES USING COLDFUSION TAGS
DATE CREATED : 05/08/2016
TIME CREATED : 4:31PM
CREATED BY   : Abhijit Mohanty
====================================================================================================
-->

<!DOCTYPE html>
<html>
	<head>
		<title>Welcome
		</title>
		<link rel="stylesheet" type= "text/css" href="login_stylesheet.css">
	</head>
		<body>


				<!--- validation code starts here
				code area to do user name validation
				--->

				<cfset Variables.errorMessage = "" >


				<cfif (REFind ( "/^\w{6,15}$/", Form.uname) NEQ 0 ) >

					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage, "User name can't contain special characters excluding _ ", "," )>

				</cfif>

				<cfif ( Form.uname EQ "" || Form.uname EQ " ") >

					<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage,"Name must be filled out", ",") >

	       		</cfif>



	 			<cfif (Len (Form.uname) GT 15 || Len (Form.uname) LT 6) >

	   				<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage, "User Name Must be between 6-15 characters" , ",")>

	   			</cfif>


				<cfif (Form.uname EQ "password" || Form.uname EQ "username") >

	   				<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage, "Please Choose Another User Name" , ",")>

				</cfif>


	   			<!--- //code area to do password field validation --->

				<cfif REFind ( "/^\d*[a-z]*[A-Z]{5,8}$/", Form.pswrd ) NEQ 0 >

						<cfset  Variables.errorMessage = ListAppend(Variables.errorMessage,"Use Alphanumeric Password with 1 uppercase" , "," )>

				</cfif>

				<!--- //code area to compare password inputs from password and re-enter password fields --->
				<cfif ( Form.pswrd NEQ Form.retype_pswrd ) >

					<cfset  Variables.errorMessage = ListAppend ( Variables.errorMessage, "Passwords do not Match.Please Re-enter Password", ",") >

				</cfif>


				<!--- //code area to validate first name text field --->


				<cfif (REFind( "/^[A-Za-z]+$/",Form.fname )) NEQ 0 >

					<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage,"First name should contain only alphabets.",",") >

				</cfif>

				<!--- //code area to validate last name text field --->



				<cfif (REFind( "/^[A-Za-z]+$/",Form.fname )) NEQ 0 >

					<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage,"Last name should contain only alphabets.", ",") >

				</cfif>
				<!--- code area to validate occupation --->

				<cfif Form.occupation EQ "" || Form.occupation EQ " " >

					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"Occupation field cannot be left blank.",",") >

				</cfif>

				<!--- code area to validate address line 1 --->
				<cfif Form.addr1 EQ "" || Form.addr1 EQ " " >

					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"Address field 1 cannot be left blank.",",") >

				</cfif>
				<!--- code area to validate address line 1 --->
				<cfif Form.addr2 EQ "" || Form.addr2 EQ " " >

					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"Address field 2 cannot be left blank.",",") >

				</cfif>
				<!--- code area to validate PIN  --->
				<cfif Form.pin EQ "" || Form.pin EQ " " >
					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"PIN field cannot be left blank", ",")>
				</cfif>

				<cfif (REFind ("^[0-9]{6}$", Form.pin)) EQ 0 >

					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"PIN should be only digits(6 digits)" , ",")>

				</cfif>

				<!--- //code area to validate phone number --->
				<cfif Form.phno EQ "" || Form.phno EQ " ">
					<cfset Variables.errorMessage = ListAppend (Variables.errorMessage,"Phone Number field cannot be left blank", ",")>
				</cfif>

				<cfif ( REFind ("^[0-9]{10}$",Form.phno) ) EQ 0 >

					<cfset  Variables.errorMessage = ListAppend (Variables.errorMessage, "Phone number should be 10 digits only.[0-9]", ",")  >

				</cfif>





				<!--- //validation code ends here --->

				<!--- Area to Print Out the Errors starts --->
<!---

				<cfobject
					component= serverSideValidation.cfc
					name= "message">
				<cfinvoke component = "validation" method="checkUserName" returnVariable="myValidation">
				</cfinvoke>
 --->



				<cfif (Variables.errorMessage) EQ "" >
					<blockquote>

					<cfoutput>
							<h1>Welcome <cfoutput>#Form.fname#</cfoutput>
							</h1>
							<hr>
							</br>
							</br>
							<span>
							<img id = "image" src = "welcome.jpg" alt="welcome image" ></img>
							</span>
					</cfoutput>
					</blockquote>


				<cfelse>
					<blockquote>

					<cfoutput>
							<h1>Welcome <cfoutput>#Form.fname#</cfoutput>
							</h1>
							<hr>
							<u> Sorry we could not register you because of the following errors :-</u>
							</br>
							</br>
							<cfloop index = "errorIndex" list = "#errorMessage#" delimiters = ",">
    						<cfoutput>#errorIndex#<br></cfoutput>
							<br>
							</cfloop>
							<hr>
							<a href = "../index.cfm"> Click to go back and make changes </a>
							</br>
					</cfoutput>
				</cfif>
					</blockquote>
			<!--- Area to print the errors ends --->
			<!--- Area to start DB access begins --->
				<cfif (Variables.errorMessage) EQ "" >
					<cfquery
					name = "pushToDB"
					dataSource = "REGFORM"

					>
						INSERT INTO FORM_DATA
						(
							USERNAME,
							PASSWORD,
							FIRST_NAME,
							LAST_NAME,
							GENDER,
							MARITAL_STATUS,
							DOB,
							OCCUPATION,
							ADDRESS_1,
							ADDRESS_2,
							PIN,
							PHONE_NUMBER,
							EMAIL,
							COMPANY
						)
						VALUES
						(
							'#Form.uname#',
							'#Form.pswrd#',
							'#Form.fname#',
							'#Form.lname#',
							'#Form.gender#',
							'#Form.marital_status#',
							'#Form.dob#',
							'#Form.occupation#',
							'#Form.addr1#',
							'#Form.addr2#',
							 '#Form.pin#',
							 '#Form.phno#',
							 '#Form.email#',
							 '#Form.company#'
						);

					</cfquery>
				 </cfif>
				<cflocation url="../Views/login_page.cfm" / >
		</body>
</html>