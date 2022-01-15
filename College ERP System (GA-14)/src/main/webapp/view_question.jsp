<%@page import="java.sql.ResultSet"%>
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
<title>View Exam/Questions</title>
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
		ResultSet rs = db.selectExam();
	%>

	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid p-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>ExamID</th>
					<th>ExamName</th>
					<th>ExamDate</th>
					<th>ExamStartTime</th>
					<th>Total Ques</th>
					<th>Positive marks</th>
					<th>Negative Marks</th>
					<th>Duration Time</th>
					<th colspan="2">Update Details</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
				%>
				<tr>
					<th><%=rs.getInt(1)%></th>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getDate(4)%></td>
					<td><%=rs.getTime(5)%></td>
					<td><%=rs.getInt(6)%></td>
					<td><%=rs.getInt(7)%></td>
					<td><%=rs.getInt(8)%></td>
					<td><%=rs.getInt(9)%></td>
					<td><a class="btn btn-success"
						href="update_exam.jsp?examId=<%=rs.getInt(1)%>&examName=<%=rs.getString(2)%>&did=<%=rs.getInt(3)%>&examDate=<%=rs.getDate(4)%>&startTime=<%=rs.getTime(5)%>&totalQues=<%=rs.getInt(6)%>&pmarks=<%=rs.getInt(7)%>&nmarks=<%=rs.getInt(8)%>&dTime=<%=rs.getInt(9)%>">Update
							details</a></td>
					<td><a class="btn btn-success"
						href="update_question.jsp?examId=<%=rs.getInt(1)%>">Update
							Question</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</main>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>