<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Internship Provider's Feedback</title>
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
		String strsql = "select * from feedback_ip";

		ResultSet rs = AdminTask.Feedback(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">All Feedbacks</h2>
	</div>

	<form method="post" action="/ihub/ViewFeedback_IP">

		<!-- 	displaying feedbacks in table -->
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th scope="col">Feedback No.</th>
					<th scope="col">Internship Provider ID</th>
					<th scope="col">User Name</th>
					<th scope="col">Email</th>
					<th scope="col">Date</th>
					<th scope="col">Feedback</th>
					<th scope="col">Rating</th>
					<th scope="col">Select</th>
				</tr>
			</thead>
			<tbody>

				<%
				while (rs.next()) {
					String id = rs.getString("feedbackid"); //selecting feedback by their serial number
				%>
				<tr>
					<td><%=rs.getString("feedbackid")%></td>
					<td><%=rs.getString("providerid")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("date")%></td>
					<td><%=rs.getString("feedbacktext")%></td>
					<td><%=rs.getString("rating")%></td>
					<!-- passing value(sno) of checkbox -->
					<th><input type="checkbox" name="chkfeedback" value="<%=id%>"></th>
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