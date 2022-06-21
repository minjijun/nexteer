<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Ajax URL {s} -->
<c:url var="getIdURL" value="/member/checkId"></c:url>
<c:url var="deleteURL" value="/member/deleteMember"></c:url>
<!-- Ajax URL {e} -->

<div class="starter-template" role="main">
	<div class="card">
		<div class="card-header">직원 정보 수정</div>
		<div class="card-body">
		
			<!-- Join Form {s} -->
			<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="memberVO" onSubmit="return validate(this)" action="${pageContext.request.contextPath}/member/updateMember">
				<input type="hidden" id="checkedId" value="False"/>
				
				<div class="form-group row mb-3">
					<label for="no" class="col-md-3 col-form-label text-md-right">직원번호</label>
	          		<div class="col-md-6">
	           			<form:input path="member_index" class="form-control" id="no" readonly="true" />
	           		</div>
	        	</div>
				    				
				<div class="form-group row mb-3">
					<label for="name" class="col-md-3 col-form-label text-md-right">이름</label>
					<div class="col-md-6">
	           			<form:input path="member_name" class="form-control" id="name" placeholder="이름을 입력하세요." required="true" maxLength="30" />
	           		</div>
				</div>
	      			
				<div class="form-group row mb-3">
					<label for="id" class="col-md-3 col-form-label text-md-right">아이디</label>
					<div class="col-md-6">
	            		<form:input path="member_id" class="form-control" id="id" readonly="true"/>
	           		</div>
	       		</div>
	      			
	      		<div class="form-group row mb-3">
					<label for="pwd" class="col-md-3 col-form-label text-md-right">비빌번호</label>
					<div class="col-md-6">
						<form:password path="member_pwd" class="form-control" id="pwd" placeholder="새로운 비밀번호를 입력하세요." required="true" maxLength="20"/>
					</div>
				</div>
				
				<div class="form-group row mb-3">
					<label for="pwdConfirm" class="col-md-3 col-form-label text-md-right">비밀번호 확인</label>
					<div class="col-md-6">
						<input type="password" name="pwdConfirm" class="form-control" id="pwdConfirm" placeholder="비밀번호 확인을 입력하세요." required="true" maxLength="20" />
					</div>
				</div>
				
				<div class="form-group row mb-3">
					<label for="member_phone" class="col-md-3 col-form-label text-md-right">내선번호</label>
					<div class="col-md-6">
						<form:input path="member_phone" class="form-control" id="phone" placeholder="내선번호를 입력하세요." required="true" maxLength="30" />
					</div>
				</div>
				
				<div class="form-group row mb-3">
					<label for="member_mobile" class="col-md-3 col-form-label text-md-right">휴대폰</label>
					<form:input path="member_mobile" class="form-control" id="mobile" placeholder="휴대폰번호를 입력하세요." required="true" maxLength="30" />
				</div>
	                  
				<div class="form-group row mb-3">
					<label for="member_email" class="col-md-3 col-form-label text-md-right">이메일</label>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">@</span>
							</div>
							<form:input type="email" path="member_email" id="email" class="form-control" placeholder="you@uniqlo.com" maxLength="50" required="true" />
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
						<form:checkbox path="member_authorities" value="C" label="등록" class="form-check-input"/>
						<form:checkbox path="member_authorities" value="R" label="조회" class="form-check-input"/>                   
						<form:checkbox path="member_authorities" value="U" label="수정" class="form-check-input"/>
						<form:checkbox path="member_authorities" value="D" label="삭제" class="form-check-input"/>
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
		if(f.pwd.value != f.pwdConfirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.form.pwd.focus();
			return false;
		}
		if(f.mobileMdNo.value != '' && f.mobileEdNo.value != '') {
			$("#mobile").val($("#mobileStNo option:selected").val() + '-' + f.mobileMdNo.value + '-' + f.mobileEdNo.value); 
		}
		if(f.mobile.value == '') {
			alert("휴대폰 번호를 입력하세요.");
			return false;
		}
		if(!confirm("회원 정보를 수정하시겠습니까?")) return false;
	}
	<!-- Form Check {e} -->
	
	<!-- [삭제]버튼 클릭 이벤트 {s} -->
	$(document).on('click', '#btnDelete', function(e){
		e.preventDefault();
		if(!confirm("회원을 삭제하시겠습니까?")) return false;
		var url = "${deleteURL}";
		var paramData = {
				"member_index"   : $("#no").val()				
		};
		
		$.ajax({
			url : url ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == 'OK') {
					alert("회원이 삭제되었습니다.");
					//location.href="getMemberList?main=member/memberList.jsp";
				} else {
					alert("회원이 삭제되지 않았습니다.\n관리자에게 문의하세요.");
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	});
	<!-- [삭제]버튼 클릭 이벤트 {e} -->
	
</script>