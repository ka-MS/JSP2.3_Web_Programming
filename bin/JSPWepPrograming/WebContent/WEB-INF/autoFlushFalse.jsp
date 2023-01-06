<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="1kb" autoFlush="false" %>
    <!-- 버퍼는 따로 지정하지 않으면 8kb지정 -->
    <!-- true는 다차면 버퍼를 플러시 하고 계속해서 작업 진행
    false는 다차면 버퍼를 익셉션 발생하고 중단 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 false 예제</title>
</head>
<body>
<!-- 버퍼오버플로우로 중단된다 -->
<% for(int i = 0; i<11; i++){
	%>
<input type="text">
	<%
}
	%>


</body>
</html>