<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Search By City</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>
</head>
<body class='clr1'>

	<%
	String course = request.getParameter("txtcourse");
	String strsql = "select * from programdetails where programname=?";

	ResultSet rs = CommonTask.viewInternship(strsql, course); //contains list of programs

	int flag = 1; //to check if there are no results to be displayed
	%>

	<%@include file="/jsp/common/commonheader.html"%>

	<div class="container-fluid" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			class="mb-0" id="header">Internship Details</h2>
	</div>


	<!-- 	displaying IPs in table -->
	<table class="table table-primary table-striped mb-0">
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
				<th scope="col">City</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
				flag = 0;
			%>
			<tr>
				<th><%=rs.getString("programid")%></th>
				<td><%=rs.getString("programname")%></td>
				<td><%=rs.getString("providerid")%></td>
				<td><%=rs.getString("duration")%></td>
				<td><%=rs.getString("fees")%></td>
				<td><%=rs.getString("startdate")%></td>
				<td><%=rs.getString("enddate")%></td>
				<td><%=rs.getString("prerequisite")%></td>
				<td><%=rs.getString("stipend")%></td>
				<td><%=rs.getString("description")%></td>
				<td><%=rs.getString("city")%></td>
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

	//no results
	if (flag == 1) {
	%>
	<div class="alert alert-primary alert-dismissible" role="alert">
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