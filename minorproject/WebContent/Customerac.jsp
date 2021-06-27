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
String a=(String)request.getAttribute("username");
String b=(String)request.getAttribute("password");
//request.setAttribute("username1",a);
//request.setAttribute("password1",b);
%>

<div id="adminid">
MultiBanking Transaction System
</div>
<form action="Selectedbank.jsp?" method="post">
<input type="text" name="username" value="<%=a%>" style="visibility: hidden">
<input type="text" name="password" value="<%=b%>" style="visibility: hidden">
enter your bank name:<select name="bank" size="1">
<option value="SBI">SBI</option>
<option value="AXIS">AXIS</option>
<option value="ICICI">ICICI</option>
<option value="INDIAN BANK">INDIAN BANK</option>
<option value="HDFC">HDFC</option>
</select>
<input type="submit" value="submit">
</form>
<a href="createnewaccount.html">new customer create your account here</a>
<a href="home.html">home page</a>
</body>
</html>