package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class OracleDriverLoder extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //jdbc 드라이버 로딩
		} catch (ClassNotFoundException e) {
			throw new ServletException(); // 문제시 익셉션 발생
		}
	}
}
