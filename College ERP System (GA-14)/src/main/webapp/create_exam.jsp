<%@page import="database.Teacher"%>
<%@page import="java.util.Map"%>
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
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/loginPage.css">

<title>Create Exam</title>
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
		Map<Integer, String> m = db.getDepartment();
	%>

	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main>
	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div
				class="col-12 col-sm-12 col-md-6 col-lg-5 d-none d-md-block d-lg-block d-xl-block d-xxl-block">
				<img id="forgotPasswordImg" class="img-fluid"
					src="img/login/register.svg" alt="">
			</div>
			<div class="col-11 col-sm-10 col-md-6 col-lg-5 mb-5 offset-lg-1">
				<form action="Create_exam" method="post"
					onsubmit="return examRegisterValidate('examName', 'msg1', 'Enter Exam Name', 
                                                                'examDate', 'msg2', 
                                                                'examTime', 'msg3', 
                                                                'examDuration', 'msg4', 'Enter Valid Duration', 
                                                                'noOfQues','msg5', 'Invalid!', 
                                                                'pmark','msg6','Invalid!', 
                                                                'nmark','msg7','Invalid!')"
					class="mt-5">
					<h1 class="fw-bold mb-5">Create Exam</h1>
					<div class="row">
						<div class="col-12 col-md-9 col-lg-9">
							<div class="mb-1">
								<label for="examName" class="form-label text-uppercase fw-bold">Exam
									Name</label> <input type="text" name="examName" class="form-control"
									id="examName"
									onfocusout="namevalidation('examName','msg1','Enter Exam Name')">
								<div id="msg1" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="examDate" class="form-label text-uppercase fw-bold">Date</label>
								<input type="date" name="date" class="form-control"
									id="examDate" onfocusout="datevalidation('examDate','msg2')">
								<div id="msg2" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="examTime" class="form-label text-uppercase fw-bold">Start
									Time</label> <input type="time" name="time" class="form-control"
									id="examTime" onfocusout="timevalidation('examTime','msg3')">
								<div id="msg3" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="examDuration"
									class="form-label text-uppercase fw-bold">Duration
									(minutes)</label> <input type="number" name="dtime"
									class="form-control" id="examDuration"
									onfocusout="numbervalidation('examDuration','msg4', 'Enter Valid Duration')">
								<div id="msg4" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="department"
									class="form-label text-uppercase fw-bold">Department</label> <select
									name="deptid" class="form-select form-control"
									aria-label="Default select example">
									<%
										for (Map.Entry<Integer, String> mp : m.entrySet()) {
									%>
									<option value="<%=mp.getKey()%>"><%=mp.getValue()%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label for="noOfQues" class="form-label text-uppercase fw-bold">No.
									of Questions</label> <input type="number" name="noOfQues"
									class="form-control" id="noOfQues"
									onfocusout="numbervalidation('noOfQues','msg5', 'Invalid!')">
								<div id="msg5" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="pmark" class="form-label text-uppercase fw-bold">Positive
									Marking</label> <input type="number" name="pmarks" class="form-control"
									id="pmark"
									onfocusout="numbervalidation('pmark','msg6','Invalid!')">
								<div id="msg6" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="nmark" class="form-label text-uppercase fw-bold">Negative
									Marking</label> <input type="number" name="nmarks" class="form-control"
									id="nmark"
									onfocusout="numbervalidation('nmark','msg7','Invalid!')">
								<div id="msg7" class="error-text">&nbsp;</div>
							</div>

							<button type="submit"
								class="btn landing-page-btn text-white fs-5 py-2 w-100">CREATE</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="js/validation.js"></script>

</body>
</html>