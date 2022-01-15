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
		ArrayList<Question> arques = db.getAllQuestion(Integer.parseInt(request.getParameter("examId")));
	%>
	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid p-4">
		<div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>SNo</th>
						<th>Question id</th>
						<th>Question</th>
						<th>Op1</th>
						<th>Op2</th>
						<th>Op3</th>
						<th>Op4</th>
						<th>Correct Option</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < arques.size(); i++) {
							Question q = arques.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=q.getQid()%></td>
						<td><%=q.getQues()%></td>
						<td><%=q.getOp1()%></td>
						<td><%=q.getOp2()%></td>
						<td><%=q.getOp3()%></td>
						<td><%=q.getOp4()%></td>
						<td><%=q.getCoption()%></td>
						<td><a class="btn btn-success"
							href="update_quesdetails.jsp?examId=<%=Integer.parseInt(request.getParameter("examId"))%>&qid=<%=q.getQid()%>&question=<%=q.getQues()%>&op1=<%=q.getOp1()%>&op2=<%=q.getOp2()%>&op3=<%=q.getOp3()%>&op4=<%=q.getOp4()%>&copt=<%=q.getCoption()%>">update</a></td>
						<td><a class="btn btn-danger"
							href="Deleteques?examId=<%=request.getParameter("examId")%>&qid=<%=q.getQid()%>">deleteques</a></td>
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
</body>
</html>