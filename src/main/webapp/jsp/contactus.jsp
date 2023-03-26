<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IHub | Contact Us</title>

<%@include file="/jsp/common/headerfiles.html"%>


<!-- cycling image -->
<script>
	const imageArr = [ "img1.png", "img2.png", "img3.png", "img4.png" ]
	var index = 0
	function changeImage() {
		document.getElementById("img1").src = "/ihub/images/"
				+ imageArr[index]
		index++
		if (index > (imageArr.length - 1)) {
			index = 0
		}

		setTimeout(changeImage, 300)
	}
</script>

</head>
<body onload="changeImage()" class='clr1'>

<!-- header -->
	<div
		class="container-fluid justify-content-center bg-white mb=0">
		<h2 style="text-align: center;" class="mb-0">Feel free to contact us!</h2>
	</div>

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
	<br>
	<!-- Image -->
	<div class="row mt-0 justify-content-center">
		<img src="/ihub/images/img1.png" class="d-block w-25"
			id="img1" style="width: 600px; height: 200px">
	</div><br>

	<!-- Feedback Form -->
	<div class="row mt-0 justify-content-center">
		<div class="col-3">
			<form class="needs-validation" novalidate method="post" action="/ihub/ContactUs">

				<div class="mb-3">
					<label for="uname" class="form-label">Your Name</label> <input
						type="text" class="form-control" id="txtname" name="txtname">
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="txtmail" name="txtmail">
				</div>
				
				<div class="mb-3">
					<label for="phone" class="form-label">Phone</label> <input
						type="number" class="form-control" id="txtphone" name="txtphone">
				</div>

				<label for="query" class="form-label">Your query</label>
				<div class="form-floating mb-3">
					<textarea class="form-control"
						placeholder="Please leave your query here!" id="txtquery"
						name="txtquery"></textarea>
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