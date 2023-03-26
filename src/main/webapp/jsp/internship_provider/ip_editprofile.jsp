<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IP | Edit Profile</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>

</head>
<body class='clr1'>

	<%
	String pid = (String) session.getAttribute("provider_sessionId");
	if (pid == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/ip_login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		String strsql = "select * from providers where providerid=?";

		ResultSet rs = IPTask.getIPDetails(strsql, pid);
	%>

	<%@include file="/jsp/internship_provider/ip_header.html"%>
	
	<%
	if (rs.next()) {
	%>

	<div class="container-fluid">
		<h2 style="text-align: center">
			Hello 
			<%=rs.getString("orgname")%></h2>
	</div>

	<form method="post" action="/ihub/IP_EditProfile">
		<div class="card text-bg-dark mb-3"
			style="max-width: 18rem; margin-left: 625px">
			<div class="card-header"><%=pid%></div>
			<div class="card-body text-light">
				<h5 class="card-title">
					Password <input type="password" class="form-control"
						name="txtpass" value="<%=rs.getString("password")%>">
				</h5>

				<h5 class="card-title">
					Phone: <input type="number" class="form-control" name="txtphone"
						value="<%=rs.getString("phonenumber")%>">
				</h5>

				<h5 class="card-title">
					City: <input type="text" class="form-control" name="txtcity"
						value="<%=rs.getString("city")%>">
				</h5>

				<h5 class="card-title">
					Domain: <input type="text" class="form-control" name="txtdomain"
						value="<%=rs.getString("domain")%>">
				</h5>

				<h5 class="card-title">
					About: <input type="text" class="form-control" name="txtabout"
						value="<%=rs.getString("aboutorg")%>">
				</h5>
			</div>
			<button type="submit" class="btn btn-light">Edit</button>
		</div>
	</form>

	<%
	}
	%>

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>
	<%
	}
	%>

</body>
</html>