<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/loginPage.css">

    <title>Teacher Login</title>
</head>

<body>
    <%@ include file="partials/header.jsp" %>

    <main id="hero-header-section">
        <div class="container-fluid mt-5">
            <div class="row justify-content-center align-items-center">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 d-none d-md-block d-lg-block d-xl-block d-xxl-block">
                    <img id="forgotPasswordImg" class="img-fluid" src="img/login/login.svg" alt="">
                </div>
                <div class="col-11 col-sm-10 col-md-6 col-lg-4 mb-5">
                    <form action="Teacher_login" method="post" onsubmit="return userLoginValidate('userId', 'msg1', 'userPassword', 'msg2')" class="mt-5">
                        <h1 class="fw-bold mb-5">Teacher Login</h1>
                        <div class="row">
                            <div class="col-12 col-md-9 col-lg-9">
                                <div class="mb-3">
                                    <label for="userId" class="form-label text-uppercase fw-bold">User Id</label>
                                    <input type="number" name="tid" class="form-control" id="userId"
                                        onfocusout="idvalidation('userId','msg1')">
                                    <div id="msg1" class="error-text">&nbsp;</div>
                                </div>
                                <div class="mb-3">
                                    <label for="userPassword" class="form-label text-uppercase fw-bold">Password</label>
                                    <input type="password" name="pass" class="form-control" id="userPassword"
                                        onfocusout="passwordvalidation('userPassword','msg2')">
                                    <div id="msg2" class="error-text">&nbsp;</div>
                                </div>
                                <% String msg = (String) request.getAttribute("errMsg");
                                   if (msg != null) {%>
                                   <div class="error-text mb-4 fs-5 text-center"><%=msg %></div>
                                <%}%>
                                <button type="submit" class="btn landing-page-btn text-white fs-5 py-2 w-100">LOGIN</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="partials/footer.jsp" %>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <script src="js/validation.js"></script>

</body>
</html>