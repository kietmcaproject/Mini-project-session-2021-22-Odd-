<%@page import="database.Student"%>
<%@page import="database.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
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
<style>
.detail {
	font-weight: bold;
	width: 160px;
}
</style>
<title>Instructions</title>
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
		int eid = Integer.parseInt(request.getParameter("eid"));
		if (db.getOnlineExamStatus(eid, stu.getSid())) {
			response.sendRedirect("student_option.jsp");
			return;
		}
		Exam ex = db.getOnlineExamDetails(eid);
		session.setAttribute("examdetails", ex);
	%>
	<%@ include file="partials/header.jsp"%>

	<main>
	<div class="container my-5">
		<div class="card shadow-sm">
			<div class="card-body">
				<h3 class="card-title text-center text-decoration-underline">Instructions</h3>
				<div class="container-fluid my-5">
					<div class="row">
						<div
							class="col-12 col-md-6 col-lg-6">
							<div class="d-flex justify-content-center">
								<span>
									<div>
										<label class="detail">Exam Name</label>:
										<%=ex.getExamName()%></div>
									<div>
										<label class="detail">No. of Questions</label>:
										<%=ex.getNoOfQues()%></div>
									<div>
										<label class="detail">Start Time</label>:
										<%=ex.getTime()%></div>
									<div>
										<label class="detail">Duration</label>:
										<%=ex.getDtime()%></div>
									<div>
										<label class="detail">Positive Marking</label>:
										<%=ex.getPmarks()%></div>
									<div>
										<label class="detail">Negative Marking</label>:
										<%=ex.getNmarks()%></div>
								</span>
							</div>
							<div class="text-center mt-4">
								<a href="Prepare_onlineexam"
									class="btn bg-themeColor2 fw-bold text-white">Start Exam</a>
							</div>
						</div>
						<div class="col-12 col-md-6 col-lg-6">
							1. The examination does not require using any paper, pen, pencil
							and calculator.<br> 2. Every student will take the
							examination on a Laptop/Desktop/Smart Phone<br> 3. On
							computer screen every student will be given objective type type
							Multiple Choice Questions (MCQs).<br> 4. Each student will
							get questions and answers in different order selected randomly
							from a fixed Question Databank.<br> 5. The students just
							need to click on the Right Choice / Correct option from the
							multiple choices /options given with each question. For Multiple
							Choice Questions, each question has four options, and the
							candidate has to click the appropriate option.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@ include file="partials/footer.jsp"%>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>