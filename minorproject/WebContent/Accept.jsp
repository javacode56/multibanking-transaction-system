<%@ page import="java.util.*,java.sql.*,beans.*,utility.*" %>
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
		
		int n=Integer.parseInt(request.getParameter("useracceptaction"));
			String query="update clogin set status=1 where id='"+n+"'";
			Statement ps=con.createStatement();
			int st=ps.executeUpdate(query);
			
		
		
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