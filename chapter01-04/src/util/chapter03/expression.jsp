<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ǥ�����</title>
</head>
<body>
	���� :
	<%=new java.util.Date()%>
	<%
		int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
	%>
	a *b = <%= a*b %>
	a * b = ${param.a * param.b}

</body>
</html>