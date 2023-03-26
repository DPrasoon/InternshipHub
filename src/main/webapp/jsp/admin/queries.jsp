<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Queries</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>
</head>
<body class='clr1'>

	<%
	String adminId = (String) session.getAttribute("admin_sessionId");
	if (adminId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		String strsql = "select * from contactus";

		ResultSet rs = AdminTask.Queries(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">Queries</h2>
	</div>

	<form method="post" action="/ihub/Queries">

		<!-- 	displaying feedbacks in table -->
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Query</th>
					<th scope="col">Date</th>
					<th scope="col">Select</th>
				</tr>
			</thead>
			<tbody>

				<%
				while (rs.next()) {
					String id = rs.getString("contactid"); //selecting queries by their serial number
				%>
				<tr>
					<td><%=rs.getString("contactid")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("question")%></td>
					<td><%=rs.getString("date")%></td>
					<!-- passing value(sno) of checkbox -->
					<th><input type="checkbox" name="chkqueries" value="<%=id%>"></th>
				</tr>
				<%
				}
				%>
				<tr>
					<th><button type="submit" class="btn btn-primary">Delete</button></th>
				</tr>
			</tbody>
		</table>
	</form>
	<%
	if (rs != null) {
		rs.close();
	}
	%>

	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%
	}
	%>

</body>
</html>