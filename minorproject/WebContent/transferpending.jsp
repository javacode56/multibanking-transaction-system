<%@ page import="java.sql.*,utility.*,java.util.*,beans.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table border="1">
<tr><th>Id</th><th>account no</th><th>destination account no</th><th>Amount</th><th>account type</th><th>destination account type</th><th>transaction password</th><th>bank</th><th>destination bank</th><th>action1</th><th>action2</th></tr>

<%
ArrayList<Bankerpojo1> list = getPendingtransferRequest();
Iterator<Bankerpojo1> itr = list.iterator();
while(itr.hasNext())
{
	Bankerpojo1 cust = (Bankerpojo1)itr.next();
%>


<tr><td><%=cust.getId() %></td><td><%=cust.getAccno() %></td><td><%=cust.getDaccno() %></td><td><%=cust.getAmt() %></td><td><%=cust.getAtype() %></td><td><%=cust.getDatype() %></td><td><%=cust.getTpwd() %></td><td><%=cust.getBname() %></td><td><%=cust.getDbname() %></td><td><a href="accepttranfer.jsp?accno=<%=cust.getAccno()%>&daccno=<%=cust.getDaccno()%>&amt=<%=cust.getAmt()%>">Accept</a></td><td><a href="declinetransfer.jsp?accno=<%=cust.getAccno()%>&daccno=<%=cust.getDaccno()%>&amt=<%=cust.getAmt()%>">Decline</a></td></tr>	
<%
		}  
     	%>
</table>

<%!
	public ArrayList<Bankerpojo1> getPendingtransferRequest()
	{	
		ArrayList<Bankerpojo1> list=null;
		ConnectionUtility con1 = new ConnectionUtility();
		Connection con=null;
		try
		{
			con=con1.getConnection();
		    Statement st=con.createStatement();
		   
			String query="Select distinct * from transfer";
			ResultSet set=st.executeQuery(query);
			list = new ArrayList<Bankerpojo1>();
			while(set.next())
			{
				Bankerpojo1 cust = new Bankerpojo1();
				cust.setDatype(set.getString(6));
				cust.setDaccno(set.getString(3));
				cust.setAccno(set.getString(2));
				
				cust.setAtype(set.getString(5));
				cust.setDbname(set.getString(9));
				cust.setBname(set.getString(8));
				cust.setAmt(set.getInt(4));
				
				cust.setTpwd(set.getString(7));
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