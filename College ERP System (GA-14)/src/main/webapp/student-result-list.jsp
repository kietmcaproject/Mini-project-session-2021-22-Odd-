<%@page import="database.Result"%>
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
		ArrayList<Result> lx = db.getStudentResult(stu.getSid());
	%>
	<jsp:include page="partials/studentDashboard.jsp">
		<jsp:param name="username" value="<%=stu.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid mt-3">
		<div class="mt-5">
			<h3 class="text-center text-decoration-underline mb-3">Your Results</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Exam ID</th>
						<th>Name</th>
						<th>Date</th>
						<th>No. Questions</th>
						<th>+ve Marking</th>
						<th>-ve Marking</th>
						<th>Correct Answers</th>
						<th>InCorrect Answers</th>
						<th>Result</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Result re : lx) {
					%>
					<tr>
						<td><%=re.getExamid()%></td>
						<td><%=re.getExamName()%></td>
						<td><%=re.getDate()%></td>
						<td><%=re.getNoOfQues()%></td>
						<td><%=re.getPmarks()%></td>
						<td><%=re.getNmarks()%></td>
						<td><%=re.getCorrectans()%></td>
						<td><%=re.getIncorrectans()%></td>
						<td><%=String.format("%.2f", (((double)re.getCorrectans()*re.getPmarks()-re.getIncorrectans()*re.getNmarks())/(re.getNoOfQues()*re.getPmarks()))*100)%>%</td>
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