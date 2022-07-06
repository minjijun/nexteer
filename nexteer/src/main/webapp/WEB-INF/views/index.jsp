<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>넥스티어 CRM 홈페이지</title>
	
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<!-- Bootstrap CSS : sidebars, dashboard -->
 	<link rel="stylesheet" href="/nexteer/resources/css/sidebars.css" type="text/css">
 	<link rel="stylesheet" href="/nexteer/resources/css/dashboard.css" type="text/css">
 		
	<style>
	.bd-placeholder-img {
	  font-size: 1.125rem;
	  text-anchor: middle;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  user-select: none;
	}
	
	@media (min-width: 768px) {
	  .bd-placeholder-img-lg {
	    font-size: 3.5rem;
	  }
	}
	
	.b-example-divider {
	  height: 3rem;
	  background-color: rgba(0, 0, 0, .1);
	  border: solid rgba(0, 0, 0, .15);
	  border-width: 1px 0;
	  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
	}
	
	.b-example-vr {
	  flex-shrink: 0;
	  width: 1.5rem;
	  height: 100vh;
	}
	
	.bi {
	  vertical-align: -.125em;
	  fill: currentColor;
	}
	
	.nav-scroller {
	  position: relative;
	  z-index: 2;
	  height: 2.75rem;
	  overflow-y: hidden;
	}
	
	.nav-scroller .nav {
	  display: flex;
	  flex-wrap: nowrap;
	  padding-bottom: 1rem;
	  margin-top: -1px;
	  overflow-x: auto;
	  text-align: center;
	  white-space: nowrap;
	  -webkit-overflow-scrolling: touch;
	}
	</style>
    
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header -->
	<header class="navbar navbar-dark sticky-top bg-success flex-md-nowrap p-0 shadow">
		<jsp:include page="index_header.jsp"/>
	</header>
	
	<!-- Main -->
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu" class="col-lg-2 d-md-block bg-light sidebar collapse">
				<jsp:include page="index_nav.jsp"/>
			</nav>
			<main class="ms-sm-auto col-lg-10 px-md-4">
				<jsp:include page="${main }"/>
			</main>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
	<script src="/nexteer/resources/js/sidebars.js"></script>
	<!-- Footer -->
</body>
</html>