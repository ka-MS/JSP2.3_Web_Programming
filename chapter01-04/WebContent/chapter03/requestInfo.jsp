<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
클라이언트ip = <%= request.getRemoteAddr() %> <br>
요청정보길이 = <%= request.getContentLength() %> <br>
요청uri = <%= request.getRequestURI() %> <br>
서버이름  = <%= request.getServerName() %> <br>
서버포트  = <%= request.getServerPort() %>  <br>
 <br>
 <form action="/chapter03/viewParameter.jsp" method ="post">
 이름: <input type="text" name="name" size="10"> <br>
 주소: <input type="text" name="address" size="10"> <br>
 동물 : <input type="checkbox" name="pet" value="dog">강아지
 <input type="checkbox" name="pet" value="cat">고양이
 <input type="checkbox" name="pet" value="pig">돼지
 
 
 <input type="submit" value="전송">
 </form>


</body>
</html>