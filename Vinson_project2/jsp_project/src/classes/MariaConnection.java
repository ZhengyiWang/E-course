package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by cfenglv on 2016/12/21.
 */
public class MariaConnection {
	final private String defaultDbDriver = "org.mariadb.jdbc.Driver";
	final private String defaultDbUrl = "jdbc:mariadb://localhost:3306/niit";
	final String defaultDbUser = "root";
	final String defaultDbPwd = "root";
	Connection conn = null;

	public MariaConnection() {
		try {
			Class.forName(defaultDbDriver);
			conn = DriverManager.getConnection(defaultDbUrl, defaultDbUser, defaultDbPwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public MariaConnection(String customDbUrl, String customDbUser, String customDbPwd) {
		try {
			Class.forName(defaultDbDriver);
			conn = DriverManager.getConnection(customDbUrl, customDbUser, customDbPwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public void closeConn() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Statement getStatement() {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
}
