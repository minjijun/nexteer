<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="getIdURL" value="/checkId"></c:url>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bootstrap CSS -->
	 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	 	<!-- Bootstrap CSS : Checkout -->
 		<style type="text/css">
 			.container { max-width: 960px; }				
			.lh-condensed { line-height: 1.25; }
			.bd-placeholder-img {
				font-size: 1.125rem;
				text-anchor: middle;
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
			}
			@media (min-width: 768px) {
				.bd-placeholder-img-lg {
					font-size: 3.5rem;
				}
			}
 		</style>
 		
		<title>직원 등록</title>
	</head>
	<body class="bg-light text-center">
		<article>
    	<div class="container col-md-12" role="main">
  			<div class="py-5 text-center">
    			<img class="d-block mx-auto mb-4" src="/nexteer/resources/image/logo.png" alt="" weight="166" height="39">
   				 <h2>직원 등록</h2>
    			 <p class="lead"></p>
  			</div>
	  		<div class="card">
	    		<div class="card-body">
	    			<!-- Join Form {s} -->
	      			<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="memberVO" action="${pageContext.request.contextPath}/register">
						<input type="hidden" id="checkedId" value="False"/>
						    				
	          			<div class="form-group row mb-3">
	            			<label for="member_name" class="col-md-3 col-form-label text-md-right">이름</label>
	            			<div class="col-md-6">
		            			<form:input path="member_name" class="form-control" id="name" placeholder="이름을 입력하세요." required="true" maxLength="30" />
		            		</div>
	          			</div>
	        			
	        			<div class="form-group row mb-3">
		          			<label for="member_id" class="col-md-3 col-form-label text-md-right">아이디</label>
		          			<div class="col-md-4">
			            		<form:input path="member_id" class="form-control" id="id" placeholder="아이디를 입력하세요." required="true" maxLength="30"/>
			           		</div>
			           		<div class="col-md-2">
			           			<button type="button" id="checkId" class="btn btn-md btn-primary btn-block">중복검사</button>
			           		</div>
		        		</div>
	        			
	        			<div class="form-group row mb-3">
							<label for="member_pwd" class="col-md-3 col-form-label text-md-right">비빌번호</label>
							<div class="col-md-6">
								<form:password path="member_pwd" class="form-control" id="pwd" required="true" maxLength="20"/>
							</div>
						</div>
						
						<div class="form-group row mb-3">
							<label for="pwdConfirm" class="col-md-3 col-form-label text-md-right">비밀번호 확인</label>
							<div class="col-md-6">
								<input type="password" name="pwdConfirm" class="form-control" id="pwdConfirm" required="true" maxLength="20" />
							</div>
						</div>
						
						<div class="form-group row mb-3">
	            			<label for="member_phone" class="col-md-3 col-form-label text-md-right">내선번호</label>
	            			<div class="col-md-6">
		            			<form:input path="member_phone" class="form-control" id="phone" placeholder="내선번호를 입력하세요." required="true" maxLength="30" />
		            		</div>
	          			</div>
						
						<div class="form-group row mb-3">
							<label for="mobile" class="col-md-3 col-form-label text-md-right">휴대폰</label>
							<div class="col-md-2">
								<select id="mobileStNo" name="mobileStNo" class="form-control" size="1" title="휴대폰번호 국번선택">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							&nbsp;-&nbsp;
							<div class="col-md-2">
	                    		<input type="number" name="mobileMdNo" id="mobileMdNo" class="form-control" title="휴대폰 중간번호" required="true" maxlength="4">
	                    	</div>
							&nbsp;-&nbsp;
	                    	<div class="col-md-2">
	                    		<input type="number" name="mobileEdNo" id="mobileEdNo" class="form-control" title="휴대폰 끝번호" required="true" maxlength="4">
	                    	</div>
	                    	<input type="hidden" name="member_mobile" id="mobile">
	                    </div>
	                    
	                    <div class="form-group row mb-3">
		                    <label for="email" class="col-md-3 col-form-label text-md-right">이메일</label>
		                    <div class="col-md-6">
			                    <div class="input-group">
						            <div class="input-group-prepend">
										<span class="input-group-text">@</span>
						            </div>
						            <input type="email" name="member_email" id="email" class="form-control" placeholder="you@uniqlo.com" required="true" maxLength="50"/>
								</div>
							</div>
						</div>
						
						<div class="form-group row mb-3">
							<label for="member_position" class="col-md-3 col-form-label text-md-right">직급</label>
							<div class="col-md-2">
								<form:select path="member_position" id="position" class="form-control" required="true">
									<option value="">--선택해주세요--</option>
									<option value="대표">대표</option>
									<option value="이사">이사</option>
									<option value="프로">프로</option>
								</form:select>
							</div>
	                    </div>
						
						<div class="form-group row mb-3">
							<label for="member_authority" class="col-md-3 col-form-label text-md-right">권한</label>
							<div class="col-md-6">
								<form:checkbox path="member_authorities" value="C" label="등록" class="form-control"/>
								<form:checkbox path="member_authorities" value="R" label="조회" class="form-control"/>                   
								<form:checkbox path="member_authorities" value="U" label="수정" class="form-control"/>
								<form:checkbox path="member_authorities" value="D" label="삭제" class="form-control"/>								
							</div>
						</div>
				        <hr class="mb-3">
				        
				        <div class="form-group row mb-3 text-center">
				        	<div class="col-md-2">
				        	</div>
					        <div class="col-md-4">
					        	<button class="btn btn-primary btn-lg btn-block" type="submit">직원 등록</button>
					        </div>
					        <div class="col-md-4">
					        	<button id="reset" class="btn btn-primary btn-lg btn-block" type="reset">취소</button>
					        </div>
				        </div>
	      			</form:form>
	      			<!-- Join Form {e} -->
	    		</div>
	  		</div>
			
			<footer class="my-5 pt-5 mb-5 text-muted text-center text-small">
				<p class="mb-1">© 2022</p>
			</footer>
		</div>
		</article>
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		
		<!-- Bootstrap Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script type="text/javascript">
			//아이디 중복검사 버튼 클릭 이벤트
			<!--
			$(document).on('click', '#checkId', function(e) {
				var id = $("#id").val();
				if(id == '') {
					alert("아이디를 입력하세요.");
					document.form.id.focus();
					return;
				}
				var paramData = { "id"	: $("#id").val() };
				
				$.ajax({
					url : "${getIdURL}" ,
					type : "POST" ,
					dataType : "json" ,
					data : paramData ,
					success : function(result){
						console.log(result);
						if(result.status == "Ture") {
							if(result.dup == "NO") {
								if(!confirm(id + "는 사용 가능합니다.\n사용하시겠습니까?")) return false;
								$("#checkedId").val("Ture");
								$("#id").attr("readonly", true);								
							}
						} else {
							if (result.dup == "YES"){
								alert(id + "는 이미 사용 중입니다.");
								$("#id").val('');
							} else {
								alert("중복검사에 실패했습니다. 관리자에게 문의하세요.");
							}
							document.form.id.focus();
							$("#checkedId").val("False");
							$("#id").attr("readonly", false);							
						}
					},
					error: function(request, status, error) {
			 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 		}
				});
			});
			
			//폼 체크
			function validate(f) {
				alert("f.checkedId.value:"+f.checkedId.value);
				if(f.checkedId.value == 'False' || f.checkedId.value == '') {
					alert("아이디 중복검사를 하세요.");
					return false;
				}
				if(f.pwd.value != f.pwdConfirm.value) {
					alert("비밀번호가 일치하지 않습니다.");
					document.form.pwd.focus();
					return false;
				}
				if(((f.mobileMdNo.value.length == 4) && f.mobileMdNo.value > 0) && (f.mobileEdNo.value.length == 4 && f.mobileEdNo.value > 0)) {
					$("#mobile").val($("#mobileStNo option:selected").val() + '-' + f.mobileMdNo.value + '-' + f.mobileEdNo.value); 
				} else {
					alert("잘못된 휴대폰 번호를 입력하셨습니다.");
					return false;
				}
				if(f.mobile.value == '') {
					alert("휴대폰 번호를 입력하세요.");
					return false;
				}
				if(!confirm("회원 등록을 하시겠습니까?")) return false;
			}
			-->
			// 취소 버튼 클릭 이벤트
			$(document).on('click', '#reset', function(e) {
				$("#checkedId").val("False");
				$("#id").attr("readonly", false);
			});
		</script>
	</body>
</html>
