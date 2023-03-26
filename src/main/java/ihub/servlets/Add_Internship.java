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
 * Servlet implementation class Add_Internship
 */
@WebServlet("/Add_Internship")
public class Add_Internship extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_Internship() {
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
		String name = request.getParameter("txtprogname");
		String duration = request.getParameter("txtduration");
		String fees = request.getParameter("txtfees");
		String start = request.getParameter("txtstartdate");
		String end = request.getParameter("txtenddate");
		String prereq = request.getParameter("txtprereq");
		String stipend = request.getParameter("txtstipend");
		String desc = request.getParameter("txtdesc");
		String city = request.getParameter("txtcity");
		String pid = (String) hs.getAttribute("provider_sessionId");

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into programdetails(providerid, programname, duration, fees, startdate, enddate, prerequisite, stipend, description, city)values(?,?,?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pid);
			ps.setString(2, name);
			ps.setString(3, duration);
			ps.setString(4, fees);
			ps.setString(5, start);
			ps.setString(6, end);
			ps.setString(7, prereq);
			ps.setString(8, stipend);
			ps.setString(9, desc);
			ps.setString(10, city);

			int status = ps.executeUpdate();

			if (status > 0) {
				System.out.println("Internship Added");
				request.setAttribute("message", "Internship added successfully."); // value can contain string as well
																					// as object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/add_internship.jsp"); // to
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
