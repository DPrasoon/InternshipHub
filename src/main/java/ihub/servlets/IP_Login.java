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
 * Servlet implementation class IP_Login
 */
@WebServlet("/IP_Login")
public class IP_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IP_Login() {
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

		String id = request.getParameter("txtid");
		String pass = request.getParameter("txtpass");

		con = DbConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String strsql = "select * from providers where providerid=? and password=?";

		try {
			ps = con.prepareStatement(strsql);
			ps.setString(1, id);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			if (rs.next()) {
				HttpSession hs = request.getSession(); // it will create a new Session

				hs.setAttribute("provider_sessionId", id); // setting the attribute in session scope

				response.sendRedirect("/ihub/jsp/internship_provider/ip_home.jsp"); // it is used to navigate on other
																					// page
			}

			else {

				request.setAttribute("message", "Invalid Credentials");

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/login.jsp");// relative
																											// path

				rd.forward(request, response);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		finally {

			try {

				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();

			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

	}

}
