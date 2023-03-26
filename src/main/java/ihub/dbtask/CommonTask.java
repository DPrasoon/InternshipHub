package ihub.dbtask;

import java.sql.*;
import java.util.ArrayList;

import ihub.beans.NoticeBean;

public class CommonTask {

	private static Connection con;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public static ResultSet viewProvidersByCity(String sql, String city) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, city);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps in viewProviders.jsp
		}
		return rs;
	}

	public static ResultSet viewInternship(String sql, String pid) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps in viewProviders.jsp
		}
		return rs;
	}

	static ArrayList<NoticeBean> noticelist = new ArrayList<NoticeBean>(); // used to hold the objects

	public static ArrayList<NoticeBean> viewNotices(String sql) {
		if (!noticelist.isEmpty()) // to check whether arraylist is empty or not
		{
			noticelist.clear();
		}
		con = DbConnection.openConnection();

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int noticeid = rs.getInt("noticeid");
				String providerid = rs.getString("providerid");
				String noticetopic = rs.getString("noticetopic");
				String noticecontents = rs.getString("noticecontents");
				Date d = rs.getDate("date");

				NoticeBean nb = new NoticeBean(); // creating Bean class object
				nb.setNoticeid(noticeid); // setting values in properties
				nb.setProviderid(providerid);
				nb.setNoticetopic(noticetopic);
				nb.setNoticecontents(noticecontents);
				nb.setDate(d);

				noticelist.add(nb); // adding objects that represent rows of the table
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticelist;
	}

	public static ResultSet viewJobs(String sql) {
		try {
			con = DbConnection.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// closing ps in viewDonors.jsp
		}
		return rs;
	}
}
