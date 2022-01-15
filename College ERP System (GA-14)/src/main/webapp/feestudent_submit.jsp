<%@page import="database.Fee"%>
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
<link rel="stylesheet" href="css/loginPage.css">
<style>
.detail {
	font-weight: bold;
	width: 160px;
}
</style>

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
		Student stu = db.studentDetail(Integer.parseInt(request.getParameter("fsid")));
		session.setAttribute("studentdetail", stu);
	%>
	<jsp:include page="partials/feeAdminDashboard.jsp">
		<jsp:param name="username" value="<%=fe.getName()%>" />
	</jsp:include>
	<main class="mt-5 pt-3">
	<div class="container-fluid mt-5">
		<div class="row mt-5">
			<div class="col-12 col-md-6 col-lg-6">
				<div class="d-flex justify-content-center">
					<span>
						<div>
							<label class="detail">Student Id</label>:
							<%=stu.getSid()%></div>
						<div>
							<label class="detail">Student Name</label>:
							<%=stu.getName()%></div>
						<div>
							<label class="detail">Department</label>:
							<%=stu.getDeptname()%></div>
						<div>
							<label class="detail">E-mail</label>:
							<%=stu.getEmail()%></div>
						<div>
							<label class="detail">Mobile No.</label>:
							<%=stu.getMobno()%></div>
						<div>
							<label class="detail">Submitted Fee</label>:
							<%=stu.getSubmitedfees()%></div>
						<div>
							<label class="detail">Total Fee</label>:
							<%=stu.getTotalfees()%></div>
						<div>
							<label class="detail">Remaining Fee</label>:
							<%=stu.getTotalfees() - stu.getSubmitedfees()%></div>
					</span>
				</div>
			</div>
			<div class="col-md-6 mb-3">
				<form action="Feesubmit" method="post"
					onsubmit="return numbervalidation('fsid','msg1','Enter Amount')">
					<h1 class="fw-bold mb-5 text-center">Submit Fee</h1>
					<div class="row justify-content-center align-items-center">
						<div class="col-12 col-md-9 col-lg-9">
							<div class="mb-3">
								<label for="fsid" class="form-label text-uppercase fw-bold">Enter
									Amount</label> <input type="number" name="sfee" class="form-control"
									id="fsid"
									onfocusout="idvalidation('fsid','msg1','Enter Amount')">
								<div id="msg1" class="error-text">&nbsp;</div>
							</div>
							<button type="submit"
								class="btn landing-page-btn text-white fs-5 py-2 w-100">Submit</button>
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