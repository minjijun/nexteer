<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Ajax URL {s} -->
<c:url var="getIdURL" value="/company/checkId"></c:url>
<c:url var="deleteURL" value="/company/deleteCompany"></c:url>
<!-- Ajax URL {e} -->

<div class="starter-template" role="main">
	<div class="card">
		<div class="card-header">회사 정보 수정</div>
		<div class="card-body">
		
			<!-- Join Form {s} -->
			<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="companyVO" onSubmit="return validate(this)" action="${pageContext.request.contextPath}/company/updateCompany">
				<input type="hidden" id="checkedId" value="False"/>
				
				<div class="form-group row mb-3">
           			<label for="company_name" class="col-md-3 col-form-label text-md-right">회사명</label>
           			<div class="col-md-6">
            			<form:input path="company_name" class="form-control" id="name" placeholder="회사명을 입력하세요." required="true" />
            		</div>
         		</div>
       			
       			<div class="form-group row mb-3">
           			<label for="company_president" class="col-md-3 col-form-label text-md-right">대표자명</label>
           			<div class="col-md-6">
            			<form:input path="company_president" class="form-control" id="president" placeholder="대표자명을 입력하세요." />
            		</div>
         			</div>
        		
        		<div class="form-group row mb-3">
          			<label for="company_business_number" class="col-md-3 col-form-label text-md-right">사업자등록번호</label>
          			<div class="col-md-4">
	            		<form:input path="company_business_number" class="form-control" id="business_number" placeholder="사업자등록번호를 입력하세요." />
	           		</div>
	           		<div class="col-md-2">
	           			<button type="button" id="checkId" class="btn btn-md btn-primary btn-block">중복검사</button>
	           		</div>
        		</div>
       			
       			<div class="form-group row mb-3">
           			<label for="company_location" class="col-md-3 col-form-label text-md-right">사업장소재지</label>
           			<div class="col-md-6">
            			<form:input path="company_location" class="form-control" id="location" placeholder="사업장소재지을 입력하세요." />
            		</div>
         			</div>
         			
         			<div class="form-group row mb-3">
           			<label for="company_website" class="col-md-3 col-form-label text-md-right">홈페이지</label>
           			<div class="col-md-6">
            			<form:input path="company_website" class="form-control" id="website" placeholder="홈페이지를 입력하세요." />
            		</div>
         			</div>
         			
         			<div class="form-group row mb-3">
           			<label for="company_phone" class="col-md-3 col-form-label text-md-right">대표번호</label>
           			<div class="col-md-6">
            			<form:input path="company_phone" class="form-control" id="phone" placeholder="대표번호를 입력하세요." />
            		</div>
         			</div>
				
				<div class="form-group row mb-3">
           			<label for="company_fax" class="col-md-3 col-form-label text-md-right">팩스번호</label>
           			<div class="col-md-6">
            			<form:input path="company_fax" class="form-control" id="fax" placeholder="팩스번호를 입력하세요." />
            		</div>
         			</div>
                   
                   <div class="form-group row mb-3">
                    <label for="company_email" class="col-md-3 col-form-label text-md-right">이메일</label>
                    <div class="col-md-6">
	                    <div class="input-group">
				            <div class="input-group-prepend">
								<span class="input-group-text">@</span>
				            </div>
				            <input type="email" name="company_email" id="email" class="form-control" placeholder="you@uniqlo.com" />
						</div>
					</div>
				</div>
		        
		        <hr class="mb-3">
		        	        
		        <div class="form-group row mb-3 text-center">
		        	<div class="col-md-2"></div>
			        <div class="col-md-4">
			        	<button class="btn btn-primary btn-lg btn-block" type="submit">수정</button>
			        </div>
			        <div class="col-md-4">
			        	<button id="btnDelete" class="btn btn-primary btn-lg btn-block" type="button">삭제</button>
			        </div>
		        </div>
	    	</form:form>
	    	<!-- Join Form {e} -->
	    	
  		</div>
	</div>
</div>
<script type="text/javascript">	
	<!-- Form Check {s} -->
	function validate(f) {
		if(!confirm("회원 정보를 수정하시겠습니까?")) return false;
	}
	<!-- Form Check {e} -->
	
	<!-- [삭제]버튼 클릭 이벤트 {s} -->
	$(document).on('click', '#btnDelete', function(e){
		e.preventDefault();
		if(!confirm("회사를 삭제하시겠습니까?")) return false;
		var url = "${deleteURL}";
		var paramData = {
				"company_index"   : $("#no").val()				
		};
		
		$.ajax({
			url : url ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == 'OK') {
					alert("회사가 삭제되었습니다.");
					//location.href="getcompanyList?main=company/companyList.jsp";
				} else {
					alert("회사가 삭제되지 않았습니다.\n관리자에게 문의하세요.");
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	});
	<!-- [삭제]버튼 클릭 이벤트 {e} -->
	
</script>