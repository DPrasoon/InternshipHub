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
 * Servlet implementation class Delete_Internship
 */
@WebServlet("/Delete_Internship")
public class Delete_Internship extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Delete_Internship() {
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
		String pid = (String) hs.getAttribute("provider_programId");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "delete from programdetails where programname=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pid);

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Internship Deleted");
				request.setAttribute("message", "Internship deleted successfully."); // value can contain string as well
																					// as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/select_internship.jsp"); // to
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
