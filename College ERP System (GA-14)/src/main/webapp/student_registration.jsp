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
<link rel="stylesheet" href="css/loginPage.css">

<title>Student Registration</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http1.0
		response.setHeader("Expires", "0"); //proxies

		Database db = new Database();
		Map<Integer, String> m = db.getDepartment();
	%>

	<%@ include file="partials/header.jsp"%>
	
	<main id="hero-header-section">
	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div
				class="col-12 col-sm-12 col-md-6 col-lg-6 d-none d-md-block d-lg-block d-xl-block d-xxl-block">
				<img id="forgotPasswordImg" class="img-fluid"
					src="img/login/register.svg" alt="">
			</div>
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 mb-5">
				<form action="Student_registration" method="post"
					onsubmit="return studentRegisterValidate('name','msg1','Enter Your Name',
                    'email','msg2',
                    'mobile','msg3',
                    'userPassword','msg4',
                    'confirmPassword','msg5',
                    'dobDate','msg6',
                    '10thNo','msg7','Enter 10th Percentage',
                    '12thNo','msg8','Enter 12th Percentage')"
					class="mt-5">
					<h1 class="fw-bold mb-5">Student Registration</h1>
					<div class="row">
						<div class="col-12 col-md-9 col-lg-9">
							<div class="mb-3">
								<label for="name" class="form-label text-uppercase fw-bold">Name</label>
								<input type="text" name="name" class="form-control" id="name"
									rows="3"
									onfocusout="namevalidation('name','msg1','Enter Your Name')">
								<div id="msg1" class="error-text">&nbsp;</div>
							</div>
							<div class="text-center fs-5">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="userMale" value="Male" checked> <label
										class="form-check-label" for="userMale">Male</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="userFemale" value="Female"> <label
										class="form-check-label" for="userFemale">Female</label>
								</div>
							</div>
							<div class="mb-1">
								<label for="email" class="form-label text-uppercase fw-bold">E-mail</label>
								<input type="text" name="email" class="form-control" id="email"
									onfocusout="emailvalidation('email','msg2')">
								<div id="msg2" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-1">
								<label for="mobile" class="form-label text-uppercase fw-bold">Mobile
									No.</label> <input type="text" name="mob" class="form-control"
									id="mobile" onfocusout="mobilevalidation('mobile','msg3')">
								<div id="msg3" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="userPassword"
									class="form-label text-uppercase fw-bold">Password</label> <input
									type="password" name="pass" class="form-control"
									id="userPassword"
									onfocusout="passwordvalidation('userPassword','msg4')">
								<div id="msg4" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="confirmPassword"
									class="form-label text-uppercase fw-bold">Confirm
									Password</label> <input type="password" name="cpass"
									class="form-control" id="confirmPassword"
									onfocusout="cpasswordvalidation('userPassword','confirmPassword','msg5')">
								<div id="msg5" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="dobDate" class="form-label text-uppercase fw-bold">Date
									of Birth</label> <input type="date" name="dob" class="form-control"
									id="dobDate" onfocusout="datevalidation('dobDate','msg6')">
								<div id="msg6" class="error-text">&nbsp;</div>
							</div>
							<h3 class="text-center mb-3">Qualifications</h3>
							<div class="mb-3">
								<label for="10thNo" class="form-label text-uppercase fw-bold">10th
									Percentage</label> <input type="number" name="10%" class="form-control"
									id="10thNo"
									onfocusout="numbervalidation('10thNo','msg7','Enter 10th Percentage')">
								<div id="msg7" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="12thNo" class="form-label text-uppercase fw-bold">12th
									Percentage</label> <input type="number" name="12%" class="form-control"
									id="12thNo"
									onfocusout="numbervalidation('12thNo','msg8','Enter 12th Percentage')">
								<div id="msg8" class="error-text">&nbsp;</div>
							</div>
							<div class="mb-3">
								<label for="departmentid"
									class="form-label text-uppercase fw-bold">Department</label> <select
									name="deptid" id="departmentid"
									class="form-select form-control"
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

							<button type="submit"
								class="btn landing-page-btn text-white fs-5 py-2 w-100">REGISTER</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>

	<%@ include file="partials/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<script src="js/validation.js"></script>

</body>
</html>