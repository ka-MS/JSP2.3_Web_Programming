<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 변경폼</title>
</head>
<body>
<a href="/">홈화면</a> <br>
<form action="/update/update.jsp" method="post">
<table boarder = "1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="memberID" size="10"></td>
	<td>이름</td>
	<td><input type="text" name="name" size="10"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="변경"></td>
</tr>
</table>

</form>

</body>
</html>