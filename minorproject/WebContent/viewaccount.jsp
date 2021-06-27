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

String aa=request.getParameter("username");
String bb=request.getParameter("password");
String query="Select distinct * from customer where cid='"+aa+"' and pwd='"+bb+"'";
ResultSet set=st.executeQuery(query);
set.next();
%>

<table border="1">
<tr><th>Cid</th><th>password</th><th>account no</th><th>account type</th><th>Customer name</th><th>Bank name</th><th>balance</th><th>transaction password</th></tr>
<tr><td><%=set.getString(2) %></td><td><%=set.getString(3) %></td><td><%=set.getString(4) %></td><td><%=set.getString(5) %></td><td><%=set.getString(6) %></td><td><%=set.getString(7) %></td><td><%=set.getInt(8) %></td><td><%=set.getString(9) %></td></tr>	

</table>

<%	
	String w=set.getString(2);
System.out.println("cid="+w);

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

%>
<a href="home.html">home page</a>
</body>
</html>