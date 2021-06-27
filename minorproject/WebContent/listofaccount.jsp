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
String a=request.getParameter("at2");
%>
<a href="currentaccount.jsp?bank=<%=a%>">CURRENT ACCOUNT</a>
<a href="savingaccount.jsp?bank=<%=a%>">SAVING ACCOUNT</a>
<a href="recurringaccount.jsp?bank=<%=a%>">RECURRING ACCOUNT</a>
<a href="fixdeposite.jsp?bank=<%=a%>">FIX DEPOSIT</a>
</body>
</html>