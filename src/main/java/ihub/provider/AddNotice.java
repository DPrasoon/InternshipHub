package ihub.provider;

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
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class AddNotice
 */
@WebServlet("/AddNotice")
public class AddNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String topic = request.getParameter("txttopic");
		String content = request.getParameter("txtcontent");

		HttpSession hs = request.getSession(false);
		String pid = (String) hs.getAttribute("provider_sessionId");
		
		//handling browser back button after logout
		if (pid == null) {
			request.setAttribute("message", "Unauthorized Access!"); // value can contain string as well as
																			// object

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/add_notice.jsp"); // to
																											// dispatch
																											// request
			// to JSP
			// page

			rd.forward(request, response); 
		}

		// getting system date for post date
		java.util.Date d = new java.util.Date(); // gets system date

		java.sql.Date sd = new java.sql.Date(d.getTime()); // convert into sql date

		con = DbConnection.openConnection(); // database connection established

		PreparedStatement ps = null;

		try {

			String insert_query = "insert into notices(providerid, noticetopic, noticecontents, date)values(?,?,?,?)";

			ps = con.prepareStatement(insert_query);

			ps.setString(1, pid);
			ps.setString(2, topic);
			ps.setString(3, content);
			ps.setDate(4, sd);

			int status = ps.executeUpdate();

			if (status > 0) {
				request.setAttribute("message", "Notice added successfully."); // value can contain string as well as
																				// object

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/add_notice.jsp"); // to
																												// dispatch
																												// request
				// to JSP
				// page

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
