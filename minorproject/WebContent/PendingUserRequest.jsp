<%@ page import ="java.io.*,java.sql.*,java.util.*,beans.*,utility.*" %>
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
		<tr><th>Cid</th><th>Status</th><th>Action1</th><th>Action2</th></tr>
<% 
		ArrayList<Customerpojo> list = getPendingcutomerRequest();
		Iterator<Customerpojo> itr = list.iterator();
        while(itr.hasNext())
		{
			Customerpojo cust = (Customerpojo)itr.next();
		%>
		<tr><td><%=cust.getCid() %></td><td><%=cust.getStatus() %></td><td><a href="Accept.jsp?useracceptaction=<%=cust.getId()%>">Accept</a></td><td><a href="Decline.jsp?userdeclineaction=<%=cust.getId()%>">Decline</a></td></tr>	
		<%
		}  
     	%>
    </table>

		<%!
	public ArrayList<Customerpojo> getPendingcutomerRequest()
	{	
		ArrayList<Customerpojo> list=null;
		ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select distinct * from clogin where status=0";
			ResultSet set=st.executeQuery(query);
			list = new ArrayList<Customerpojo>();
			while(set.next())
			{
				Customerpojo cust = new Customerpojo();
				cust.setId(set.getInt(1));
				cust.setPwd(set.getString(3));
				cust.setCid(set.getString(2));
				String m=set.getString(2);
				System.out.println(m);
				cust.setStatus(set.getInt(4));
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