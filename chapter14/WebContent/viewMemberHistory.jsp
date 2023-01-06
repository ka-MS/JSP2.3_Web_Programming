<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.io.Reader"%>
<%@ page import="java.io.IOException"%>

<%
	request.setCharacterEncoding("utf-8");
String memberID = request.getParameter("memberID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<%
		Connection conn = null; // db와 커넥션을 위한 객체
	Statement stmt = null; // 쿼리 사용을 위한 객체s
	ResultSet rs = null;

	int updateCount = 0;

	try {
		String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String user = "JSPEXAM";
		String password = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String query = "select * from MEMBER_HISTORY " + " where MEMBERID = '" + memberID + "'";

		// 1. jdbc 드라이버 로딩
		Class.forName(jdbcDriver);

		// 2. 데이터페이스 커넥션 생성
		conn = DriverManager.getConnection(url, user, password);

		// 3. Statement 생성
		stmt = conn.createStatement();

		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);

		// 5. 결과 출력
		if (rs.next()) {
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=rs.getString("MEMBERID")%></td>
		</tr>
		<tr>
			<td>히스토리</td>
			<td>
				<%
					String history = null;
					Reader reader = null;
					reader = rs.getCharacterStream("HISTORY");
					if (reader != null) {
						StringBuilder buff = new StringBuilder();
						char[] ch = new char[512];
						int len = -1;
	
						while ((len = reader.read(ch)) != -1) {
							buff.append(ch, 0, len);
						}
						history = buff.toString();
					}	
					if (reader != null) try{reader.close();}catch(IOException e){}
				%>
				<%=history %>
			</td>
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