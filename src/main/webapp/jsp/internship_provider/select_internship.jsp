<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Select Internship</title>

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
		 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<%
	}
	%>
	
	<%@include file="/jsp/internship_provider/ip_header.html"%>
	<div class="container-fluid p-0" style="background-color: white">
		<h2 style="color: #d90429; text-align: center; font-family: Montserrat"
			id="header">Select Internship</h2>
	</div>
	
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/Select_Internship">

					<div class="mb-3">
						<label for="progname" class="form-label"> <i
							class="fas fa-laptop-code" style="font-size: 24px; color: black"></i>
							Program Name
						</label> <input type="text" class="form-control" id="txtprogname" name="txtprogname"
							placeholder="Enter program's name" required="required">
						<div class="invalid-feedback">Please Enter Program Name</div>
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


	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

<%
	}
	%>
</body>
</html>