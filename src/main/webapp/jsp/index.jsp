<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="ihub.dbtask.*, java.util.*, ihub.beans.*, java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internship Hub</title>

<%@include file="/jsp/common/headerfiles.html"%>


<style> /* catching in-buit classes and overwriting their properties */
.w-100 {
	width: 90% !important;
	height: 90vh;
	margin: auto;
}
</style>

<script>
	// text blink
	const colors = [ "#0096c7", "white" ]
	var index = 0
	function textBlink() {
		document.getElementById("header").style.color = colors[index];
		index++
		if (index > (colors.length - 1)) {
			index = 0
		}
		setTimeout(textBlink, 400)
	}
</script>

</head>
<body onload="textBlink()" class='clr1'>

	<!-- headline -->
	<div class="container-fluid" style="background-color: #d90429">
		<h2 style="color: white; text-align: center; font-family: Montserrat;"
			class="mb-0" id="header">Welcome to the Internship Hub Portal</h2>
	</div>

	<!-- navbar -->
	<%@include file="/jsp/common/commonheader.html"%>


	<!-- carousel starts from here -->

	<div class="container">
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="/ihub/images/carousel1.png" alt="pic1"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="/ihub/images/carousel2.png" alt="pic2"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="/ihub/images/carousel3.png" alt="pic3"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="/ihub/images/carousel4.png" alt="pic3"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>


	<!-- events -->

	<%
	String sql = "select * from notices";
	ArrayList<NoticeBean> noticelist = CommonTask.viewNotices(sql);
	%>
	<br>
	<div class="container-fluid">
		<marquee onmouseover="this.stop()" onmouseout="this.start()">
			<ul style="list-style-type: none; background-color: white;">
				<%
				for (int i = 0; i < noticelist.size(); i++) //size() will count total number of objects in the arraylist
				{
					NoticeBean nb = noticelist.get(i); //it is used to fetch data(object) from a given index
				%>
				<li style="display: inline; color: red; background-color: white;"><%=nb.getNoticeid()%>.)
					&nbsp;&nbsp; <%=nb.getProviderid()%> &nbsp;&nbsp;<%=nb.getDate()%>&nbsp;&nbsp;<%=nb.getNoticetopic()%>&nbsp;&nbsp;<%=nb.getNoticecontents()%>&nbsp;&nbsp;||&nbsp;&nbsp;</li>
				<%
				}
				%>
			</ul>
		</marquee>
	</div>
	<br>
	<br>

	<!-- jobs -->

	<div
		class="container-fluid col-4 justify-content-center bg-dark text-info mt-3">
		<h1 style="text-align: center">Jobs we Offer</h1>
	</div>
	<!-- 	displaying feedbacks in table -->
	<div class="container">
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<th scope="col">Job ID</th>
					<th scope="col">Employer ID</th>
					<th scope="col">Post Name</th>
					<th scope="col">Eligibility</th>
					<th scope="col">No. of Seats</th>
					<th scope="col">Last Date to apply</th>
					<th scope="col">Posted On</th>
					<th scope="col">Description On</th>
				</tr>
			</thead>
			<tbody>

				<%
				String strsql = "select * from jobs";

				ResultSet rs = CommonTask.viewJobs(strsql);
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("jobid")%></td>
					<td><%=rs.getString("employerid")%></td>
					<td><%=rs.getString("postname")%></td>
					<td><%=rs.getString("eligibility")%></td>
					<td><%=rs.getInt("noofseats")%></td>
					<td><%=rs.getDate("lastdatetoapply")%></td>
					<td><%=rs.getDate("postdate")%></td>
					<td><%=rs.getString("description")%></td>
				</tr>
				<%
				}
				if (rs != null) {
				rs.close();
				}
				%>
			</tbody>
		</table>
	</div>





	<%@include file="/jsp/common/commonfooter.html"%>

	<%@include file="/jsp/common/scriptfiles.html"%>
</body>
</html>