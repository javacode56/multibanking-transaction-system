<%@ page import="java.sql.*,utility.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ConnectionUtility con1 = new ConnectionUtility();
Connection con=null;
try
{	
	con=con1.getConnection();  
	Statement st=con.createStatement();	
	
	String query="Select distinct * from taccept";
	ResultSet set=st.executeQuery(query);
	set.next();
	
	%>

	<table border="1">
	<tr><th>source cid</th><th>source account no</th><th>source account type</th><th>source Bank name</th><th>source balance</th><th>Destination cid</th><th>Destination account no</th><th>Destination account type</th><th>Destination Bank name</th><th>destination balance</th></tr>
	<tr><td><%=set.getString(1) %></td><td><%=set.getString(2) %></td><td><%=set.getString(3) %></td><td><%=set.getString(4) %></td><td><%=set.getInt(5) %></td><td><%=set.getString(6) %></td><td><%=set.getString(7) %></td><td><%=set.getString(8) %></td><td><%=set.getString(9) %></td><td><%=set.getInt(10) %></td></tr>	

	</table>

	<%	
}catch(Exception e)
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
%>
</body>
</html>