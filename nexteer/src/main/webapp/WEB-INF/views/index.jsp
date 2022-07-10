<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>넥스티어 CRM 홈페이지</title>
	
	<!-- Bootstrap Icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<!-- Bootstrap CSS : sidebars, dashboard -->
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebars.css" type="text/css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css" type="text/css">
    
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<!-- Font Awesome -->
	<script src="https://kit.fontawesome.com/ae568ad905.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header -->
	<header class="navbar navbar-dark bd-navbar sticky-top bg-success">
		<jsp:include page="index_header.jsp"/>
	</header>
	
	<!-- Main -->
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 col-xl-1 col-xxl-1 d-md-block bg-light sidebar collapse">
				<jsp:include page="index_nav.jsp"/>
			</nav>
			<main class="col-md-9 col-lg-10 col-xl-11 col-xxl-11 ms-sm-auto px-md-4">
				<jsp:include page="${main }"/>
			</main>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sidebars.js"></script>
	<!-- Footer -->
</body>
</html>