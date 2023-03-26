<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Internship Provider Registration</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body class='clr1'>

	<div class="container-fluid p-0" style="background-color: #d90429">
		<h2 style="color: white; text-align: center; font-family: Montserrat"
			id="header" class="mb-0">Internship Provider Registration</h2>
	</div>
	<%@include file="/jsp/common/commonheader.html"%><br>
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/IP_Registration">

					<div class="mb-3">
						<label for="providerID" class="form-label"> <i
							class="fas fa-id-badge" style="font-size: 24px; color: black"></i>
							Provider's ID
						</label> <input type="text" class="form-control" id="txtid" name="txtid"
							placeholder="Enter your ID" required="required">
						<div class="invalid-feedback">Please Enter your ID</div>
					</div>

					<div class="mb-3">
						<label for="providerPass" class="form-label"> <i
							class="fas fa-key" style="font-size: 24px; color: black"></i>
							Password
						</label> <input type="password" class="form-control" id="txtpass"
							name="txtpass" placeholder="Enter your password"
							required="required">
						<div class="invalid-feedback">Please Enter Your Password</div>
					</div>

					<div class="mb-3">
						<label for="orgname" class="form-label"> <i
							class="fas fa-university" style="font-size: 24px; color: black"></i>
							Organization's Name
						</label> <input type="text" class="form-control" id="txtorgname"
							name="txtorgname" placeholder="Enter your Organization's name"
							required="required">
						<div class="invalid-feedback">Please Enter Organization's
							Name</div>
					</div>

					<div class="mb-3">
						<label for="ownername" class="form-label"> <i
							class="fa fa-user" style="font-size: 24px; color: black"></i>
							Owner's Name
						</label> <input type="text" class="form-control" id="txtownername"
							name="txtownername" placeholder="Enter Owner's name"
							required="required">
						<div class="invalid-feedback">Please Enter Owner's Name</div>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label"> <i
							class='fas fa-envelope-square'
							style="font-size: 24px; color: black"></i> Email
						</label> <input type="text" class="form-control" id="txtmail"
							name="txtmail" placeholder="Enter email" required="required">
						<div class="invalid-feedback">Please Enter Email</div>
					</div>


					<div class="mb-3">
						<label for="phone" class="form-label"> <i
							class="fas fa-phone" style="font-size: 24px; color: black"></i>
							Phone Number
						</label> <input type="number" class="form-control" id="txtphone"
							name="txtphone" placeholder="Enter phone number"
							required="required">
						<div class="invalid-feedback">Please Enter phone number</div>
					</div>

					<div class="mb-3">
						<label for="address" class="form-label"> <i
							class="fas fa-building" style="font-size: 24px; color: black"></i>
							Address
						</label> <input type="text" class="form-control" id="txtaddress"
							name="txtaddress" placeholder="Enter address" required="required">
						<div class="invalid-feedback">Please Enter Address</div>
					</div>

					<div class="mb-3">
						<label for="city" class="form-label"> <i
							class="	fas fa-hospital-alt"
							style="font-size: 24px; color: black"></i> City
						</label> <input type="text" class="form-control" id="txtcity"
							name="txtcity" placeholder="Enter city" required="required">
						<div class="invalid-feedback">Please Enter City</div>
					</div>

					<div class="mb-3">
						<label for="domain" class="form-label"> <i
							class="fas fa-certificate" style="font-size: 24px; color: black"></i>
							Domain
						</label> <input type="text" class="form-control" id="txtdomain"
							name="txtdomain"
							placeholder="Enter the domain of the organization"
							required="required">
						<div class="invalid-feedback">Please Enter Domain</div>
					</div>

					<div class="mb-3">
						<label for="aboutorg" class="form-label"> <i
							class="fas fa-archive" style="font-size: 24px; color: black"></i>
							About Organization
						</label> <input type="text" class="form-control" id="txtaboutorg"
							name="txtaboutorg" placeholder="Enter about the organization"
							required="required">
						<div class="invalid-feedback">Please Enter Text</div>
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

</body>
</html>