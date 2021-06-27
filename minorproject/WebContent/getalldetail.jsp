<%@ page import ="beans.*,java.io.*,java.sql.*,java.util.*,utility.*" %>
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
<table border="1">
		<tr><th>sourse id</th><th>destination ID</th><th>sbank</th><th>destination bank</th><th>amount</th></tr>
<% 
string sname=request.getParameter("sname");
ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select scid,dcid,sbname,dbname,dbal from taccept where sbname='"+sname+"'";
			ResultSet cust=st.executeQuery(query);
			while(cust.next())
			{
				
			
			%>
					<tr><td><%=cust.getInt(1) %></td><td><%=cust.getInt(6) %></td><td><%=cust.getString(4)%></td><td><%=cust.getString(9)%></td><td><%=cust.getInt(10)%></td></tr>	

			<%
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
    </table>

	<a href="home.html">home page</a>
</body>
</html>