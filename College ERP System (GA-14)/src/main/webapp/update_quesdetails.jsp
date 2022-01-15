<%@page import="java.util.Map"%>
<%@page import="database.Teacher"%>
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

<title>Update Question</title>
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
		Map<Integer, String> m = db.getExamIdName();
	%>

	<jsp:include page="partials/teacherDashboard.jsp">
		<jsp:param name="username" value="<%=te.getName()%>" />
	</jsp:include>

	<main id="hero-header-section">
	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div
				class="col-12 col-sm-12 col-md-6 col-lg-5 d-none d-md-block d-lg-block d-xl-block d-xxl-block">
				<img id="forgotPasswordImg" class="img-fluid"
					src="img/login/register.svg" alt="">
			</div>
			<div class="col-11 col-sm-10 col-md-6 col-lg-5 mb-5 offset-lg-1">
				<form action="Update_question" method="post"
					onsubmit="return addQuestionValidate('question','msg1','Enter Question',
                    'option1','msg2','Enter Option',
                    'option2','msg3','Enter Option',
                    'option3','msg4','Enter Option',
                    'option4','msg5','Enter Option')"
					class="mt-5">
					<h1 class="fw-bold mb-5">Update Question</h1>
					<h4>Q: <%=request.getParameter("qid")%></h4>
					<input name="examId" type="hidden" value="<%=request.getParameter("examId")%>">
					<input name="qid" type="hidden" value="<%=request.getParameter("qid")%>">
					<div class="row">
						<div class="col-12 col-md-9 col-lg-9">
							<div class="mb-3">
								<label for="question" class="form-label text-uppercase fw-bold">Question</label>
								<textarea name="ques" class="form-control" id="question"
									rows="3"
									onfocusout="namevalidation('question','msg1','Enter Question')"><%=request.getParameter("question")%></textarea>
								<div id="msg1" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-1">
								<label for="option1" class="form-label text-uppercase fw-bold">Option
									1</label> <input type="text" name="op1" class="form-control"
									id="option1" value="<%=request.getParameter("op1")%>"
									onfocusout="namevalidation('option1','msg2','Enter Option')">
								<div id="msg2" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-1">
								<label for="option2" class="form-label text-uppercase fw-bold">Option
									2</label> <input type="text" name="op2" class="form-control"
									id="option2" value="<%=request.getParameter("op2")%>"
									onfocusout="namevalidation('option2','msg3','Enter Option')">
								<div id="msg3" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-1">
								<label for="option3" class="form-label text-uppercase fw-bold">Option
									3</label> <input type="text" name="op3" class="form-control"
									id="option3" value="<%=request.getParameter("op3")%>"
									onfocusout="namevalidation('option3','msg4','Enter Option')">
								<div id="msg4" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-1">
								<label for="option4" class="form-label text-uppercase fw-bold">Option
									4</label> <input type="text" name="op4" class="form-control"
									id="option4" value="<%=request.getParameter("op4")%>"
									onfocusout="namevalidation('option4','msg5','Enter Option')">
								<div id="msg5" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="coption" class="form-label text-uppercase fw-bold">Choose
									Correct Option</label> <select id="coption" name="coption"
									class="form-select form-control"
									aria-label="Default select example">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							
							<script type="text/javascript">
								document.getElementById("coption").value="<%=request.getParameter("copt")%>"
							</script>

							<button type="submit"
								class="btn landing-page-btn text-white fs-5 py-2 w-100">UPDATE</button>
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