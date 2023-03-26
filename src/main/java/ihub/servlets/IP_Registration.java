package ihub.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ihub.dbtask.DbConnection;

import java.sql.*;

/**
 * Servlet implementation class IP_Registration
 */
@WebServlet("/IP_Registration")
public class IP_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IP_Registration() {
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
		String orgname = request.getParameter("txtorgname");
		String ownername = request.getParameter("txtownername");
		String email = request.getParameter("txtmail");
		String phone = request.getParameter("txtphone");
		String address = request.getParameter("txtaddress");
		String city = request.getParameter("txtcity");
		String domain = request.getParameter("txtdomain");
		String aboutorg = request.getParameter("txtaboutorg");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into providers(providerid, password, orgname, ownername, email, phonenumber, address, city, domain, aboutorg)values(?,?,?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, orgname);
			ps.setString(4, ownername);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, address);
			ps.setString(8, city);
			ps.setString(9, domain);
			ps.setString(10, aboutorg);

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Registration done");
				response.sendRedirect("/ihub/jsp/internship_provider/ip_login.jsp");
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
