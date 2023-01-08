<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
String memberID = request.getParameter("memberID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/">홈화면</a> <br>
	<%
	Connection conn = null; // db와 커넥션을 위한 객체
	Statement stmt = null; // 쿼리 사용을 위한 객체s
	ResultSet rs = null;

	int updateCount = 0;

	try {
		// String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String jdbcDriver = "jdbc:mysql://localhost:3306/chapter14?useUnicode=true&characterEncoding=utf8";
		String user = "JSPEXAM";
		String password = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String query = "select * from MEMBER " + " where MEMBERID = '" + memberID + "'";

		// 1. jdbc 드라이버 로딩
		Class.forName(jdbcDriver);

		// 2. 데이터페이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, user, password);

		// 3. Statement 생성
		stmt = conn.createStatement();

		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);

		// 5. 결과 출력
		if (rs.next()) {
	%>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%=rs.getString("NAME")%></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=rs.getString("MEMBERID")%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=rs.getString("PASSWORD")%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=rs.getString("EMAIL")%></td>
		</tr>
	</table>
	<%
		} else {
	%>
	<%=memberID%>에 해당하는 정보가 없습니다.
	<%
		}

	} catch (SQLException e) {
	out.println(e.getMessage());
	e.printStackTrace();
	} finally {
	// 6. 사용한 Statement 종료
	if (rs != null)
	try {
		rs.close();
	} catch (SQLException e) {
	}
	if (stmt != null)
	try {
		stmt.close();
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

</body>
</html>