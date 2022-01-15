<%@page import="database.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="database.Database"%>
<%@page import="database.Fee"%>
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

		Fee fe = (Fee) session.getAttribute("fdetail");
		if (fe == null) {
			response.sendRedirect("feeadmin_login.jsp");
			return;
		}

		Database db = new Database();
		ArrayList<Student> as = db
				.getRemainingFeeStudentsByDepartment(Integer.parseInt(request.getParameter("deptid")));
	%>
	<jsp:include page="partials/feeAdminDashboard.jsp">
		<jsp:param name="username" value="<%=fe.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid mt-3">
		<div>
			<h3 class="text-center text-decoration-underline mb-3"><%=request.getParameter("deptName")%> Remaining Fee Students</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Student ID</th>
						<th>Name</th>
						<th>E-mail</th>
						<th>Mobile</th>
						<th>Remaining Fee</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Student s : as) {
					%>
					<tr>
						<td><%=s.getSid()%></td>
						<td><%=s.getName()%></td>
						<td><%=s.getEmail()%></td>
						<td><%=s.getMobno()%></td>
						<td><%=s.getTotalfees() - s.getSubmitedfees()%></td>
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