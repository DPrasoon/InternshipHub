<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IHub | Feedback</title>

<%@include file="/jsp/common/headerfiles.html"%>


</head>
<body class='clr1'>

	<%
	//to display msg after form submission
	String error_msg = (String) request.getAttribute("message"); //typecast to String as servlet could have sent object(not string)
	%>


	<%@include file="/jsp/common/commonheader.html"%>

	<%
			if (error_msg != null) {
			%>
	<div class="alert alert-primary" role="alert">
		<%=error_msg%>
	</div>
	<%
			}
			%>


	<div
		class="container-fluid col-4 justify-content-center bg-dark text-info mt-3">
		<h1 style="text-align: center">Feedback Form</h1>
	</div>

	<div class="row mt-5 justify-content-center">
		<div class="col-4">
			<form class="needs-validation" novalidate method="post" action="/ihub/Feedback">

				<div class="mb-3">
					<label for="providerid" class="form-label">Organization ID</label> <input
						type="text" class="form-control" id="providerid" name="providerid">
				</div>

				<div class="mb-3">
					<label for="uname" class="form-label">Your Name</label> <input
						type="text" class="form-control" id="uname" name="uname">
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="email" name="email">
				</div>

				<label for="feedback" class="form-label">Feedback</label>
				<div class="form-floating mb-3">
					<textarea class="form-control" placeholder="Leave a comment here"
						id="feedback" name="feedback"></textarea>
				</div>

				<div class="mb-3">
					<label class="form-label">Ratings</label> <select
						class="form-select" aria-label="Default select example"
						name="rating">
						<option selected>Select</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>


				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
	</div>
	<br>
	<br>

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>

</body>
</html>