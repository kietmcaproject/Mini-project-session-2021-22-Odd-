<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
<%@page import="database.Exam"%>
<%@page import="database.Teacher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/dashboard.css">

<title>Dashboard</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http1.0
		response.setHeader("Expires", "0"); //proxies

		Teacher te = (Teacher) session.getAttribute("tdetail");
		if (te == null) {
			response.sendRedirect("teacher_login.jsp");
			return;
		}

		Database db = new Database();
		ArrayList<Exam> arexams = db.getUpcomingOnlineExams();
	%>
	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-12">
				<h4>Dashboard</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-3">
				<div class="card h-100">
					<div class="card-header">
						<span class="me-2"><i class="bi bi-bar-chart-fill"></i></span> No.
						Of Students
					</div>
					<div class="card-body">
						<canvas class="chart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-3">
				<div class="card h-100">
					<div class="card-header">
						<span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
						Students Taken Exam
					</div>
					<div class="card-body">
						<canvas class="chart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-5">
			<h3 class="text-center text-decoration-underline mb-3">Upcoming
				Exams!</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Exam ID</th>
						<th>Name</th>
						<th>Date</th>
						<th>Start Time</th>
						<th>Total Questions</th>
						<th>Positive marks</th>
						<th>Negative Marks</th>
						<th>Duration</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < arexams.size(); i++) {
							Exam e = arexams.get(i);
					%>
					<tr>
						<th><%=e.getExamid()%></th>
						<td><%=e.getExamName()%></td>
						<td><%=e.getDate()%></td>
						<td><%=e.getTime()%></td>
						<td><%=e.getNoOfQues()%></td>
						<td><%=e.getPmarks()%></td>
						<td><%=e.getNmarks()%></td>
						<td><%=e.getDtime()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</main>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
	<script src="js/draw-chart.js"></script>

</body>
</html>