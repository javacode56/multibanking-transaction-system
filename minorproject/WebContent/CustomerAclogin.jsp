<%@ page import="java.sql.*,java.io.*,utility.*" %>
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
<div id="adminid">
MultiBanking Transaction System
</div>
<% 
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	Connection con=null;
	ConnectionUtility con1 = new ConnectionUtility();

	try{  
		con=con1.getConnection();  
		  
		PreparedStatement ps=con.prepareStatement(  
		"insert into clogin(cid,pwd,status) values(?,?,?)");  
		ps.setString(1,username);  
		ps.setString(2,password);   
		ps.setInt(3,0); 
		int i=ps.executeUpdate();  
		if(i>0)  
		out.print("You request have gone to admin");  
		    
		          
		}catch (Exception e2) {System.out.println(e2);}  
		           
		finally
		{
			try
			{
				con.close();
			}catch(Exception e)
			{
				System.out.println(e);
			}
		}
	
%>
<a href="home.html">home page</a> 
</body>
</html>