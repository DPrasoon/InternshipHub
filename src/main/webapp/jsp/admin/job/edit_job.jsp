<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Edit Job</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body class='clr1'>
	<%
	String adminid = (String) session.getAttribute("admin_sessionId");
	if (adminid == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin/admin_login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		HttpSession hs = request.getSession(false);
		
		String name = (String) hs.getAttribute("admin_jobName");
		String pid = (String) hs.getAttribute("admin_jobId");
		
		String strsql = "select * from jobs where employerid=? and postname=?";

		ResultSet rs = AdminTask.editJobs(strsql, pid, name);
		%>

	<%
		//to display msg after form submission
		String error_msg = (String) request.getAttribute("message"); //typecast to String as servlet could have sent object(not string)
		if (error_msg != null) {
		%>
	<div class="alert alert-primary alert-dismissible" role="alert">
		<%=error_msg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
		}
		while(rs.next())
		{
		%>

	<%@include file="/jsp/admin/admin_header.html"%>
	<div class="container-fluid p-0" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			id="header">Edit Job</h2>
	</div>
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/Edit_Job_Admin">

					<div class="mb-3">
						<label for="duration" class="form-label"> <i
							class="fas fa-archive" style="font-size: 24px; color: black"></i>
							Eligibility
						</label> <input type="text" class="form-control" id="txtelig"
							name="txtelig" value="<%=rs.getString("eligibility")%>"
							required="required">
						<div class="invalid-feedback">Please enter Eligibilty</div>
					</div>

					<div class="mb-3">
						<label for="seats" class="form-label"> <i
							class="fas fa-user-graduate" style="font-size: 24px; color: black"></i>No. of seats
						</label> <input type="number" class="form-control" id="txtseats"
							name="txtseats" value="<%=rs.getString("noofseats")%>"
							required="required">
						<div class="invalid-feedback">Please enter No. of seats</div>
					</div>

					<div class="mb-3">
						<label for="lastdate" class="form-label"> <i
							class="fas fa-calendar-alt" style="font-size: 24px; color: black"></i>Last Date to apply
						</label> <input type="text" class="form-control" id="txtlastdate"
							name="txtlastdate" value="<%=rs.getString("lastdatetoapply")%>"
							required="required">
						<div class="invalid-feedback">Please enter Last Date to apply</div>
					</div>

					<div class="mb-3">
						<label for="desc" class="form-label"> <i
							class="fas fa-certificate" style="font-size: 24px; color: black"></i>
							Description
						</label> <input type="text" class="form-control" id="txtdesc"
							name="txtdesc" value="<%=rs.getString("description")%>"
							required="required">
						<div class="invalid-feedback">Please enter Job description</div>
					</div>

					<div class="mb-3">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</div>
				</form>
				<br>
				<form method="post" action="/ihub/Delete_Job_Admin">
					<div class="mb-3">
						<label for="del" class="form-label"> <i
							class="fas fa-certificate" style="font-size: 24px; color: black"></i>
							Do you want to delete this job?
						</label><br>
						<button type="submit" class="btn btn-primary">Delete Job</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>


	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%
		}}
		%>
</body>
</html>