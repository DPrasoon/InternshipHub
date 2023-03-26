package ihub.admin;

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
 * Servlet implementation class Admin_EditProfile
 */
@WebServlet("/Admin_EditProfile")
public class Admin_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_EditProfile() {
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
		String email = request.getParameter("txtemail");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		HttpSession hs = request.getSession(false);

		String adminId = (String) hs.getAttribute("admin_sessionId");

		try {

			String insert_query = "update admin set password=?, phone=?, email=? where adminid=?";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pass);
			ps.setString(2, phone);
			ps.setString(3, email);
			ps.setString(4, adminId);

			int status = ps.executeUpdate();// to insert data in the admin table

			if (status > 0) {
				System.out.println("Profile Edited");
				response.sendRedirect("/ihub/jsp/admin/admin_home.jsp");
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
