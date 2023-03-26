package ihub.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ihub.dbtask.DbConnection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class DonorRegistration
 */
@WebServlet("/Add_Job_Admin")
public class Add_Job_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_Job_Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String postname = request.getParameter("txtpostname");
		String elig = request.getParameter("txtelig");
		String seats = request.getParameter("txtseats");
		String strdate = request.getParameter("txtlastdate");
		String desc = request.getParameter("txtdesc");
		String pid = request.getParameter("txtproviderid");

		// converting string date to sql date (last date to apply)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // sql uses this format, return type SDF

		java.util.Date dt = null; // return type Date
		try {
			dt = sdf.parse(strdate); // parsing String into Date type in format specified in SDF
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date s = new java.sql.Date(dt.getTime()); // converting Date type to Long type-> converting Long type
															// to SQL Date object

		// getting system date for post date
		java.util.Date d = new java.util.Date(); // gets system date

		java.sql.Date sd = new java.sql.Date(d.getTime()); // convert into sql date

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into jobs(employerid, postname, eligibility, noofseats, lastdatetoapply, postdate, description)values(?,?,?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pid);
			ps.setString(2, postname);
			ps.setString(3, elig);
			ps.setInt(4, Integer.parseInt(seats));
			ps.setDate(5, s);
			ps.setDate(6, sd);
			ps.setString(7, desc);

			// System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Job Added");
				request.setAttribute("message", "Job added successfully."); // value can contain string as well
																			// as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/job/add_job.jsp"); // to
																									// dispatch
																									// request
				// to JSP page

				rd.forward(request, response);
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
}
