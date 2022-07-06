<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="getBusinessNumberURL" value="checkBusinessNumber"></c:url>

<article>
	<div class="container col-md-12" role="main">
		<div class="py-5 text-center">
			<h2>회사등록</h2>
			<p class="lead"></p>
		</div>
		<div class="card">
			<div class="card-body">
				<!-- Register Form {s} -->
				<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="companyVO" onSubmit="return validate(this)" action="${pageContext.request.contextPath}/company/registerCompany">
					<input type="hidden" id="checkedBusinessNumber" value="False"/>
						    				
					<div class="form-group row mb-3">
						<label for="company_name" class="col-md-3 col-form-label text-end">회사명</label>
						<div class="col-md-6">
							<form:input path="company_name" class="form-control" id="company_name" placeholder="회사명을 입력하세요." required="true" />
						</div>
					</div>
	        			
					<div class="form-group row mb-3">
						<label for="company_president" class="col-md-3 col-form-label text-end">대표자명</label>
							<div class="col-md-6">
								<form:input path="company_president" class="form-control" id="company_president" placeholder="대표자명을 입력하세요." />
						</div>
					</div>
		        		
	        		<div class="form-group row mb-3">
	          			<label for="company_business_number" class="col-md-3 col-form-label text-end">사업자등록번호</label>
	          			<div class="col-md-5">
		            		<form:input path="company_business_number" class="form-control" id="company_business_number" placeholder="사업자등록번호를 입력하세요." />
		           		</div>
		           		<div class="col-md-2">
		           			<button type="button" id="checkBusinessNumber" class="btn btn-md btn-primary btn-block">중복검사</button>
		           		</div>
	        		</div>
        			
        			<div class="form-group row mb-3">
            			<label for="company_location" class="col-md-3 col-form-label text-end">사업장소재지</label>
            			<div class="col-md-6">
	            			<form:input path="company_location" class="form-control" id="company_location" placeholder="사업장소재지를 입력하세요." />
	            		</div>
          			</div>
          			
          			<div class="form-group row mb-3">
            			<label for="company_website" class="col-md-3 col-form-label text-end">홈페이지</label>
            			<div class="col-md-6">
	            			<form:input path="company_website" class="form-control" id="company_website" value="http://" placeholder="홈페이지를 입력하세요." />
	            		</div>
          			</div>
          			
          			<div class="form-group row mb-3">
            			<label for="company_phone" class="col-md-3 col-form-label text-end">대표번호</label>
            			<div class="col-md-6">
	            			<form:input path="company_phone" class="form-control" id="company_phone" placeholder="대표번호를 입력하세요." />
	            		</div>
          			</div>
					
					<div class="form-group row mb-3">
            			<label for="company_fax" class="col-md-3 col-form-label text-end">팩스번호</label>
            			<div class="col-md-6">
	            			<form:input path="company_fax" class="form-control" id="company_fax" placeholder="팩스번호를 입력하세요." />
	            		</div>
          			</div>
	                    
                    <div class="form-group row mb-3">
	                    <label for="company_email" class="col-md-3 col-form-label text-end">이메일</label>
	                    <div class="col-md-6">
	                    	<input type="email" name="company_email" id="company_email" class="form-control" placeholder="대표이메일을 입력하세요." />
						</div>
					</div>

					<hr class="mb-3">
					
					<div class="form-group row mb-3 text-center">
					
					</div>
					
					<hr class="mb-3">
				        
					<div class="form-group row mb-3 text-center">
						<div class="col-md-2"></div>
						<div class="col-md-4">
							<button class="btn btn-primary btn-md btn-block" type="submit">회사 등록</button>
						</div>
						<div class="col-md-4">
							<button id="reset" class="btn btn-primary btn-md btn-block" type="reset">입력 취소</button>
						</div>
					</div>

	      		</form:form>
	      		<!-- Register Form {e} -->
			</div>
		</div>
			
	<footer class="my-5 pt-5 mb-5 text-muted text-center text-small">
		<p class="mb-1">Copyright © Since 2002 NEXTEER All Rights Reserved.</p>
	</footer>
	</div>
</article>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<script type="text/javascript">
	//사업자등록번호 중복검사 버튼 클릭 이벤트
	$(document).on('click', '#checkBusinessNumber', function(e) {
		var company_business_number = $("#company_business_number").val();
		if(company_business_number == '') {
			alert("사업자등록번호를 입력하세요.");
			document.form.company_business_number.focus();
			return;
		}
		var paramData = { "company_business_number"	: $("#company_business_number").val() };
		
		$.ajax({
			url : "${getBusinessNumberURL}" ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				console.log(result);
				if(result.status == "Ture") {
					if(result.dup == "NO") {
						if(!confirm(company_business_number + "는 등록 가능합니다.\n등록하시겠습니까?")) return false;
						$("#checkedBusinessNumber").val("Ture");
						$("#company_business_number").attr("readonly", true);								
					}
				} else {
					if (result.dup == "YES"){
						alert(company_business_number + "는 이미 등록 중입니다.");
						$("#company_business_number").val('');
					} else {
						alert("중복검사에 실패했습니다. 관리자에게 문의하세요.");
					}
					document.form.company_business_number.focus();
					$("#checkedBusinessNumber").val("False");
					$("#company_business_number").attr("readonly", false);							
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	});
	
	//폼 체크
	function validate(f) {
		if(f.checkedBusinessNumber.value == 'False' || f.checkedBusinessNumber.value == '') {
			alert("사업자등록번호 중복검사를 하세요.");
			return false;
		}
		
		if(!confirm("회사 등록을 하시겠습니까?")) return false;
	}
	
	// 취소 버튼 클릭 이벤트
	$(document).on('click', '#reset', function(e) {
		$("#checkedBusinessNumber").val("False");
		$("#company_business_number").attr("readonly", false);
	});
</script>