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
ConnectionUtility con1=new ConnectionUtility();
Connection con=null;
try
{
	String a=request.getParameter("username");
	String b=request.getParameter("password");
	String c=request.getParameter("bank");
	String j=request.getParameter("dbank");
	String d=request.getParameter("datype");
	String e=request.getParameter("daccount");
	String f=request.getParameter("account");
	String g=request.getParameter("atype");
	String h=request.getParameter("tpwd");
	int i=Integer.parseInt(request.getParameter("amt"));
	
	System.out.println();
	con=con1.getConnection();
	int ammt=Integer.parseInt(request.getParameter("amt"));
	Statement st=con.createStatement();
	String query="Select * from customer where cid='"+a+"' and pwd='"+b+"'";
	ResultSet set=st.executeQuery(query);
	set.next();
	int p=set.getInt(8);
	String op=set.getString(9);
	if(p>=ammt)
	{
		System.out.println("op="+op+"h="+h);
		if(op.equals(h))
		{
			
		PreparedStatement pr=con.prepareStatement("insert into transfer(saccno,daccno,amt,atype,dtype,tpwd,sbank,dbank) values(?,?,?,?,?,?,?,?)");
		pr.setString(1,f);
		pr.setString(2,e);
		pr.setInt(3,i);
		pr.setString(4,g);
		pr.setString(5,d);
		pr.setString(6,h);
		pr.setString(7,c);
		pr.setString(8,j);
		int ip=pr.executeUpdate();  
		if(ip>0)
		{
		out.print("You request have gone to bank");  
		}
		}else
		{
			out.println("wrong transaction password ");
		}
		
	}else
	{
		out.println("you don't hava enough balance to start this session");	
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