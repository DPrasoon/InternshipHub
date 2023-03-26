<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IHub | IP Home</title>
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
		String strsql = "select * from providers where providerid=?";

		ResultSet rs = IPTask.getIPDetails(strsql, ipSessionId);
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
	<div class="card border-primary mb-3"
		style="max-width: 18rem; margin-left: 625px">
		<div class="card-header"><%=ipSessionId%></div>
		<div class="card-body text-black">
			<h5 class="card-title">
				Email:
				<%=rs.getString("email")%></h5>
			<p class="card-text">
				Phone:
				<%=rs.getString("phonenumber")%></p>
			<p class="card-text">
				Owner's Name:
				<%=rs.getString("ownername")%></p>
			<p class="card-text">
				City:
				<%=rs.getString("city")%></p>
			<p class="card-text">
				Domain:
				<%=rs.getString("domain")%></p>
			<div class="card-footer bg-transparent border-primary">
				About:
				<%=rs.getString("aboutorg")%></div>
		</div>
	</div>

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