<!-- top navigation bar -->
<nav class="navbar navbar-expand-lg bg-dark fixed-top">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#sidebar"
			aria-controls="offcanvasExample">
			<span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
		</button>
		<a
			class="navbar-brand me-auto ms-lg-5 ms-5 text-uppercase fw-bold fs-3"
			href="./"><%=application.getInitParameter("college-name")%></a>
	</div>
</nav>
<!-- top navigation bar -->
<!-- offcanvas -->
<div class="offcanvas offcanvas-start sidebar-nav bg-dark" tabindex="-1"
	id="sidebar">
	<div class="offcanvas-body p-0">
		<nav>
			<ul class="navbar-nav">
				<li class="text-center mt-4"><img src="img/user.png"
					class="rounded-circle" alt="..." width="100" height="100">
					<div class="text-white mt-3">${param.username}</div></li>
				<li><a href="teacher_option.jsp" class="nav-link px-3 active"> <span
						class="me-2"><i class="bi bi-speedometer2"></i></span> <span>Dashboard</span>
				</a></li>
				<li><a href="Teacherlogout" class="nav-link px-3"> <span
						class="me-2"><i class="bi bi-box-arrow-right"></i></span> <span>Logout</span>
				</a></li>
				<li class="my-4">
					<hr class="dropdown-divider bg-light" />
				</li>
				<li><a href="create_exam.jsp" class="nav-link px-3"> <span class="me-2"><i
							class="bi bi-book-fill"></i></span> <span>Create Exam</span>
				</a></li>
				<li><a href="add_question.jsp" class="nav-link px-3"> <span class="me-2"><i
							class="bi bi-book-fill"></i></span> <span>Add Question</span>
				</a></li>
				<li><a href="view_question.jsp" class="nav-link px-3"> <span class="me-2"><i
							class="bi bi-book-fill"></i></span> <span>View Exam/Questions</span>
				</a></li>
				<li class="my-4">
					<hr class="dropdown-divider bg-light" />
				</li>
				<li><a href="take_attendance.jsp" class="nav-link px-3"> <span class="me-2"><i
							class="bi bi-book-fill"></i></span> <span>Take Attendance</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
<!-- offcanvas -->