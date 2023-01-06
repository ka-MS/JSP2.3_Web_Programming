<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/chapter09/path1", "utf-8"));
cookie1.setPath("/chapter09/path1");
response.addCookie(cookie1);
Cookie cookie2 = new Cookie("path2", URLEncoder.encode("경로:", "utf-8"));
response.addCookie(cookie1);
Cookie cookie3 = new Cookie("path3", URLEncoder.encode("경로:/", "utf-8"));
cookie1.setPath("/");
response.addCookie(cookie1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 경로지정</title>
</head>
<body>
쿠키 경로를 지정하면 지정한경로와 하위경로에 대해서만 쿠키를 전송한다.
</body>
</html>