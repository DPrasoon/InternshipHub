<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Edit Profile</title>
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
		String strsql = "select * from admin where adminid=?";

		ResultSet rs = AdminTask.getAdmin(strsql, adminId);
	%>

	<%@include file="/jsp/admin/admin_header.html"%>

	<div class="container-fluid">
		<h1 style="text-align: center">
			Hello
			<%=adminId%></h1>
	</div>

	<%
	if (rs.next()) {
	%>

	<form method="post" action="/ihub/Admin_EditProfile">
		<div class="card text-bg-light mb-3"
			style="max-width: 18rem; margin-left: 625px">
			<div class="card-header"><%=rs.getString("name")%></div>
			<div class="card-body text-primary">
				<h5 class="card-title">
					Password <input type="password" class="form-control" name="txtpass"
						value="<%=rs.getString("password")%>">
				</h5>
				<h5 class="card-title">
					Phone: <input type="number" class="form-control" name="txtphone"
						value="<%=rs.getString("phone")%>">
				</h5>

				<h5 class="card-title">
					Email: <input type="text" class="form-control" name="txtemail"
						value="<%=rs.getString("email")%>">
				</h5>
			</div>
			<button type="submit" class="btn btn-primary">Update Info</button>
		</div>
	</form>

	<%
	}
	%>

	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>
	<%
	}
	%>

</body>
</html>