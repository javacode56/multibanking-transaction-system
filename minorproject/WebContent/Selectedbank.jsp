<%@ page import="java.sql.*,utility.*"%>
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
//String a1=(String)request.getAttribute("username1");
//String b1=(String)request.getAttribute("password1");
String c=request.getParameter("bank");

String a2=request.getParameter("username");
String b2=request.getParameter("password");
request.setAttribute("username",a2);
request.setAttribute("password",b2);
request.setAttribute("bank",c);
ConnectionUtility con1=new ConnectionUtility();
Connection con=null;
try
{
con=con1.getConnection();	
Statement st=con.createStatement();
String query="Select * from customer where cid='"+a2+"' and pwd='"+b2+"'";
ResultSet set=st.executeQuery(query);
set.next();
String p=set.getString(7);

if(p.equals(c)){
	RequestDispatcher rd=request.getRequestDispatcher("customerpage.jsp");
	rd.forward(request,response);
}
else
{
	out.print("you don't have a account in the current bank");
}

}	catch(Exception e)
	{
		System.out.println(e);
	}

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
</body>
</html>