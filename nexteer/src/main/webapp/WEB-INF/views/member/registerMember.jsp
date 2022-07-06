<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="getIdURL" value="/member/checkId"></c:url>

<article>
   	<div class="container col-md-12" role="main">
 		<div class="py-4 text-center">
   			<h2>직원등록</h2>
 		</div>
  		<div class="card">
    		<div class="card-body">
    		
    			<!-- Register Member {s} -->
      			<form:form class="form-signup" name="form" id="form" role="form" method="post" modelAttribute="memberVO" onSubmit="return validate(this)" action="${pageContext.request.contextPath}/member/registerMember">
					<input type="hidden" id="checkedId" value="False"/>
					    				
          			<div class="form-group row mb-3">
            			<label for="member_name" class="col-md-3 col-form-label text-end">이름</label>
            			<div class="col-md-6">
	            			<form:input path="member_name" class="form-control" id="member_name" placeholder="이름을 입력하세요." required="true" />
	            		</div>
          			</div>
        			
        			<div class="form-group row mb-3">
	          			<label for="member_id" class="col-md-3 col-form-label text-end">아이디</label>
	          			<div class="col-md-4">
		            		<form:input path="member_id" class="form-control" id="member_id" placeholder="아이디를 입력하세요." required="true" />
		           		</div>
		           		<div class="col-md-2">
		           			<button type="button" id="checkId" class="btn btn-md btn-success btn-block">중복검사</button>
		           		</div>
	        		</div>
        			
        			<div class="form-group row mb-3">
						<label for="member_pwd" class="col-md-3 col-form-label text-end">비빌번호</label>
						<div class="col-md-6">
							<form:password path="member_pwd" class="form-control" id="member_pwd" required="true" />
						</div>
					</div>
					
					<div class="form-group row mb-3">
						<label for="pwdConfirm" class="col-md-3 col-form-label text-end">비밀번호 확인</label>
						<div class="col-md-6">
							<input type="password" name="pwdConfirm" class="form-control" id="pwdConfirm" required="true" />
						</div>
					</div>
					
					<div class="form-group row mb-3">
            			<label for="member_phone" class="col-md-3 col-form-label text-end">내선번호</label>
            			<div class="col-md-6">
	            			<form:input path="member_phone" class="form-control" id="member_phone" placeholder="내선번호를 입력하세요." />
	            		</div>
          			</div>
					
					<div class="form-group row mb-3">
						<label for="member_mobile" class="col-md-3 col-form-label text-end">휴대폰</label>
            			<div class="col-md-6">
	            			<form:input path="member_mobile" class="form-control" id="member_mobile" placeholder="휴대폰번호를 입력하세요." />
	            		</div>
                    </div>
                    
                    <div class="form-group row mb-3">
	                    <label for="email" class="col-md-3 col-form-label text-end">이메일</label>
	                    <div class="col-md-6">
		                    <input type="email" name="member_email" id="member_email" class="form-control" placeholder="you@nexteer.co.kr" />
						</div>
					</div>
					
					<div class="form-group row mb-3">
						<label for="member_position" class="col-md-3 col-form-label text-end">직급</label>
						<div class="col-md-6">
							<form:select path="member_position" id="member_position" class="form-control">
								<option value="">--선택해주세요--</option>
								<option value="대표">대표</option>
								<option value="이사">이사</option>
								<option value="프로">프로</option>
							</form:select>
						</div>
                    </div>
					
					<div class="form-group row mb-3">
						<label for="member_authority" class="col-md-3 col-form-label text-end">권한</label>
						<div class="col-md-6 g-3">
							<form:checkbox path="member_authorities" value="C" label="등록" class="form-check-input"/>
							<form:checkbox path="member_authorities" value="R" label="조회" class="form-check-input"/>                   
							<form:checkbox path="member_authorities" value="U" label="수정" class="form-check-input"/>
							<form:checkbox path="member_authorities" value="D" label="삭제" class="form-check-input"/>								
						</div>
					</div>
			        <hr class="mb-3">
			        
			        <div class="form-group row mb-3 text-center">
			        	<div class="col-md-4">
			        	</div>
				        <div class="col-md-4">
				        	<button class="btn btn-success btn-md btn-block" type="submit">직원등록</button>
				        	<button id="reset" class="btn btn-success btn-md btn-block" type="reset">입력취소</button>
				        </div>
				        <div class="col-md-4">
				        	
				        </div>
			        </div>
      			</form:form>
      			<!-- Register Member {e} -->
      			
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
	//아이디 중복검사 버튼 클릭 이벤트

	$(document).on('click', '#checkId', function(e) {
		var member_id = $("#member_id").val();
		if(member_id == '') {
			alert("아이디를 입력하세요.");
			document.form.member_id.focus();
			return;
		}
		var paramData = { "member_id"	: $("#member_id").val() };
		
		$.ajax({
			url : "${getIdURL}" ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				console.log(result);
				if(result.status == "Ture") {
					if(result.dup == "NO") {
						if(!confirm(member_id + "는 사용 가능합니다.\n사용하시겠습니까?")) return false;
						$("#checkedId").val("Ture");
						$("#member_id").attr("readonly", true);								
					}
				} else {
					if (result.dup == "YES"){
						alert(member_id + "는 이미 사용 중입니다.");
						$("#member_id").val('');
					} else {
						alert("중복검사에 실패했습니다. 관리자에게 문의하세요.");
					}
					document.form.id.focus();
					$("#checkedId").val("False");
					$("#member_id").attr("readonly", false);							
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	});
	
	//폼 체크
	function validate(f) {
		if(f.checkedId.value == 'False' || f.checkedId.value == '') {
			alert("아이디 중복검사를 하세요.");
			return false;
		}
		if(f.member_pwd.value != f.pwdConfirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.form.member_pwd.focus();
			return false;
		}
		
		if(!confirm("직원 등록을 하시겠습니까?")) return false;
	}
	
	// 취소 버튼 클릭 이벤트
	$(document).on('click', '#reset', function(e) {
		$("#checkedId").val("False");
		$("#member_id").attr("readonly", false);
	});
</script>
