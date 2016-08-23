/*
=========================================================================
FILE NAME : signup_page.js
FILE TYPE : JAVASCRIPT FILE
PURPOSE : ADDS CLIENT SIDE VALIDATION FOR THE REGISTRATION PAGE FORM TAGS
DATE CREATED : 03/08/2016
TIME CREATED : 4:02PM 
CREATED BY : Abhijit Mohanty
=========================================================================
*/


//method to validate User Name

function checkUserName()
{
	var x = document.getElementById("uname").value;
	//area to check for special characters
	var k = x.search(/^\w{6,15}$/);
	if (k<0)
		{
			var message="User name can't contain special characters excluding _";
		}
	else 
		{
			var message ="";
		}

	//area to check for proper format
	if (x == null || x == "") 
	   	{
	       	var message="Name must be filled out";
	        	//return false;
	   	}
	else if (x.length>15 || x.length<6)
	   	{
	   		var message="User Name Must be between 6-15 characters";
	   	}
	else if (x == "password" || x == "username")
	   	{
	   		var message="Please Choose Another User Name";
	   	}
			    
	 document.getElementById("unamespan").innerHTML=message;
}

//method to validate password
function checkPassword(inputtxt)   
{   
	var x = document.getElementById("pswrd").value;
		
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,8}$/;
	  
		
	if (inputtxt.value.match(passw))   
		{   
			var message = " ";
				  
		}  
		
	else 
		{   
			var message ="Use Alphanumeric Password with 1 uppercase";  
				  
		}
	if ( x.length > 8 || x.length <5 )
		{
			var message = "Password must be 5-8 characters."
		}
	if (x == null || x == "")
		{
			var message = "Password Field Cannot be blank.";
		}
		
		document.getElementById("pswrdspan").innerHTML=message;
}  
		
//method to check if both passwords are same or not
function checkRetypePassword()
{
	var x = document.getElementById("pswrd").value;
	var y = document.getElementById("retype_pswrd").value;
	if ( y == null || y == "" )
		{
			var message = "This field cannot be blank";
		}

	else if (x != y)
		{
			var message = "Passwords Do Not Match. Try Again.";
		}
		
	else  if ( x == y)
		{
			var message="";
		}
	
	
	document.getElementById("repswrdspan").innerHTML=message;
}

//method to check name is only alphabets

function checkFirstName(inputtxt)  
{  
   //first name should contain only alphabets
	var x = document.getElementById("fname").value;
	var letters = /^[A-Za-z]+$/;  
	if (inputtxt.value.match(letters))  
		{  
			var message=" ";
		}  
	else  
	    {  
			var message="Should Contain only Alphabets"; 
	    }  
	if ( x == null || x == "")
	   	{
	   		var message = "This field cannot be blank.";
	   	}
	else 
		{
			var message = " ";
		}	
		document.getElementById("fnamespan").innerHTML=message;
}  

//method to check last name is only alphabets
function checkLastName(inputtxt)  
{  
	var letters = /^[A-Za-z]+$/;
	var x = document.getElementById("lname").value;
	if ( x == null || x =="")
		{
			var message = "This field cannot be blank";
		}
	else if( inputtxt.value.match(letters) )  
   		{  
			var message=" "; 
   		}  
	else  
	    {  
			var message="Should Contain only Alphabets"; 
	    }  
  
	document.getElementById("lnamespan").innerHTML=message;
}  
//method to check Address Line 1
function checkAddress1()
{
	var x = document.getElementById("addr1").value;
	if ( x == null || x =="" )
	  	{
			var message = "This field cannot be blank";
	  	}
	else 
		{
			var message = " ";
		}
	document.getElementById("addr1span").innerHTML = message;
}

//method to check Address Line 2
function checkAddress2()
{
	var x = document.getElementById("addr2").value;
	if ( x == null || x =="" )
		{
			var message = "This field cannot be blank";
	   	}
	else 
		{
			var message = " ";
		}
	document.getElementById("addr2span").innerHTML = message;
}

//method to check City field
function checkCity()
{
	var x = document.getElementById("city").value;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else 
		{
			var message = " ";
		}
	document.getElementById("cityspan").innerHTML = message;
}

//method to check State field
function checkState()
{
	var x = document.getElementById("state").value;
	if ( x == null || x =="" )
		{
			var message = "This field cannot be blank";
		}
	else 
		{
			var message = " ";
		}
	document.getElementById("statespan").innerHTML = message;
}

//method to check PIN
function checkPin()
{
	var x = document.getElementById("pin").value;
	var check = x.search("^[0-9]{6}$");
	if ( x == null || x == "")
		{
			var message = "This field cannot be blank.";
		}
	else if (check < 0)
		{
			var message = "Should contain only numbers 0-9.(6 digits)";
		}
	else if (check>0)
		{
			var message =" ";
		}
	else 
		{
			var message = " ";
		}
	
	document.getElementById("pinspan").innerHTML=message;
}
//method to check Email field
function checkEmail()
{
	
	var x = document.getElementById("email").value;
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos<1 || dotpos < atpos+2 || dotpos+2 >= x.length ) 
		{
			var message = "Not a valid e-mail address";
	    }
	else 
		{
			var message = " ";
		}
	var y = document.getElementById("email").value;
	if ( y == null || y =="" )
		{
			var message = "This field cannot be blank";
		}

	document.getElementById("emailspan").innerHTML = message;
}
//method to check Company field
function checkCompany()
{
	var x = document.getElementById("company").value;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else 
		{
			var message = " ";
		}
	document.getElementById("companyspan").innerHTML = message;
}
//method to check date of birth field 
function checkDOB()
{
	var x = document.getElementById("dob").value;
	
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else 
	  	{
			var message = " ";
	  	}
	
	document.getElementById("dobspan").innerHTML = message;
}
//method to check occupation field
function checkOccupation()
{
	var x = document.getElementById("occupation").value;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else 
		{
			var message = " ";
		}
	document.getElementById("occupationspan").innerHTML = message;
}
//method to check country field
function checkCountry()
{
	var x = document.getElementById("country").value;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else 
		{
			var message = " ";
		}
	document.getElementById("countryspan").innerHTML = message;
}
// method to check phone number is only digits
function checkPhNo()
{
	//phone number must be of 10 digits
	//phone number should not contain any alphabets
	var x = document.getElementById("phno").value;
	var check = x.search("^[0-9]{10}$");
	if ( x == null || x == "")
		{
			var message = "This field cannot be blank.";
		}
	else if (check < 0)
		{
			var message = "Should contain only numbers 0-9.(10 digits)";
		}
	else if (check>0)
		{
			var message =" ";
		}
	else 
		{
			var message = " ";
		}
	
	document.getElementById("phnospan").innerHTML=message;
}

/*function goBack()
	{
	    window.history.back();
	}*/

// method to check if all fields have been filled or not
/*function checkAll()
{
	checkUserName();
	checkPassword(document.myForm.pswrd);
	checkRetypePassword();
	checkFirstName(document.myForm.fname);
	checkLastName(document.myForm.lname);
	checkFirstName();
	checkLastName();
	checkAddress1();
	checkAddress2();
	checkCity();
	checkState();
	checkPin();
	checkEmail();
	checkCompany();
	checkPhNo();
	checkCountry();
	checkOccupation();
	checkDOB();
}*/