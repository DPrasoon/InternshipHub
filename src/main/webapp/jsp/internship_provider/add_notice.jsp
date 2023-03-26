<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IP | Add Notice</title>
<%@include file="/jsp/common/headerfiles.html"%>
<%@include file="/jsp/common/cacheclear.jsp"%>

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


	<div
		class="container-fluid col-4 justify-content-center bg-dark text-info mt-3">
		<h1 style="text-align: center">Add Notice</h1>
	</div>

	<div class="row mt-5 justify-content-center">
		<div class="col-4">
			<form method="post" action="/ihub/AddNotice">

				<div class="mb-3">
					<label for="topic" class="form-label">Notice Topic</label> <input
						type="text" class="form-control" id="txttopic" name="txttopic">
				</div>

				<div class="mb-3">
					<label for="content" class="form-label">Notice Content</label> <input
						type="text" class="form-control" id="txtcontent" name="txtcontent">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
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