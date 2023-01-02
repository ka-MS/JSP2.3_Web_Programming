<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
	쿠키목록
	<br>
	<%
		Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
	%>
	<%=cookies[i].getName()%>
	=
	<%=URLDecoder.decode(cookies[i].getValue(), "utf-8")%>
	<br>

	<%
		}
	} else {
	%>쿠키가없음<%
		}
	%>

	쿠키는 Cookie 클래스 객체를 생성하여 만들 수 있음 쿠키 이름과 인코딩 값을 지정해 줄 수 있음 생성된 쿠키값은 브라우저에
	저장이되며 저장된값은 삭제하기 전까지 request.getCookies() 메소드로 배열에 담아 불러올 수 있음

</body>
</html>