package ihub.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ihub.dbtask.DbConnection;
import java.sql.*;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Feedback() {
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
		String pid = request.getParameter("providerid");
		String nm = request.getParameter("uname");
		String mail = request.getParameter("email");
		String fb = request.getParameter("feedback");
		String rating = request.getParameter("rating");

		java.util.Date d = new java.util.Date();

		java.sql.Date sd = new java.sql.Date(d.getTime()); // convert into sql date

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into feedback_ip(providerid, name, email, date, feedbacktext, rating)values(?,?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pid);
			ps.setString(2, nm);
			ps.setString(3, mail);
			ps.setDate(4, sd);
			ps.setString(5, fb);
			ps.setString(6, rating);

			int status = ps.executeUpdate();

			if (status > 0) {
				request.setAttribute("message", "Thanks for your feedback!"); // value can contain string as well as
																				// object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/feedback.jsp"); // to dispatch request to JSP
																							// page

				rd.forward(request, response);
			}

		} catch (SQLIntegrityConstraintViolationException se) {
			request.setAttribute("message", "Organization ID invalid! Please enter correct ID."); // value can contain
																									// string as well as
			// object

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/feedback.jsp"); // to dispatch request to JSP
			// page

			rd.forward(request, response);
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
