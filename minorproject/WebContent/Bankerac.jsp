<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="adminid">
MultiBanking Transaction System
</div>
<%

String an=(String)request.getAttribute("bname");
System.out.println("bank2="+an);

%>
<a href="listofcustomer.jsp?at1=<%=an%>">list of customer</a><br>
<a href="listofaccount.jsp?at2=<%=an%>">list of account</a><br>
<a href="transferpending.jsp">transfer pending</a><br>
<a href="taccept.jsp">transfer accept</a><br>
<a href="treject.jsp">transfer decline</a><br>
<a href="creject.jsp?">customer rejected</a><br>
<a href="Newaccountpending.jsp?at=<%=an%>">new account pending</a><br>
<a href="getalldetail.jsp?bname=<%=an%>">get all detail for cutomer transaction</a><br>
<a href="get2iddetail.jsp?bname=<%=an%>">get all detail for 2 cutomer transaction</a><br>
<a href="getiddetail.jsp?bname=<%=an%>">get all detail for current cutomer transaction</a><br>
<a href="createnewbankeraccount.html">new bank! create your account here</a>
<a href="home.html">home page</a>
</body>
</html>