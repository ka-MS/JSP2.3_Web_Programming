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

String idValue = request.getParameter("id");

Connection conn = null; // db와 커넥션을 위한 객체
PreparedStatement pstmtItem = null; // 쿼리 사용을 위한 객체
PreparedStatement pstmtDetail = null;

String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
String user = "JSPEXAM";
String pw = "1234";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

Throwable occuredException = null;
int updateCount = 0;

try {

	int id = Integer.parseInt(idValue);

	// 1. jdbc 드라이버 로딩
	Class.forName(jdbcDriver);

	// 2. 데이터페이스 커넥션 생성
	conn = DriverManager.getConnection(url, user, pw);
	conn.setAutoCommit(false); // 오토커밋을 꺼주자

	// 3. PreparedStatement 생성 및 쿼리 삽입
	pstmtItem = conn.prepareStatement("insert into ITEM values(?,?)");
	pstmtItem.setInt(1, id);
	pstmtItem.setString(2, "상세 설명" + id);
	pstmtItem.executeUpdate();

	if (request.getParameter("error") != null) {
		throw new Exception("의도적 익셉션 발생");
	}

	pstmtDetail = conn.prepareStatement("insert into ITEM_DETAIL values(?,?)");
	pstmtDetail.setInt(1, id);
	pstmtDetail.setString(2, "상세 설명" + id);
	pstmtDetail.executeUpdate();

	conn.commit();
} catch (Throwable e) {
	try{
		conn.rollback();
	}catch(SQLException ex){
	}
	occuredException = e;
} finally {
	// 6. 사용한 Statement 종료
	if (pstmtItem != null)
		try {
	pstmtItem.close();
		} catch (SQLException e) {
		}
	if (pstmtDetail != null)
		try {
	pstmtDetail.close();
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
<title>item 값 입력</title>
</head>
<body>
	<%
		if (occuredException != null) {
	%>
	에러발생 :
	<%=occuredException.getMessage()%>
	<%
		} else {
	%>
	데이터 성공적 들어감
	<%
		}
	%>

</body>
</html>