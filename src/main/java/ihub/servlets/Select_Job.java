package ihub.servlets;

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
 * Servlet implementation class Select_Job
 */
@WebServlet("/Select_Job")
public class Select_Job extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Select_Job() {
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
		String name = request.getParameter("txtjobname");
		String pid = (String) hs.getAttribute("provider_sessionId");
		hs.setAttribute("provider_jobId", name); // setting the attribute in session scope
		ResultSet rs = null;

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "select * from jobs where postname=? and employerid=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, name);
			ps.setString(2, pid);

			rs = ps.executeQuery();

			if (rs.next()) {
				response.sendRedirect("/ihub/jsp/internship_provider/job/edit_job.jsp");
			}
//			if the program doesn't belong to the logged in provider
			else {
				request.setAttribute("message", "You do not have access to this program."); // value can contain string
																							// as well
				// as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/job/select_job.jsp"); // to
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
