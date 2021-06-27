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
	
	String a=request.getParameter("accno");
	String b=request.getParameter("daccno");
	request.setAttribute("accno",a);
	request.setAttribute("daccno",b);
		
	con=con1.getConnection();
    Statement st=con.createStatement();
	
	String query2="delete from transfer where saccno='"+a+"' and daccno='"+b+"' ";
	System.out.println("5");
		int k=st.executeUpdate(query2);
		if(k<0)
		{
			System.out.println(" succesfully deleted from transfer");
			}
		
		
		
		String query6="select * from customer where accno='"+a+"'";
		
		
		ResultSet set6=st.executeQuery(query6);
		
		
		
		set6.next();
		 
		 String scid=set6.getString(2);
			String saccno=set6.getString(4);
			String atype=set6.getString(5);
			String sbname=set6.getString(7);
			
			
			
		 
			
		System.out.println("2");
		PreparedStatement ps=con.prepareStatement(  
				"insert into reject values(?,?,?,?)");
		ps.setString(1,scid);
		ps.setString(2,saccno);
		ps.setString(3,atype);
		ps.setString(4,sbname);
		
		
		int ip=ps.executeUpdate();
		
	
	
	
	
	
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
System.out.println("i am in accepttransfer");
%>
</body>
</html>