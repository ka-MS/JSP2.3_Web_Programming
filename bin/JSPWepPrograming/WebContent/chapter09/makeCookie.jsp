<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%
	Cookie cookie = new Cookie("Cname", URLEncoder.encode("민석", "utf-8"));
response.addCookie(cookie);
%>
<!-- 쿠키객체 생성 쿠키값과 인코딩 캐릭터를 설정해줌 reponse.addCookie()를 해 줘야 응답에 쿠키를 담아서 보냄-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
	<%=cookie.getName()%>
	쿠키의 값 = "<%=URLDecoder.decode(cookie.getValue(), "utf-8")%>"
	<br> 생성된 쿠키의 값과 이름을 확인할 수 있다.

</body>
</html>