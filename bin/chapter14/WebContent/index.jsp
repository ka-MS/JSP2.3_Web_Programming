<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
<a href="/viewMemberList.jsp">Member 테이블의 내용</a> <br>
<a href="/update/updateForm.jsp">이름 변경</a> <br>
<form action="/viewMember.jsp" method="get">
아이디 회원정보 : <input type="text" name="memberID"><input type="submit" value="검색">
</form>
<form action="/viewMemberHistory.jsp" method="get">
아이디 히스토리 : <input type="text" name="memberID"><input type="submit" value="검색">
</form>
<a href="/insert/insertForm.jsp">데이터 삽입</a>

</body>
</html>