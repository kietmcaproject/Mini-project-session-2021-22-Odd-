<%@page import="database.Teacher"%>
<%@page import="database.Admin"%>
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
<link rel="stylesheet" href="css/main.css">

<title>College ERP</title>
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http1.0
		response.setHeader("Expires", "0"); //proxies
	%>
	<%@ include file="partials/header.jsp"%>
	<main>

        <div class="parallax1">
            <div class="themeColor2 parallax1-tagline px-5 text-center">
                <div>
                    <a class="themeColor2 fs-3 hover-white" href="#college-intro" style="text-decoration: none;">Know More<div
                            class="fs-2"><i class="bi bi-chevron-down"></i></div></a>
                </div>
                <div class="fs-1">
                    You will be able to find your future with us
                </div>
            </div>
        </div>

        <div id="college-intro" class="college-intro pt-5">
            <h1 class="text-center themeColor2">Welcome To College Of Excelence</h1>

            <div class="container my-5">
                <div class="row justify-content-evenly align-items-center">
                    <div class="col-10 col-sm-12 col-md-6 col-lg-4 h-100">
                        <div class="card p-3 shadow mw-100">
                            <div class="card-body">
                                <h5 class="card-title">About College</h5>
                                <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officiis,
                                    unde sint ad voluptate quod, dicta amet provident animi vitae placeat doloremque
                                    maiores iste, fugiat eaque ab nemo perspiciatis! Sequi repellendus atque rerum hic
                                    optio quod alias aut animi, vitae commodi quibusdam laborum deserunt molestias
                                    officia soluta rem ab quas veritatis?</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-10 col-sm-12 col-md-6 col-lg-8">
                        <img id="forgotPasswordImg" class="img-fluid" src="img/home/img1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="parallax2">
            <div class="container-fluid py-5">
                <div class="row justify-content-evenly align-items-center">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course1.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Computer Science Enigineering</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course2.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Mechanical Enigineering</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course3.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Civil Enigineering</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-evenly align-items-center mt-5">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course4.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Electronics Enigineering</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course5.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Information Technology Enigineering</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="card">
                            <img src="img/home/course6.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-text text-center themeColor2">Electrical Enigineering</h4>
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