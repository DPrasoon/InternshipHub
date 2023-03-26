<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Edit Internship</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body class='clr1'>
	<%
	String pid = (String) session.getAttribute("provider_sessionId");
	if (pid == null) {
		request.setAttribute("message", "Unauthorized Access");

		RequestDispatcher rd = request.getRequestDispatcher("/jsp/internship_provider/ip_login.jsp"); //relative path

		rd.forward(request, response); // always done by server side
	} else {
		HttpSession hs = request.getSession(false);
		String name = (String) hs.getAttribute("provider_programId");
		String strsql = "select * from programdetails where providerid=? and programname=?";

		ResultSet rs = IPTask.editInternships(strsql, pid, name);
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

	<%@include file="/jsp/internship_provider/ip_header.html"%>
	<div class="container-fluid p-0" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			id="header">Edit Internship</h2>
	</div>
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/Edit_Internship">

					<div class="mb-3">
						<label for="duration" class="form-label"> <i
							class="fas fa-hourglass-half" style="font-size: 24px; color: black"></i>
							Duration
						</label> <input type="text" class="form-control" id="txtduration"
							name="txtduration" value="<%=rs.getString("duration")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Duration</div>
					</div>

					<div class="mb-3">
						<label for="fees" class="form-label"> <i
							class="fa fa-user" style="font-size: 24px; color: black"></i>Fees
						</label> <input type="text" class="form-control" id="txtfees"
							name="txtfees" value="<%=rs.getString("fees")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Fees</div>
					</div>

					<div class="mb-3">
						<label for="startdate" class="form-label"> <i
							class="fas fa-calendar-alt" style="font-size: 24px; color: black"></i>Start
							Date
						</label> <input type="text" class="form-control" id="txtstartdate"
							name="txtstartdate" value="<%=rs.getString("startdate")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Start Date</div>
					</div>

					<div class="mb-3">
						<label for="enddate" class="form-label"> <i
							class="fas fa-calendar-alt" style="font-size: 24px; color: black"></i>End
							Date
						</label> <input type="text" class="form-control" id="txtenddate"
							name="txtenddate" value="<%=rs.getString("enddate")%>"
							required="required">
						<div class="invalid-feedback">Please Enter End Date</div>
					</div>

					<div class="mb-3">
						<label for="prereq" class="form-label"> <i
							class='fas fa-certificate'
							style="font-size: 24px; color: black"></i> Prerequisites
						</label> <input type="text" class="form-control" id="txtprereq"
							name="txtprereq" value="<%=rs.getString("prerequisite")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Prerequisites</div>
					</div>


					<div class="mb-3">
						<label for="stipend" class="form-label"> <i
							class="fas fa-award" style="font-size: 24px; color: black"></i>
							Stipend
						</label> <input type="number" class="form-control" id="txtstipend"
							name="txtstipend" value="<%=rs.getString("stipend")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Stipend</div>
					</div>

					<div class="mb-3">
						<label for="desc" class="form-label"> <i
							class="fas fa-archive" style="font-size: 24px; color: black"></i>
							Description
						</label> <input type="text" class="form-control" id="txtdesc"
							name="txtdesc" value="<%=rs.getString("description")%>"
							required="required">
						<div class="invalid-feedback">Please Enter Description</div>
					</div>

					<div class="mb-3">
						<label for="city" class="form-label"> <i
							class="fas fa-hospital-alt" style="font-size: 24px; color: black"></i>
							City
						</label> <input type="text" class="form-control" id="txtcity"
							name="txtcity" value="<%=rs.getString("city")%>"
							required="required">
						<div class="invalid-feedback">Please Enter City</div>
					</div>

					<div class="mb-3">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</div>
				</form>
				<br>
				<form method="post" action="/ihub/Delete_Internship">
					<div class="mb-3">
						<label for="del" class="form-label"> <i
							class="fas fa-male" style="font-size: 24px; color: black"></i>
							Do you want to delete this internship?
						</label><br>
						<button type="submit" class="btn btn-primary">Delete Internship</button>
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