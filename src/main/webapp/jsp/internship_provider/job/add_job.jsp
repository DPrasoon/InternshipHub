<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Add Job</title>

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
	%>

	<%@include file="/jsp/internship_provider/ip_header.html"%>
	<div class="container-fluid p-0" style="background-color: white">
		<h2
			style="color: #d90429; text-align: center; font-family: Montserrat"
			id="header">Add Job</h2>
	</div>
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/Add_Job">

					<div class="mb-3">
						<label for="postname" class="form-label"> <i
							class="fas fa-id-badge" style="font-size: 24px; color: black"></i>
							Post Name
						</label> <input type="text" class="form-control" id="txtpostname"
							name="txtpostname" placeholder="enter post name"
							required="required">
						<div class="invalid-feedback">Please enter Post Name</div>
					</div>

					<div class="mb-3">
						<label for="eligibility" class="form-label"> <i
							class="fas fa-certificate" style="font-size: 24px; color: black"></i>
							Eligibility
						</label> <input type="text" class="form-control" id="txtelig"
							name="txtelig" placeholder="enter eligibility details"
							required="required">
						<div class="invalid-feedback">Please enter Eligibility
							Details</div>
					</div>

					<div class="mb-3">
						<label for="seats" class="form-label"> <i
							class="	fas fa-user-graduate"
							style="font-size: 24px; color: black"></i> No. of seats
						</label> <input type="number" class="form-control" id="txtseats"
							name="txtseats" placeholder="enter number of seats"
							required="required">
						<div class="invalid-feedback">Please enter No. of seats</div>
					</div>

					<div class="mb-3">
						<!-- remove this if needed -->
						<label for="lastdate" class="form-label"> <i
							class="fas fa-calendar-alt" style="font-size: 24px; color: black"></i>
							Last Date to apply
						</label>
						<div class="form-floating mb-3">
							<div class="date" id="datepicker">
								<input type="date" class="form-control" id="txtlastdate"
									name="txtlastdate" required="required">
								<div class="invalid-feedback">Please select Last Date to
									Apply</div>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="desc" class="form-label"> <i
							class="fas fa-archive" style="font-size: 24px; color: black"></i>
							Description
						</label> <input type="text" class="form-control" id="txtdesc"
							name="txtdesc" placeholder="enter description"
							required="required">
						<div class="invalid-feedback">Please enter Job description</div>
					</div>

					<div class="mb-3">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>


	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

	<%
	}
	%>
</body>
</html>