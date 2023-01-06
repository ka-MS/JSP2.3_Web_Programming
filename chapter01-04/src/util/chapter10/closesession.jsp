<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.invalidate();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션종료</title>
</head>
<body>
세션이 종료되었음 <br>
세션ID : <%= session.getId() %> <br>

세션이 종료되면 새로운 세션을 생성함

</body>
</html>