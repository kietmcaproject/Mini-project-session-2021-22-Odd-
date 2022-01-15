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
<link rel="stylesheet" href="css/loginPage.css">

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
		Map<Integer, String> m = db.getDepartment();
	%>
	<jsp:include page="partials/feeAdminDashboard.jsp">
		<jsp:param name="username" value="<%=fe.getName()%>" />
	</jsp:include>

	<main class="mt-5 pt-3">
	<div class="container-fluid mt-3">
		<div class="row">
			<div class="col-md-12">
				<h4>Dashboard</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-3">
				<div class="card h-100">
					<div class="card-header">
						<span class="me-2"><i class="bi bi-bar-chart-fill"></i></span> No.
						Of Students Fee Not Submitted
					</div>
					<div class="card-body">
						<canvas class="chart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-3">
				<div class="card h-100">
					<div class="card-header">
						<span class="me-2"><i class="bi bi-bar-chart-fill"></i></span> Fee
						Amount Not Submitted
					</div>
					<div class="card-body">
						<canvas class="chart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-3">
				<form action="feestudent_submit.jsp" method="post" onsubmit="return idvalidation('fsid','msg1')">
					<h1 class="fw-bold mb-5 text-center">Submit Fee</h1>
					<div class="row justify-content-center align-items-center">
						<div class="col-12 col-md-9 col-lg-9">
							<div class="mb-3">
								<label for="fsid"
									class="form-label text-uppercase fw-bold">Enter Student Id</label>
									<input type="number" name="fsid"
									class="form-control" id="fsid"
									onfocusout="idvalidation('fsid','msg1')">
								<div id="msg1" class="error-text">&nbsp;</div>
							</div>
							<button type="submit" class="btn landing-page-btn text-white fs-5 py-2 w-100">Submit</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6 mb-3">
				<form action="remaining_fee_student_list.jsp" onsubmit="return saveName()" method="post">
					<h1 class="fw-bold mb-5 text-center">Remaining Fee Student List</h1>
					<div class="row justify-content-center align-items-center">
						<div class="col-12 col-md-9 col-lg-9">
						<input id="deptName" name="deptName" type="hidden" value="">
							<div class="mb-3">
                                    <label for="department" class="form-label text-uppercase fw-bold">Department</label>
                                    <select id="deptid" name="deptid" class="form-select form-control" aria-label="Default select example">
                                        <%
            								for (Map.Entry<Integer, String> mp : m.entrySet()) {
        								%>
        									<option value="<%=mp.getKey()%>"><%=mp.getValue()%></option>
        								<%
            								}
        								%>
                                    </select>
                                    <div>&nbsp;</div>
                                </div>
							<button type="submit" class="btn landing-page-btn text-white fs-5 py-2 w-100">Submit</button>
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
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
	<script src="js/draw-fee-chart.js"></script>
	<script src="js/validation.js"></script>
	<script type="text/javascript">
		function saveName() {
			var sel = document.getElementById("deptid")
			document.getElementById("deptName").value = sel.options[sel.selectedIndex].text
			return true;
		}
	</script>

</body>
</html>