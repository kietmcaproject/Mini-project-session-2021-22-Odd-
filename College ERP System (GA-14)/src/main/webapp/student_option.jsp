<%@page import="database.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
<%@page import="database.Student"%>
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

		Student stu = (Student) session.getAttribute("sdetail");
		if (stu == null) {
			response.sendRedirect("student_login.jsp");
			return;
		}

		Database db = new Database();
		ArrayList<Exam> lx = db.getOnlineExamLinks(stu.getDeptid(), stu.getSid());
		ArrayList<Integer> at = db.getStudentAttendance(stu.getSid());
	%>
	<jsp:include page="partials/studentDashboard.jsp">
		<jsp:param name="username" value="<%=stu.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-12">
				<h4>Dashboard</h4>
			</div>
		</div>
		<div class="row justify-content-evenly mt-3">
			<div class="col-12 col-md-4 col-lg-4">
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="card-title">Attendance</h4>
						<div class="fs-5 text-center text-muted"><%=at.get(0)%> / <%=at.get(1)%> days <span class="ms-5"><%=String.format("%.2f",( (double) at.get(0)/at.get(1))*100)%>%</span></div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-4 col-lg-4">
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="card-title">Fee Remaining</h4>
						<div class="fs-5 text-center text-muted">Rs. <%=stu.getTotalfees()-stu.getSubmitedfees()%>/-</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-5">
			<h3 class="text-center text-decoration-underline mb-3">Today's Exam Links</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Exam NAME</th>
						<th>No. Question</th>
						<th>Time Duration</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Exam e : lx) {
					%>
					<tr>
						<td><a <% if (!e.isStudentStatus()) {%>
								href="exam_instruction.jsp?eid=<%=e.getExamid()%>
								<%}%>"><%=e.getExamName()%></a></td>
						<td><%=e.getNoOfQues()%></td>
						<td><%=e.getDtime()%></td>
						<td><% if (e.isStudentStatus()) {%>
							Completed
							<%} else { %>
							Pending!
							<%}%>
						</td>
					<tr>
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

</body>
</html>