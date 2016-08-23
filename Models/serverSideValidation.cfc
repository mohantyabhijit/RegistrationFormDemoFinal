/*
 ===============================================================
FILE NAME : serverSideValidation.cfc
FILE TYPE : COLD FUSION COMPONENT PAGE
PURPOSE : CONTAINS SERVER SIDE VAIDATION OF REGISTRATION FORM
DATE CREATED : 16/08/2016
TIME CREATED : 06:25PM
CREATED BY : Abhijit Mohanty
================================================================
*/

component serverSideValidation
{
	//method to validate User Name

public string function checkUserName()
{
	//writedump("Hello");abort;


	var x = Form.uname;
	//area to check for special characters
	var k = REMatch("/^\w{6,15}$/", Form.uname);
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

	 return message;
}

//method to validate password
public string function checkPassword(inputtxt)
{
	var x = Form.pswrd;

	var passw = "/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,8}$/" ;


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
			var message = "Password must be 5-8 characters.";
		}
	if (x == null || x == "")
		{
			var message = "Password Field Cannot be blank.";
		}

		return message;
}

//method to check if both passwords are same or not
public string function retypePassword()
{
	var x = Form.pswrd;
	var y = Form.retype_pswrd;
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


	return message;
}

//method to check name is only alphabets

public string function checkFirstName(inputtxt)
{
   //first name should contain only alphabets
	var x = Form.fname;
	var letters = "/^[A-Za-z]+$/";
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
		return message;
}

//method to check last name is only alphabets
public string function checkLastName(inputtxt)
{
	var letters = "/^[A-Za-z]+$/" ;
	var x = Form.lname;
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

	return message;
}
//method to check Address Line 1
public string function checkAddress1()
{
	var x = Form.addr1;
	if ( x == null || x =="" )
	  	{
			var message = "This field cannot be blank";
	  	}
	else
		{
			var message = " ";
		}
	return message;
}

//method to check Address Line 2
public string function checkAddress2()
{
	var x = Form.addr2;
	if ( x == null || x =="" )
		{
			var message = "This field cannot be blank";
	   	}
	else
		{
			var message = " ";
		}
	return message;
}

//method to check City field
public string function checkCity()
{
	var x = Form.city;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else
		{
			var message = " ";
		}
	return message;
}

//method to check State field
public string function checkState()
{
	var x = Form.state;
	if ( x == null || x =="" )
		{
			var message = "This field cannot be blank";
		}
	else
		{
			var message = " ";
		}
	return message;
}

//method to check PIN
public string function checkPin()
{
	var x = Form.pin;
	var check = x.search("^[0-9]{6}$");
	if ( x == null || x == "")
		{
			var message = "This field cannot be blank.";
		}
	else if (check < 0)
		{
			var message = "Should contain only numbers 0-9.(6 digits)";
		}
	else if (check > 0)
		{
			var message =" ";
		}
	else
		{
			var message = " ";
		}

	return message;
}
//method to check Email field
public string function checkEmail()
{

	var x = Form.email;
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

	return message;
}
//method to check Company field
public string function checkCompany()
{
	var x = Form.company;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else
		{
			var message = " ";
		}
	return message;
}
//method to check date of birth field
public string function checkDOB()
{
	var x = Form.dob;

	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else
	  	{
			var message = " ";
	  	}

	return message;
}
//method to check occupation field
public string function checkOccupation()
{
	var x = Form.occupation;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else
		{
			var message = " ";
		}
	return message;
}
//method to check country field
public string function checkCountry()
{
	var x = Form.country;
	if ( x == null || x =="" )
	   	{
			var message = "This field cannot be blank";
	   	}
	else
		{
			var message = " ";
		}
	return message;
}
// method to check phone number is only digits
public string function checkPhNo()
{
	//phone number must be of 10 digits
	//phone number should not contain any alphabets
	var x = Form.phno;
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

	return message;
}



}





