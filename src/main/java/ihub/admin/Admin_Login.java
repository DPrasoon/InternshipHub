package ihub.admin;

import java.io.IOException;
import java.sql.*; //for dbms connectivity

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ihub.dbtask.DbConnection;

import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Admin_Login
 */
@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con; // default value null

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("txtid");
		String pass = request.getParameter("txtpass");

		con = DbConnection.openConnection(); // database connection established

		String strsql = "select * from admin where adminid= ? and password=?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(strsql); // it passes the query to dbms -> DBMS parser will parse the query ->
												// complied query will get stored in a buffer and that buffer address is
												// referred by 'ps'

			ps.setString(1, id.trim()); // setting value received in 'id' into the query at the place of 1 placeholder
			ps.setString(2, pass);
			rs = ps.executeQuery(); // it will execute query

			if (rs.next()) // it access the resultant dataset and returns boolean value if any data is
							// present
			{
				HttpSession hs = request.getSession();
				hs.setAttribute("admin_sessionId", id);
				response.sendRedirect("/ihub/jsp/admin/admin_home.jsp"); // used to redirect the user to
																			// another page

			} else {
				request.setAttribute("message", "Invalid Credentials"); // value can contain string as well as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); // to dispatch
																									// request to
																									// JSP
																									// page

				rd.forward(request, response); // always done on server side(this is server side)
			}

		} catch (SQLException sq) {
			sq.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
				// we are not closing the connection for now
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

	}

}
