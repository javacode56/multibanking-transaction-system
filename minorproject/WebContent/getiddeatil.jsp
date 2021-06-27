<%@ page import ="beans.*,java.io.*,java.sql.*,java.util.*,utility.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><%@ page import ="beans.*,java.io.*,java.sql.*,java.util.*,utility.*" %>
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
		<tr><th>sourse id</th><th>destination ID</th><th>sbank</th><th>destination bank</th><th>amount</th></tr>
<% 
string sname=request.getParameter("sname");
ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select scid,dcid,sbname,dbname,dbal from taccept where sbname='"+sname+"' and scid='"+id+"'";
			ResultSet cust=st.executeQuery(query);
			while(cust.next())
			{
				
			
			%>
					<tr><td><%=cust.getInt(1) %></td><td><%=cust.getInt(6) %></td><td><%=cust.getString(4)%></td><td><%=cust.getString(9)%></td><td><%=cust.getInt(10)%></td></tr>	

			<%
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
		
		}  
     	%>
    </table>

	<a href="home.html">home page</a>
</body>
</html>
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
		<tr><th>Bid</th><th>Status</th><th>Action1</th><th>Action2</th></tr>
<% 
response.setContentType("text/html");
		ArrayList<Bankerpojo> list = getPendingbankerRequest();
		Iterator<Bankerpojo> itr = list.iterator();
        while(itr.hasNext())
		{
        	Bankerpojo cust = (Bankerpojo)itr.next();
		%>
		<tr><td><%=cust.getBid() %></td><td><%=cust.getStatus() %></td><td><a href="Acceptbank.jsp?useracceptaction=<%=cust.getId()%>">Accept</a></td><td><a href="Declinebank.jsp?userdeclineaction=<%=cust.getId()%>">Decline</a></td></tr>	
		<%
		}  
     	%>
    </table>

		<%!
	public ArrayList<Bankerpojo> getPendingbankerRequest()
	{	
		ArrayList<Bankerpojo> list=null;
		ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select distinct * from blogin where status=0";
			ResultSet set=st.executeQuery(query);
			list = new ArrayList<Bankerpojo>();
			while(set.next())
			{
				Bankerpojo cust = new Bankerpojo();
				cust.setId(set.getInt(1));
				cust.setPwd(set.getString(3));
				cust.setBid(set.getString(2));
				cust.setStatus(set.getInt(5));
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