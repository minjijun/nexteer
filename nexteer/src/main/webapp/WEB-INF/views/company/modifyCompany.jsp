<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="deleteURL" value="/company/deleteCompany"></c:url>

<div class="col-lg-8 mx-auto p-3 py-md-5">
	<div class="card">
		<div class="card-header text-center"><h5>회사정보수정</h5></div>
		<div class="card-body col-md-9 mx-auto">
		
			<!-- Modify Form {s} -->
			<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="companyVO" onSubmit="return validate(this)" action="${pageContext.request.contextPath}/company/updateCompany">
				
				<div class="form-group row mb-3">
           			<label for="company_name" class="col-md-3 col-form-label text-md-right">인덱스</label>
           			<div class="col-md-6">
            			<form:input path="company_index" class="form-control" id="company_index" readonly="true" />
            		</div>
         		</div>
         		
				<div class="form-group row mb-3">
           			<label for="company_name" class="col-md-3 col-form-label text-md-right">회사명</label>
           			<div class="col-md-6">
            			<form:input path="company_name" class="form-control" id="name" placeholder="회사명을 입력하세요." required="true" />
            		</div>
         		</div>
       			
       			<div class="form-group row mb-3">
           			<label for="company_president" class="col-md-3 col-form-label text-md-right">대표자명</label>
           			<div class="col-md-6">
            			<form:input path="company_president" class="form-control" id="company_president" placeholder="대표자명을 입력하세요." />
            		</div>
         		</div>
        		
        		<div class="form-group row mb-3">
          			<label for="company_business_number" class="col-md-3 col-form-label text-md-right">사업자등록번호</label>
          			<div class="col-md-6">
	            		<form:input path="company_business_number" class="form-control" id="company_business_number" readonly="true" />
	           		</div>
        		</div>
       			
       			<div class="form-group row mb-3">
           			<label for="company_location" class="col-md-3 col-form-label text-md-right">사업장소재지</label>
           			<div class="col-md-6">
            			<form:input path="company_location" class="form-control" id="company_location" placeholder="사업장소재지를 입력하세요." />
            		</div>
         		</div>
         			
         		<div class="form-group row mb-3">
           			<label for="company_website" class="col-md-3 col-form-label text-md-right">홈페이지</label>
           			<div class="col-md-6">
            			<form:input path="company_website" class="form-control" id="company_website" placeholder="홈페이지를 입력하세요." />
            		</div>
         		</div>
         			
         		<div class="form-group row mb-3">
           			<label for="company_phone" class="col-md-3 col-form-label text-md-right">대표번호</label>
           			<div class="col-md-6">
            			<form:input path="company_phone" class="form-control" id="company_phone" placeholder="대표번호를 입력하세요." />
            		</div>
         		</div>
				
				<div class="form-group row mb-3">
           			<label for="company_fax" class="col-md-3 col-form-label text-md-right">팩스번호</label>
           			<div class="col-md-6">
            			<form:input path="company_fax" class="form-control" id="company_fax" placeholder="팩스번호를 입력하세요." />
            		</div>
         		</div>
                   
                <div class="form-group row mb-3">
					<label for="company_email" class="col-md-3 col-form-label text-md-right">이메일</label>
					<div class="col-md-6">
	                    <div class="input-group">
				            <form:input path="company_email" name="company_email" id="company_email" class="form-control" placeholder="대표이메일을 입력하세요." />
						</div>
					</div>
				</div>
		        
		        <hr class="mb-3">
		        	        
		        <div class="form-group row mb-3 text-center">
		        	<div class="col-md-2"></div>
			        <div class="col-md-4">
			        	<button class="btn btn-primary btn-sm btn-block" type="submit">수정</button>
			        </div>
			        <div class="col-md-4">
			        	<button id="btnDelete" class="btn btn-primary btn-sm btn-block" type="button">삭제</button>
			        </div>
		        </div>
	    	</form:form>
	    	<!-- Modify Form {e} -->
	    	
  		</div>
	</div>
</div>
<script type="text/javascript">	
	<!-- Form Check {s} -->
	function validate(f) {
		if(!confirm("회사 정보를 수정하시겠습니까?")) return false;
	}
	<!-- Form Check {e} -->
	
	<!-- [삭제]버튼 클릭 이벤트 {s} -->
	$(document).on('click', '#btnDelete', function(e){
		e.preventDefault();
		if(!confirm("회사를 삭제하시겠습니까?")) return false;
		var url = "${deleteURL}";
		var paramData = {
				"company_index"   : $("#company_index").val()				
		};
		
		$.ajax({
			url : url ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == 'OK') {
					alert("회사가 삭제되었습니다.");
					location.href="${pageContext.request.contextPath}/company/getCompanyList";
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