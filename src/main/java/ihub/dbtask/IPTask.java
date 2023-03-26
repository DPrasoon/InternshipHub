package ihub.dbtask;

import java.sql.*;

public class IPTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public static ResultSet getIPDetails(String strsql, String id) {
		con = DbConnection.openConnection();
		try {
			ps = con.prepareStatement(strsql);

			ps.setString(1, id);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return rs;
	}

	public static ResultSet editInternships(String sql, String pid, String name) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			ps.setString(2, name);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps in editInternship.jsp
		}
		return rs;
	}

	public static ResultSet editJobs(String sql, String pid, String name) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			ps.setString(2, name);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps in editJobs.jsp
		}
		return rs;
	}
}
