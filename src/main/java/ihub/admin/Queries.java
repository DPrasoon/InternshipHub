package ihub.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ihub.dbtask.DbConnection;

/**
 * Servlet implementation class Queries
 */
@WebServlet("/Queries")
public class Queries extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Queries() {
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
		con = DbConnection.openConnection();
		String[] qId = request.getParameterValues("chkqueries");		//getting input from checkbox

		String str_delete = "delete from contactus where contactid=?";
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(str_delete);

			for (int i = 0; i < qId.length; i++) {
				ps.setString(1, qId[i]);
				ps.addBatch(); // used to add the item(query) to the buffer
			}
			int[] rows = ps.executeBatch(); // used to execute whole batch present in buffer at once

			int flag = 0;
			for (int i = 0; i < rows.length; i++) {
				if (rows[i] < 0) // checking for error code(negative values)
				{
					flag = 1;
					break;
				}
			}
			if (flag == 0) {
				response.sendRedirect("/ihub/jsp/admin/queries.jsp");
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}
	}
}
