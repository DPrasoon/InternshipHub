<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IHub | AboutUs</title>

<%@include file="/jsp/common/headerfiles.html"%>

<style>
.bg_image {
  background-image: url("/ihub/images/aboutus.png");
  background-repeat: no-repeat;
/*   background-attachment: fixed; */
  background-size: cover;
}
</style>

</head>
<body class='clr1'>

<!-- header -->
	<div class="container-fluid" style="background-color: #d90429">
		<h2 style="color: white; text-align: center; font-family: Montserrat"
			class="mb-0">
			<i class='far fa-grin-alt' style='font-size: 32px;'></i> Who We Are <i
				class='far fa-grin-alt' style='font-size: 32px;'></i>
		</h2>
	</div>

	<%@include file="/jsp/common/commonheader.html"%>


<div class="container bg_image">

	<div class="container">
		<div class="row mt-4">
			<div class="col-12 py-4 mx-auto justify-content-center">
				<div
					class="p-3 bg-dark bg-opacity-10 border border-dark rounded-start rounded-end">
					<h1 style="text-align: center;">Our Objective</h1>
					<ul>
						<li>To put best internship providers under a single roof</li>
						<li>Best utilization of professionals</li>
						<li>Help in employment</li>
						<li>Spread awareness regarding new trends and technologies</li>
						<li>User friendly environment</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row mt-5">
			<div class="col-4 mx-auto py-5 justify-content-center">
				<div class="p-3 bg-dark bg-opacity-25 border border-dark">
					<h3 style="text-align: center;">This website is designed by-</h3>
					<p style="text-align: center;">
						<i class="fa fa-user"></i> Prasoon Dubey
					</p>
					<p style="text-align: center;">
						<i class="fas fa-envelope"></i> prasoonid@gmail.com
					</p>
					<p style="text-align: center;">
						<i class="fas fa-phone-alt"></i> 8756860222
					</p>
					<p style="text-align: center;">
						<i class="fas fa-address-card"></i> Lucknow
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>
</body>
</html>