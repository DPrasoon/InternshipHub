package ihub.dbtask;

import java.sql.*;

public class AdminTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public static ResultSet getAdmin(String strsql, String id) {
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

	public static ResultSet viewProviders(String sql) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing ps in viewProviders.jsp
		}
		return rs;
	}
	
	public static ResultSet Feedback(String sql)
	{
		try
		{
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing ps in viewfeedback.jsp
		}
		return rs;
	}
	
	public static ResultSet Queries(String sql)
	{
		try
		{
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		}
		catch (SQLException se) {
			se.printStackTrace();
		} finally {
			//closing rs in queries.jsp
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
			//closing ps in editJobsAdmin.jsp
		}
		return rs;
	}
}
