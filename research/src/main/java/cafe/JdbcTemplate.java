package cafe;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class JdbcTemplate {
//	private static JdbcTemplate instance;
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private String user = "c##tester";
//	private String password = "1234";
	
	private static DataSource ds;
	static {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {}
	}

	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

}
