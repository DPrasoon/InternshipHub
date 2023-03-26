<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp" %>


</head>
<body class='clr1'>


	<%
	String error_msg = (String) request.getAttribute("message"); //typecast to String as servlet could have sent object(not string)
	%>

	<%
			if (error_msg != null) {
			%>
	<div class="alert alert-primary" role="alert">
		<%=error_msg%>
	</div>
	<%
			}
			%>


	<!-- head label -->
	<div
		class="container-fluid col-4 justify-content-center bg-dark text-primary mt-3">
		<h1 style="text-align: center">Admin Login</h1>
	</div>


	<div class="row mt-5 justify-content-center">
		<!-- image -->
		<div class="col-4">
			<img src="/ihub/images/admin.jpg" style="width: 400px">
		</div>

		<!-- form -->
		<div class="col-4">
			<form class="needs-validation" novalidate method="post"
				action="/ihub/Admin_Login">

				<div class="mb-3">
					<label for="userid" class="form-label">ID</label> <input
						type="text" class="form-control" id="txtid" name="txtid"
						required="required">
					<div class="invalid-feedback">Please enter your User ID!</div>
					<div class="valid-feedback">Looks good!</div>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" id="txtpass" name="txtpass" required="required">
					<div class="invalid-feedback">Password needed!</div>
					<div class="valid-feedback">Looks good!</div>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>

			</form>

		</div>

	</div>

	<%@include file="/jsp/common/commonfooterfixed.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

</body>
</html>