<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | View Internship Providers</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp" %>
</head>
<body class='clr1'>

	<%
	String adminId = (String) session.getAttribute("admin_sessionId");
	if (adminId == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		String strsql = "select * from providers";

		ResultSet rs = AdminTask.viewProviders(strsql);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">Internship Providers' Details</h2>
	</div>


	<!-- 	displaying IPs in table -->
	<table class="table table-primary table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Provider ID</th>
				<th scope="col">Organization Name</th>
				<th scope="col">Owner Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Address</th>
				<th scope="col">City</th>
				<th scope="col">Domain</th>
				<th scope="col">About Organization</th>
			</tr>
		</thead>
		<tbody>

			<%int i=1; %>
			<%while(rs.next())
				{
				%>
			<tr>
				<th><%=i %></th>
				<td><%=rs.getString("providerid")%></td>
				<td><%=rs.getString("orgname")%></td>
				<td><%=rs.getString("ownername")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("phonenumber")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=rs.getString("city")%></td>
				<td><%=rs.getString("domain")%></td>
				<td><%=rs.getString("aboutorg")%></td>
			</tr>
			<%i++;
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

	<%}%>

</body>
</html>