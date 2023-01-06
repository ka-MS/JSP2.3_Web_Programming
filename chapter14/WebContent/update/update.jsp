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
	String name = request.getParameter("name");

	Connection conn = null; // db와 커넥션을 위한 객체
	Statement stmt = null; // 쿼리 사용을 위한 객체
	
	int updateCount = 0;

	try {
		String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String user = "JSPEXAM";
		String password = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		String query = "update MEMBER set NAME = '" + name + "' "+" where MEMBERID = '"+memberID+"'";

		// 1. jdbc 드라이버 로딩
		Class.forName(jdbcDriver);

		// 2. 데이터페이스 커넥션 생성
		conn = DriverManager.getConnection(url, user, password);

		// 3. Statement 생성
		stmt = conn.createStatement();

		// 4. 쿼리 실행
		updateCount = stmt.executeUpdate(query);
		
	} catch (SQLException e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		
		// 7. 커넥션 종료
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 변경</title>
</head>
<body>
<a href="/">홈화면</a> <br>
<% if(updateCount > 0){ %>
<%=memberID %>의 이름을 <%=name %>으로 변경
<% }else{ %>
<%=memberID %>가 존재하지 않음
<%} %>
</body>
</html>