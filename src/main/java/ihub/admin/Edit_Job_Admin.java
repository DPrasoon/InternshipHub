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
 * Servlet implementation class Edit_Job_Admin
 */
@WebServlet("/Edit_Job_Admin")
public class Edit_Job_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Edit_Job_Admin() {
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
		HttpSession hs = request.getSession(false);

		String elig = request.getParameter("txtelig");
		String seats = request.getParameter("txtseats");
		String lastdate = request.getParameter("txtlastdate");
		String desc = request.getParameter("txtdesc");

		String pid = (String) hs.getAttribute("admin_jobId");
		String name = (String) hs.getAttribute("admin_jobName");

		// converting string date to sql date (last date to apply)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // sql uses this format, return type SDF

		java.util.Date dt = null; // return type Date
		try {
			dt = sdf.parse(lastdate); // parsing String into Date type in format specified in SDF
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date s = new java.sql.Date(dt.getTime()); // converting Date type to Long type-> converting Long type
															// to SQL Date object

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "update jobs set eligibility=?, noofseats=?, lastdatetoapply=?, description=? where postname=? and employerid=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, elig);
			ps.setInt(2, Integer.parseInt(seats));
			ps.setDate(3, s);
			ps.setString(4, desc);
			ps.setString(5, name);
			ps.setString(6, pid);

			int status = ps.executeUpdate();// to update data in jobs table

			if (status > 0) {
				System.out.println("Job Updated");
				request.setAttribute("message", "Job updated successfully."); // value can contain string as well
																				// as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/job/select_job.jsp"); // to
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
