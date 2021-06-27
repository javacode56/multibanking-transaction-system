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
<%
PrintWriter out1=response.getWriter();
String a=request.getParameter("username");
String b=request.getParameter("password");
request.setAttribute("username",a);
request.setAttribute("password",b);
Connection con = null;
ConnectionUtility con1 = new ConnectionUtility();
try
{
	con=con1.getConnection();
	String query="select * from clogin where cid='"+a+"' and pwd='"+b+"'";
	Statement ps=con.createStatement();
	ResultSet st=ps.executeQuery(query);
	st.next();
	String as=st.getString(2);
	String bs=st.getString(3);
	int cs=st.getInt(4);
	
if(as.equals(a)&&bs.equals(b)&&cs==1)
{
	out.print("Welcome "+a);
	
	RequestDispatcher rd=request.getRequestDispatcher("Customerac.jsp");
	rd.forward(request,response);	
}
else
{
	out.println("Invalid Userid and Password");
	RequestDispatcher rd=request.getRequestDispatcher("home.html");
	rd.include(request,response);		
}
}catch(Exception e)
{
System.out.println(e);
}
finally
{
try
{
con.close();	
}catch(Exception e1)
{
	System.out.println(e1);
}
}
%>
</body>
</html>