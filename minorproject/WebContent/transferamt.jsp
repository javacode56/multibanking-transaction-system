<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String a=request.getParameter("username");
String b=request.getParameter("password");
String c=request.getParameter("bank");
%>
<body>
<a href="tothesamebank.jsp?username=<%=a %>&password=<%=b %>&bank=<%=c %>">to the same bank</a>
<a href="tothedifferentbank.jsp?username=<%=a %>&password=<%=b %>&bank=<%=c %>">to the different bank</a>
<a href="home.html">home page</a>
</body>
</html>