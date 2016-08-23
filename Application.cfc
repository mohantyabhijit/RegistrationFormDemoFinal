/*
====================================================
FILE NAME : Application.cfc
FILE TYPE : COLDFUSION COMPONENT FILE
PURPOSE : TO DO CUSTOM SETTINGS TO THE APPLICATION
DATE CREATED : 10/08/2016
TIME CREATED : 11:33AM
CREATED BY : Abhijit Mohanty
=====================================================
*/

component
{
	this.name = "RegistrationForm";
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement= true;
	this.sessionTimeout = CreateTimeSpan (0, 0, 0, 5);
	this.datasource = "REGFORM";

	function onRequestStart()
	{
		return true;
	}

	param name="session.loggedin" default="false";
		if (session.loggedin==false)
				{
					return "You are not logged in.";
				}



}



