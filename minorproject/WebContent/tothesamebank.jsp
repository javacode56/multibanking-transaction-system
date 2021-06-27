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
String a=request.getParameter("username");
String b=request.getParameter("password");
String c=request.getParameter("bank");
//request.setAttribute("username",a);
//request.setAttribute("password",b);
%>
<form action="transferfinal.jsp" method="post">
<input type="text" name="username" value="<%=a%>" style="visibility: hidden">
<input type="text" name="password" value="<%=b%>" style="visibility: hidden">
<input type="text" name="bank" value="<%=c%>" style="visibility: hidden">

Account number:<input type="text" name="account"><br>
source Account type<select name="atype" size="1">
<option value="CURRENT ACCOUNT">CURRENT ACCOUNT</option>
<option value="SAVING ACCOUNT">SAVING ACCOUNT</option>
<option value="RECURRING ACCOUNT">RECURRING ACCOUNT</option>
<option value="FIX DEPOSIT">FIX DEPOSIT</option>
</select><br>
Transaction password:<input type="text" name="tpwd">

Destination Account number:<input type="text" name="daccount"><br>
Destination Account type<select name="datype" size="1">
<option value="CURRENT ACCOUNT">CURRENT ACCOUNT</option>
<option value="SAVING ACCOUNT">SAVING ACCOUNT</option>
<option value="RECURRING ACCOUNT">RECURRING ACCOUNT</option>
<option value="FIX DEPOSIT">FIX DEPOSIT</option>
</select><br>
<input type="text" name="dbank" value="<%=c%>" style="visibility:hidden"><br>
Enter amount:<input type="text" name="amt" ><br>
submit:<input type="submit" >
</form>
<a href="home.html">home page</a>
</body>
</html>