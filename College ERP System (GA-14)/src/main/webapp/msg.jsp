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

<title>Message</title>
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http1.0
		response.setHeader("Expires", "0"); //proxies
	%>
	<%@ include file="partials/header.jsp"%>
	<%!String msg;
	String msg2;
	String link;
	String bname;
	String color;%>
	<%
		msg = (String) request.getAttribute("msg");
		msg2 = (String) request.getAttribute("msg2");
		link = (String) request.getAttribute("link");
		bname = (String) request.getAttribute("bname");
		color = (String) request.getAttribute("color");
	%>
	<main>
	<div class="container mt-1 pt-5">
			<div class="card text-center p-3 m-5">
				<h3 class="text-<%=color%> mb-3"><%=msg%></h3>
				<%
					if (msg2 != null) {
				%><p class="fs-4"><%=msg2%></p>
				<%
					}
				%>
				<%
					if (link != null) {
				%><div><a href="<%=link%>" class="btn text-white bg-themeColor2"><%=bname%></a></div>
				<%
					}
				%>
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