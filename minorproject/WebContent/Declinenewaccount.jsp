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
ConnectionUtility con1 = new ConnectionUtility();
Connection con=null;
try
{
	con=con1.getConnection();
int n1=Integer.parseInt(request.getParameter("userdeclineaction"));
String a=request.getParameter("custid");
String b=request.getParameter("custpwd");
String c=request.getParameter("custaccno");
String d=request.getParameter("custbname");
	


String query="delete from customer where id='"+n1+"'";
	Statement st=con.createStatement();
	int t=st.executeUpdate(query);
	
	PreparedStatement ps=con.prepareStatement(  
			"insert into creject values(?,?,?,?)");

	System.out.println(a+b+c+d);
	ps.setString(1,a);
	ps.setString(2,b);
	ps.setString(3,c);
	ps.setString(4,d);

	int ip=ps.executeUpdate();	
	
	
if(t>0&&ip<0)
{
	out.print("rejected annd savesd in crejected  successfully");
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