<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import ="beans.*,java.io.*,java.sql.*,java.util.*,utility.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String a=request.getParameter("username");

String c=request.getParameter("bank");
%>
<% 
ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select from loan where id='"+a+"'";
			ResultSet cust=st.executeQuery(query);
			int credits=(cust.getInt(2)*cust.getInt(3)*cust.getInt(4))/100;
			if(cust.m1&&cust.m2>=credits)
			{
			out.println("credits= A+");
			}
			else
			{
			out.println("credits= b+");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}	
		}
		
		}  
     	%>
</body>
</html>