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
String c=(String)request.getAttribute("bank");
%>
<a href="viewaccount.jsp?username=<%=a %>&password=<%=b %>">view account information</a><br>
<a href="transferamt.jsp?bank=<%=c %>&username=<%=a %>&password=<%=b %>">transfer amount</a><br>
<a href="transactionreport.jsp">transaction report</a><br>
<a href="credits.jsp?bank=<%=c %>&username=<%=a %>">credits</a><br>

<a href="customer.html">signout</a>
<a href="home.html">home page</a>
</body>
</html>