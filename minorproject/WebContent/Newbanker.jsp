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
MultiBanking Transection System
</div>
<%
String bankname=request.getParameter("bname");
ConnectionUtility con1 = new ConnectionUtility();
Connection con=null;
try
{
	con=con1.getConnection(); 
	PreparedStatement ps=con.prepareStatement(  
	"insert into bank(bname) values(?)");  
	  
	  
	ps.setString(1,bankname);  

	int i=ps.executeUpdate();  
	if(i>0)  
	out.print("You have successfully registered...");  
	      
	          
	}catch (Exception e2) {System.out.println(e2);}
	  finally
	  {
		  try
		  {
			 con.close(); 
		  }catch (Exception e2) {System.out.println(e2);}
	  }

%>
</body>
</html>