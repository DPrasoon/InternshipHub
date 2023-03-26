package ihub.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ihub.dbtask.DbConnection;

import java.sql.*;

/**
 * Servlet implementation class IP_EditProfile
 */
@WebServlet("/IP_EditProfile")
public class IP_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IP_EditProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pass = request.getParameter("txtpass");
		String phone = request.getParameter("txtphone");
		String city = request.getParameter("txtcity");
		String domain = request.getParameter("txtdomain");
		String about = request.getParameter("txtabout");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		HttpSession hs = request.getSession(false);

		String pid = (String) hs.getAttribute("provider_sessionId");

		try {

			String insert_query = "update providers set password=?, phonenumber=?, city=?, domain=?, aboutorg=? where providerid=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pass);
			ps.setString(2, phone);
			ps.setString(3, city);
			ps.setString(4, domain);
			ps.setString(5, about);
			ps.setString(6, pid);

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Profile Edited");
				response.sendRedirect("/ihub/jsp/internship_provider/ip_home.jsp");
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
