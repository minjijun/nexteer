<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="container-fluid" aria-label="Main navigation">
	<button class="navbar-toggler ms-3 d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<a class="navbar-brand ps-3 m-0 " href="${pageContext.request.contextPath}/index">
		<img class="d-block mx-auto" src="${pageContext.request.contextPath}/resources/image/logo.png" alt="인덱스" width="166" height="39">
	</a>
	
	<div class="navbar-nav">
		<div class="nav-item text-nowrap">
			<a class="nav-link px-3" href="${pageContext.request.contextPath}/logout">Log out</a>
		</div>
	</div>
</nav>