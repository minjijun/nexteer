<%@ page language="java" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		
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
			
		<!-- Bootstrap CSS : Signin -->
 		<link rel="stylesheet" href="/nexteer/resources/css/signin.css" type="text/css">
 				
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

		<title>넥스티어 CRM 홈페이지</title>
	</head>
	<body class="text-center">
		<main class="form-signin w-100 m-auto">
		
			<!-- login Form {s} -->
			<form:form method="post" modelAttribute="memberVO" action="${pageContext.request.contextPath}/login">
				<img class="mb-4" src="/nexteer/resources/image/logo.png" alt="" weight="166" height="39">
				<h1 class="h5 mb-3 fw-normal">로그인 하세요.</h1>
				<p>
					<font color="#ed1d24">
						<spring:hasBindErrors name="memberVO">
							<c:forEach items="${errors.globalErrors }" var="e">
								<spring:message code="${e.code }"/>
							</c:forEach>
						</spring:hasBindErrors>
					</font>
				</p>
				<div class="form-floating">
					<form:input path="member_id" class="form-control" id="floatingInput" placeholder="아이디" required="true" autofocus="true"/>
					<label for="floatingInput">Id</label>
				</div>
				<div class="form-floating">
					<form:password path="member_pwd" class="form-control" id="floatingPassword" placeholder="비밀번호" required="true"/>
					<label for="floatingPassword">Password</label>
				</div>
				
				<button class="w-100 btn btn-md btn-success" type="submit">로그인</button>
				<p class="mt-5 mb-3 text-muted">Copyright © Since 2002 NEXTEER All Rights Reserved.</p>
			</form:form>
			<!-- login Form {e} -->		
		
		</main>
	</body>
</html>