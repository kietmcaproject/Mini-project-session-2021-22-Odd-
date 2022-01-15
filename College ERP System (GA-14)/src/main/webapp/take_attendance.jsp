<%@page import="java.util.Map"%>
<%@page import="database.Exam"%>
<%@page import="database.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
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
<style type="text/css">
.form-check-input:hover {
	cursor: pointer;
}
</style>

<title>Attendance</title>
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
		Map<Integer, String> m = db.getStudentIdNameByDepartment(te.getDeptid());
		session.setAttribute("student_Id_List_Attendance", m);
	%>
	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid pt-4">
		<div class="text-center">
			<h3 class="mb-5">Attendance</h3>
			<%
				if (db.checkTodayAttendanceStatus(te.getDeptid())) {
			%>
			<h3 class="mb-5 text-danger">All Ready Done!</h3>
			<%
				} else {
			%>
			<form action="Save_attendance" method="post">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>S_ID</th>
							<th>Name</th>
							<th>Present / Absent</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Map.Entry<Integer, String> mp : m.entrySet()) {
						%>
						<tr>
							<td><%=mp.getKey()%></td>
							<td><%=mp.getValue()%></td>
							<td><input class="form-check-input me-5" type="radio"
								name="<%=mp.getKey()%>" value="1" checked /> <input
								class="form-check-input" type="radio" name="<%=mp.getKey()%>"
								value="0" /></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<button type="submit"
					class="btn bg-themeColor2 text-white fs-5 py-2 my-4">Submit</button>
			</form>
			<%
				}
			%>
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