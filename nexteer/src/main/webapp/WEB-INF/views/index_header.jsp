<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="getURL" value="/nexteer/member/logout"></c:set>


	<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Nexteer</a>
	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
	<div class="navbar-nav">
		<div class="nav-item text-nowrap">
			<a class="nav-link px-3" href="logout">Log out</a>
		</div>
	</div>


<script>
function logout() {
	$.ajax({
		url : "${getURL}" ,
		type : "POST" ,
		dataType : "json" ,
		success: function(result) {
			alert("result");
			location.href = result.url;
		}
	});	
}
</script>