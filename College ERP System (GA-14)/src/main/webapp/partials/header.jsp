<%@page import="database.Fee"%>
<%@page import="database.Student"%>
<%@page import="database.Teacher"%>
<%@page import="database.Admin"%>
<%
	boolean auth = false;
	String name = "", link = "", link2 = "";
	Admin ad = (Admin) session.getAttribute("detail");
	if (ad != null) {
		auth = true;
		name = ad.getName();
		link = "admin_option.jsp";
		link2 = "Admin_logout";
	}

	Teacher te = (Teacher) session.getAttribute("tdetail");
	if (te != null) {
		auth = true;
		name = te.getName();
		link = "teacher_option.jsp";
		link2 = "Teacherlogout";
	}

	Student stud = (Student) session.getAttribute("sdetail");
	if (stud != null) {
		auth = true;
		name = stud.getName();
		link = "student_option.jsp";
		link2 = "Student_logout";
	}
	
	Fee fe = (Fee) session.getAttribute("fdetail");
	if (fe != null) {
		auth = true;
		name = fe.getName();
		link = "feeadmin_option.jsp";
		link2 = "Feeadmin_logout";
	}
%>
<header>
	<nav class="navbar navbar-expand-lg bg-dark">
		<div class="container-fluid">
			<a
				class="navbar-brand me-auto ms-lg-5 ms-5 text-uppercase fw-bold fs-3"
				href="./"><%=application.getInitParameter("college-name")%></a>
			<div class="">
				<ul class="navbar-nav text-center ms-auto me-5">
					<%
						if (!auth) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle ms-2" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">SignIn /
							SignUp </a>
						<ul class="dropdown-menu dropdown-menu-end bg-dark">
							<li><a class="dropdown-item" href="admin_login.jsp">Admin
									Login</a></li>
							<li><a class="dropdown-item" href="teacher_login.jsp">Faculty
									Login</a></li>
							<li><a class="dropdown-item" href="student_registration.jsp">Student
									Registration</a></li>
							<li><a class="dropdown-item" href="student_login.jsp">Student
									Login</a></li>
							<li><a class="dropdown-item" href="feeadmin_login.jsp">Fee
									Admin Login</a></li>
						</ul></li>
					<%
						}
					%>
					<%
						if (auth) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle ms-2" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"><i
							class="bi bi-person-fill"></i> </a>
						<ul class="dropdown-menu dropdown-menu-end bg-dark">
							<li class="text-center fs-5 themeColor2"><%=name%></li>
							<li><a class="dropdown-item" href="<%=link%>">Dashboard</a></li>
							<li><a class="dropdown-item" href="<%=link2%>">Logout</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
</header>