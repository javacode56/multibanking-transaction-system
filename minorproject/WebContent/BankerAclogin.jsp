<%@ page import="java.sql.*,java.io.*,utility.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="adminid">
MultiBanking Transaction System
</div>
<%
response.setContentType("text/html");
String bankname=request.getParameter("bankname");
String password=request.getParameter("password");
String bid=request.getParameter("bid");
ConnectionUtility con1 = new ConnectionUtility();
Connection con=null;
try{  
	con=con1.getConnection();  
	  
	PreparedStatement ps=con.prepareStatement(  
	"insert into blogin(bid,pwd,bname,status) values(?,?,?,?)");  
	ps.setString(3,bankname);  
	ps.setString(2,password);
	ps.setString(1,bid);
	ps.setInt(4,0); 
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