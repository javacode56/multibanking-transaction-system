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
PrintWriter out1=response.getWriter();
ConnectionUtility con1 = new ConnectionUtility();
Connection con=null;
try
{
	con=con1.getConnection();
int n1=Integer.parseInt(request.getParameter("userdeclineaction"));
	String query="delete from blogin where id='"+n1+"'";
	Statement ps=con.createStatement();
	int st=ps.executeUpdate(query);
	//System.out.println(name1);
if(st>0)
{
	out.print("rejected successfully");
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
}catch(Exception e)
{
	System.out.println(e);
}
}
%>

</body>
</html>