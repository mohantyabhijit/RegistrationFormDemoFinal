<!---
===============================================================
FILE NAME : index.cfm
FILE TYPE : COLD FUSION MARKUP LANGUAGE PAGE
PURPOSE : CONTAINS CFHTML CODE TO SHOW A REGISTRATION FORM
DATE CREATED : 04/08/2016
TIME CREATED : 1:04PM
CREATED BY : Abhijit Mohanty
================================================================
--->
<!DOCTYPE html>
<html>
	<head>
	<title>
		Registration Form
	</title>
		<!--- all included external files --->
		<link rel="stylesheet" type= "text/css" href="Assets/Stylesheets/stylesheet.css">
		<script type="text/javascript" language ="javascript" src="Assets/Script/signup_page.js" >	</script>
		<!--- scripts sources to include Country,State,City fields --->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://iamrohit.in/lab/js/location.js"></script>
	</head>
	<body>
		<!--- top area begins --->
		<div id = "top_area" class="divs">

			<h1 id = "r_page" class = "head">
				REGISTRATION PAGE </br>
			</h1>
			<span id="red_span"> Fields marked * are mandatory
			</span>

		</div>

		<!--- top area ends --->
		<!--- input area begins --->
		<div id="inputarea">
		<cfform id="myForm" name="myForm" method="post" action="Controllers/login_action.cfm">
			<fieldset >
				<legend>Enter Registration Details</legend>
				<p>
				<label>User Name <sup class="red_color">*</sup>:</label>
				<cfinput type="text" name="uname" id="uname" placeholder="6-15 characters " maxlength = "15" onblur="checkUserName()" required="yes" />
				</br>
				<span id="unamespan">
				</span>
				</p>
				<p>
				<label>Password <sup class="red_color">*</sup> :</label>

				<cfinput type="password" name="pswrd" id="pswrd" placeholder="5-8 characters" maxlength = "8"onblur="checkPassword(document.myForm.pswrd)" required="yes" />
				</br>
				<span id="pswrdspan">
				</span>
				</p>
				<p>
				<label>Re-type Password <sup class="red_color">*</sup> :</label>

				<cfinput type="password" name="retype_pswrd" id="retype_pswrd" placeholder="Re-enter Password" maxlength="8" onblur="checkRetypePassword()" required="yes" />
				</p>
				</br>
				<span id="repswrdspan">
				</span>

			</fieldset>
			<fieldset>
				<legend> Enter Personal Details </legend>
				<p>
				<label>First Name <sup class="red_color">*</sup> :</label>

				<cfinput type="text" name="fname" id="fname" placeholder="Enter First Name " maxlength = "15" onblur="checkFirstName(document.myForm.fname)" required="yes"/>
				</br>
				<span id="fnamespan">
				</span>
				</p>
				<p>
				<label>Last Name <sup class="red_color">*</sup> :</label>

				<cfinput type="text" name="lname" id="lname" placeholder="Enter Last Name" maxlength = "15" onblur="checkLastName(document.myForm.lname)" required="yes" />
				</br>
				<span id="lnamespan">
				</span>
				</p>
				<p>
				<label>Gender <sup class="red_color">*</sup> :</label>
				<cfselect name = "gender" id="gender" >
					<option value = "male" selected >Male</option>
					<option value = "female"  >Female</option>
				</cfselect>
				</label>
				</p>
				</br>
				<span id="genderspan">
				</span>
				</p>

				<p>
				<label>Marital Status<sup class="red_color">*</sup> :</label>
				<cfselect name = "marital_status" id="marital_status" >
					<option value = "married" selected >Married</option>
					<option value = "unmarried"  >Unmarried</option>
					<option value = "widowed"  >Widowed</option>
					<option value = "divorced"  >Divorced</option>
				</cfselect>
				</label>
				</br>
				<span id="maritalstatusspan">
				</span>
				</p>

				<p>
				<label>Date Of Birth <sup class="red_color">*</sup> :</label>
				<cfinput type="date" name="dob" id="dob" onblur="checkDOB()" placeholder="Enter Date Of Birth" required="yes" />
				</br>
				<span id="dobspan">
				</span>
				</p>
				<p>
				<label>Occupation <sup class="red_color">*</sup> :</label>
				<cfinput type="input" name="occupation" id="occupation" placeholder="Work?" maxlength = "15" onblur = "checkOccupation()" required="yes" />
				</br>
				<span id="occupationspan">
				</span>
				</p>
				<p>
					<select name="country" class="countries" id="countryId">
					<option value="">Select Country</option>
					</select>
					<select name="state" class="states" id="stateId">
					<option value="">Select State</option>
					</select>
					<select name="city" class="cities" id="cityId">
					<option value="">Select City</option>
					</select>

				</p>

				<p>

				<label>Address1 <sup class="red_color">*</sup> :</label>

				<cfinput type="text" name="addr1" id="addr1" onblur= "checkAddress1()" maxlength = "15" placeholder="Enter Line 1" required="yes" />
				</br>
				<span id="addr1span">
				</span>
				</p>
				<p>

				<label>Address2 <sup class="red_color">*</sup> :</label>

				<cfinput type="text" name="addr2" id="addr2" onblur= "checkAddress2()" maxlength = "15"  placeholder="Enter Line 2" required="yes" />
				</br>
				<span id="addr2span">
				</span>
				</p>

				<p>
				<label>PIN CODE <sup class="red_color">*</sup> :</label>
				<cfinput type="text" name="pin" id="pin" onblur= "checkPin()" maxlength = "6" placeholder="Enter PIN Code" required="yes" />
				</br>
				<span id="pinspan">
				</span>
				</p>
				<p>
				<label>Phone Number <sup class="red_color">*</sup>:</label>

				<cfinput type="text" name="phno" id="phno" placeholder="Enter 10-digit Phone Number" maxlength = "10" onblur="checkPhNo()" required="yes" />
				</br>
				<span id="phnospan">
				</span>
				</p>
				<p>
				<label>E-Mail ID <sup class="red_color">*</sup> :</label>

				<cfinput type="email" name="email" id="email" onblur="checkEmail()" placeholder="name@service.domain"  required="yes" autocomplete="ON"/>
				</br>
				<span id="emailspan">
				</span>
				</p>

				<p>
				<label>Company: <sup class="red_color">*</sup> </label>
				<cfinput type="text" name="company" id="company" onblur="checkCompany()" maxlength = "15" placeholder="Enter Company's Name" required="yes" />
				</br>
				<span id="companyspan">
				</span>
				</p>
				<p>
				</br>
				<cfinput type="submit" name ="submit_button" id="button" class="all_buttons"  value="Submit"  />
				</p>

			</div>
			<!--- input area div ends --->
			</fieldset>
		</cfform>

	</body>
</html>