<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
		Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("name")){
				Cookie cookie = new Cookie("name", URLEncoder.encode("jsp프로그래밍", "utf-8"));
				response.addCookie(cookie);
			}
		}
	}
	Cookie cookie2 = new Cookie("Cname", URLEncoder.encode("10초후삭제용", "utf-8"));
	cookie2.setPath("/chapter09/path1");
	cookie2.setMaxAge(100); // 생성 10초후 삭제됨
	response.addCookie(cookie2);
	Cookie cookie3 = new Cookie("Cname", URLEncoder.encode("10초후삭제용2", "utf-8"));
	cookie3.setMaxAge(10); // 생성 10초후 삭제됨
	response.addCookie(cookie3);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 변경</title>
</head>
<body>
name 쿠키값을 변경한다 같은경로 쿠키이름은 중복이 허용되지 않으므로 새로운객체를 같은 이름으로 생성하면 앞의 객체를 삭제하고 붙여넣는다.
쿠키 삭제기능은 제공하지 않고 유효시간을 0초로 지정해서 응답헤더에 추가하면 웹 브라우저가 관련쿠키를 삭제한다.
setMaxAge()의 매개변수는 초
</body>
</html>