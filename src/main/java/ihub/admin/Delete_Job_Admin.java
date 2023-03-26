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

/**
 * Servlet implementation class Delete_Job_Admin
 */
@WebServlet("/Delete_Job_Admin")
public class Delete_Job_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Delete_Job_Admin() {
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

		String pid = (String) hs.getAttribute("admin_jobId");
		String name = (String) hs.getAttribute("admin_jobName");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "delete from jobs where postname=? and employerid=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, name);
			ps.setString(2, pid);

			// System.out.println(ps);// this is only for testing

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Job Deleted");
				request.setAttribute("message", "Job deleted successfully."); // value can contain string as well
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
