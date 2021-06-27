<%@ page import="java.sql.*,java.io.*,utility.*" %>
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
MultiBanking Transection System
</div>
<% 
response.setContentType("text/html");
	String cid=request.getParameter("cid");
	String password=request.getParameter("password");
	String username=request.getParameter("cname");
	String bank=request.getParameter("bank");
	String transectionpass=request.getParameter("transectionpass");
	String account=request.getParameter("account");
	String accounttype=request.getParameter("accounttype");
	int balance=Integer.parseInt(request.getParameter("balance"));
	ConnectionUtility con1 = new ConnectionUtility();
	Connection con=null;
	try
	{
		con=con1.getConnection();
		PreparedStatement ps=con.prepareStatement(  
		"insert into customer(cid,pwd,accno,atype,cname,bname,bal,tpwd,status) values(?,?,?,?,?,?,?,?,?)");  
		  
		  
		ps.setString(1,cid);  
		ps.setString(2,password);   
		ps.setString(3,account);  
		ps.setString(4,accounttype);  
		ps.setString(5,username);   
		ps.setString(6,bank);  
		ps.setInt(7,balance);  
		ps.setString(8,transectionpass);   
		ps.setInt(9,0);

		int i=ps.executeUpdate();  
		if(i>0)  
		out.print("You have successfully registered...");  
		      
		          
		}catch (Exception e2) {System.out.println(e2);}
		  finally
		  {
			  try
			  {
				 con.close(); 
			  }catch (Exception e2) {System.out.println(e2);}
		  }

	
	
		%>
		
		</body>
</html>