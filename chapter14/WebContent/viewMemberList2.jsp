<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<a href="/">홈화면</a> <br>
	<a href="/viewMemberList.jsp">Member 테이블의 내용</a>
	<table width="100%" border="1">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>이메일</th>
	</tr>
	<%
	Connection conn = null; // db와 커넥션을 위한 객체
	Statement stmt = null; // 쿼리 사용을 위한 객체
	ResultSet rs = null;

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/chapter14?useSSL=false&allowPublicKeyRetrieval=true";
		String user = "JSPEXAM";
		String password = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		

		String query = "select * from MEMBER ORDER BY MEMBERID";
		// 1. jdbc 드라이버 로딩
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println(0);

		// 2. 데이터페이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, user, password);
		System.out.println(1);
		// 3. Statement 생성
		stmt = conn.createStatement();

		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);

		// 5. 쿼리 실행결과 출력
		while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("NAME") %></td>
		<td><%=rs.getString("MEMBERID") %></td>
		<td><%=rs.getString("EMAIL") %></td>
	</tr>
	<%
		}

	} catch (SQLException e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
	%>
	</table>

</body>
</html>