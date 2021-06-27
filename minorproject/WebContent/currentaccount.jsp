<%@page import="java.sql.*,java.util.*,beans.*,utility.*" %>
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
MultiBanking Transaction System
</div>
<table border="1">
		<tr><th>Id</th><th>Cid</th><th>password</th><th>account no</th><th>account type</th><th>Customer name</th><th>Bank name</th><th>balance</th><th>transection password</th><th>Status</th></tr>
<% 
String ap=request.getParameter("bank");
System.out.println("bank3="+ap);
ArrayList<Bankerpojo1> list = getPendingAccountRequest(ap);
Iterator<Bankerpojo1> itr = list.iterator();
while(itr.hasNext())
{
	Bankerpojo1 cust = (Bankerpojo1)itr.next();
%>
<tr><td><%=cust.getId() %></td><td><%=cust.getCid() %></td><td><%=cust.getPwd() %></td><td><%=cust.getAccno() %></td><td><%=cust.getAtype() %></td><td><%=cust.getCname() %></td><td><%=cust.getBname() %></td><td><%=cust.getBal() %></td><td><%=cust.getTpwd() %></td><td><%=cust.getStatus() %></td></tr>	
<%
}  
	%>
</table>

<%!
public ArrayList<Bankerpojo1> getPendingAccountRequest(String k)
{	
	
	ArrayList<Bankerpojo1> list=null;
	ConnectionUtility con1 = new ConnectionUtility();
	Connection con=null;
	String acc="CURRENT ACCOUNT";
	try
	{
		con=con1.getConnection();  
	    Statement st=con.createStatement();
	    
		String query="Select distinct * from customer where  bname='"+k+"' and atype='"+acc+"'";
		ResultSet set=st.executeQuery(query);
		list = new ArrayList<Bankerpojo1>();
		while(set.next())
		{
			Bankerpojo1 cust = new Bankerpojo1();
			cust.setId(set.getInt(1));
			cust.setCid(set.getString(2));
			cust.setPwd(set.getString(3));
			cust.setAccno(set.getString(4));
			
			cust.setAtype(set.getString(5));
			cust.setCname(set.getString(6));
			cust.setBname(set.getString(7));
			cust.setBal(set.getInt(8));
			
			cust.setTpwd(set.getString(9));
			cust.setStatus(set.getInt(10));
			list.add(cust);
			
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
return list;
}
%>
	
<a href="home.html">home page</a>
</body>
</html>