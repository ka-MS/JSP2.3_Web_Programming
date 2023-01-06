<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("utf-8");

	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Connection conn = null; // db와 커넥션을 위한 객체
	PreparedStatement pstmt = null; // 쿼리 사용을 위한 객체
	
	int updateCount = 0;
	
	try {
		String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String user = "JSPEXAM";
		String pw = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
		// 1. jdbc 드라이버 로딩
		Class.forName(jdbcDriver);
	
		// 2. 데이터페이스 커넥션 생성
		conn = DriverManager.getConnection(url, user, pw);
	
		// 3. PreparedStatement 생성 및 쿼리 삽입
		pstmt = conn.prepareStatement("insert into MEMBER values(?,?,?,?)");
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		updateCount = pstmt.executeUpdate();
	
	} catch (SQLException e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException e) {
			}
	
		// 7. 커넥션 종료
		if (conn != null)
			try {
		conn.close();
			} catch (SQLException e) {
			}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 삽입</title>
</head>
<body>
	<a href="/">홈화면</a>
	<br>
	<%
		if (updateCount > 0) {
	%>
	Member테이블에 새로운 데이터를 추가하였습니다.
	<%
		} else {
	%>
	데이터 추가 실패
	<%
		}
	%>

</body>
</html>