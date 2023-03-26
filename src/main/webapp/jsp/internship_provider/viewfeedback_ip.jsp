<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IP | Internship Provider's Feedback</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>
</head>
<body class='clr1'>

	<%
	String ipSessionId = (String) session.getAttribute("provider_sessionId");
		if (ipSessionId == null) {
			request.setAttribute("message", "Unauthorized Access");

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/ip_login.jsp"); //relative path

			rd.forward(request, response); // always done by server side
		} else {
			String strsql = "select * from feedback_ip where providerid=?";

			ResultSet rs = IPTask.getIPDetails(strsql, ipSessionId);
	%>

	<%@include file="/jsp/internship_provider/ip_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">Your Feedback</h2>
	</div>

		<!-- 	displaying feedbacks in table -->
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th scope="col">Feedback No.</th>
					<th scope="col">User Name</th>
					<th scope="col">Email</th>
					<th scope="col">Date</th>
					<th scope="col">Feedback</th>
					<th scope="col">Rating</th>
				</tr>
			</thead>
			<tbody>

				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("feedbackid")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("date")%></td>
					<td><%=rs.getString("feedbacktext")%></td>
					<td><%=rs.getString("rating")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
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