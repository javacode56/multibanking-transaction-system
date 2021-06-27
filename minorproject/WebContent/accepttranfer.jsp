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
	
	int c=Integer.parseInt(request.getParameter("amt"));
	con=con1.getConnection();
    Statement st=con.createStatement();
   
    System.out.println("1");
	String query3="select * from customer where accno='"+a+"'";
	String query4="select * from customer where accno='"+b+"'";
	
	ResultSet set=st.executeQuery(query3);
	
	
	
	set.next();
	 int sbalance=set.getInt(8);
		
			 
	 ResultSet set1=st.executeQuery(query4);
	set1.next();
	
	
	 int dbalance=set1.getInt(8);
	
	int dif=sbalance-c;
	int sum=dbalance+c;
	request.setAttribute("sum1",sum);
	request.setAttribute("dif1",dif); 
	
	System.out.println("3");
	
	String query="update customer set bal='"+dif+"' where accno='"+a+"'";
	String query1="update customer set bal='"+sum+"' where accno='"+b+"'";
	int i=st.executeUpdate(query);
	int j=st.executeUpdate(query1);
	
	
	
	
	String query6="select * from customer where accno='"+a+"'";
	String query7="select * from customer where accno='"+b+"'";
	
	ResultSet set6=st.executeQuery(query6);
	
	
	
	set6.next();
	 
	 String scid=set6.getString(2);
		String saccno=set6.getString(4);
		String atype=set6.getString(5);
		String sbname=set6.getString(7);
		int sbal=set6.getInt(8);
		
		
	 
		
	 
	 ResultSet set7=st.executeQuery(query7);
	set7.next();
	
	
	 	
	 String dcid=set7.getString(2);
	 
		String daccno=set7.getString(4);
		String dtype=set7.getString(5);
		String dbname=set7.getString(7);
		int dbal=set7.getInt(8);
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	System.out.println("2");
	PreparedStatement ps=con.prepareStatement(  
			"insert into taccept values(?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,scid);
	ps.setString(2,saccno);
	ps.setString(3,atype);
	ps.setString(4,sbname);
	ps.setInt(5,sbal);
	ps.setString(6,dcid);
	ps.setString(7,daccno);
	ps.setString(8,dtype);
	ps.setString(9,dbname);
	ps.setInt(10,dbal);
	
	int ip=ps.executeUpdate();
	
	
	
	
	
	
	
	System.out.println("4");
String query2="delete from transfer where saccno='"+a+"' and daccno='"+b+"' ";
System.out.println("5");
	int k=st.executeUpdate(query2);
	if(k<0)
	{
		System.out.println(" succesfully deleted from transfer");
		}
	
	
	
	
	
	
	
	
		//System.out.println("executed succesfully");
		//RequestDispatcher rd=request.getRequestDispatcher("detailtonext.jsp");
		// //rd.forward(request,response);
	
		
	
	
	
	
	
	
	
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