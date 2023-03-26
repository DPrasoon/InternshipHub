<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,ihub.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IH | Select Job</title>

<%@include file="/jsp/common/headerfiles.html"%>

</head>
<body class='clr1'>

<!-- 	headline -->
	<div class="container-fluid p-0" style="background-color: #d90429">
		<h2 style="color: white; text-align: center; font-family: Montserrat"
			id="header" class="mb-0">Search Internship By Course</h2>
	</div>
	
<!-- 	header -->
	<%@include file="/jsp/common/commonheader.html"%>
	<br>
	
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-6 border border-white border-3 p-2">
				<form class="needs-validation" novalidate method="post"
					action="/ihub/jsp/search_by_course.jsp">

					<div class="mb-3">
						<label for="course" class="form-label"> <i
							class="far fa-building" style="font-size: 24px; color: white"></i>
							Course Name
						</label> <input type="text" class="form-control" id="txtcourse" name="txtcourse"
							placeholder="enter course" required="required">
						<div class="invalid-feedback">Please enter Course Name</div>
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
</body>
</html>