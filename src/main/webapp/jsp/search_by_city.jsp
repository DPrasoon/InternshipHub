<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Search By City</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>
</head>
<body class='clr1'>

	<%
	String cityname = request.getParameter("txtcity");
	String strsql = "select providerid from providers where city=?";

	ResultSet rs = CommonTask.viewProvidersByCity(strsql, cityname); //contains list of providers

	int flag = 1; //to check if there are no results to be displayed
	%>

	<%@include file="/jsp/common/commonheader.html"%>

<!-- headline -->
	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">Internship Details</h2>
	</div>


	<!-- 	displaying IPs in table -->
	<table class="table table-primary table-striped">
		<thead>
			<tr>
				<th scope="col">Program ID</th>
				<th scope="col">Program Name</th>
				<th scope="col">Provider ID</th>
				<th scope="col">Duration</th>
				<th scope="col">Fees</th>
				<th scope="col">StartDate</th>
				<th scope="col">EndDate</th>
				<th scope="col">Prerequisites</th>
				<th scope="col">Stipend</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
				String pid = rs.getString("providerid");
				String str_select = "select * from programdetails where providerid=?";

				ResultSet rsfinal = CommonTask.viewInternship(str_select, pid);

				while (rsfinal.next()) {
					flag = 0;
			%>
			<tr>
				<th><%=rsfinal.getString("programid")%></th>
				<td><%=rsfinal.getString("programname")%></td>
				<td><%=rsfinal.getString("providerid")%></td>
				<td><%=rsfinal.getString("duration")%></td>
				<td><%=rsfinal.getString("fees")%></td>
				<td><%=rsfinal.getString("startdate")%></td>
				<td><%=rsfinal.getString("enddate")%></td>
				<td><%=rsfinal.getString("prerequisite")%></td>
				<td><%=rsfinal.getString("stipend")%></td>
				<td><%=rsfinal.getString("description")%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<%
	if (rsfinal != null)
		rsfinal.close();
	}
	if (rs != null) {
	rs.close();
	}

	//no results
	if (flag == 1) {
	%>
	<div class="alert alert-primary alert-dismissible mb-0" role="alert">
		No results found.
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>


	<%
	}
	%>

	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

</body>
</html>