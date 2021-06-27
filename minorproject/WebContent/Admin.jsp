<%@ page import="java.util.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mycss.css">
</head>
<body>
<% 
	PrintWriter out1=response.getWriter();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	try
	{
		
	if(username.equals("admin")&&password.equals("admin"))
			{
				out.print("Welcome "+username);
				RequestDispatcher rd=request.getRequestDispatcher("adminlogin1.html");
				rd.forward(request,response);
				
			}
	else
	{	out.print("Invalid UserName and Password");
		RequestDispatcher rd=request.getRequestDispatcher("home.html");
		rd.include(request,response);	
	}
	}catch(Exception e)
	{
		System.out.println(e);
	}
	%>
	
</body>
</html>