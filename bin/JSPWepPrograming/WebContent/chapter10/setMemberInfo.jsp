<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.setAttribute("MEMBERID", "madvirus");
    session.setAttribute("NAME", "민석");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 정보 저장</title>
</head>
<body>
세션에 정보저장완료 <br>
session 속성 값 : 
<%= session.getAttribute("NAME") %>

</body>
</html>