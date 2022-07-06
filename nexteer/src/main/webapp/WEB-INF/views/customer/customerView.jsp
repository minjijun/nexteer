<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<c:url var="registerCalllogURL" value="registerCalllog1"></c:url>
<c:url var="updateScriptURL" value="updateScript"></c:url>
<c:url var="registerProposalHistoryURL" value="registerProposalHistory"></c:url>

<div class="container">
	<input type="hidden" id="company_index">
	
	<div class="p-4 p-md-3 mb-3 rounded bg-light">
		<div class="row g-3">
			<div class="col-sm-3">
				<label for="member_index" class="form-label">우리담당자</label>
				<select id="member_index" name="member_index" class="form-select form-select-md">
					<c:forEach items="${listMemberVO }" var="listMember">
						<option value="${listMember.member_index}">${listMember.member_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-3">
				<label for="proposal_history_suggested_product" class="form-label">제안제품</label>
				<input type="text" class="form-control" id="proposal_history_suggested_product">
			</div>
			<div class="col-sm-6">
				<label for="company_name" class="form-label">거래처명</label>
				<input type="text" class="form-control" id="company_name" readonly="true">
			</div>
			<div class="col-sm-3">
				<label for="company_customer_index" class="form-label">담당자명</label>
				<select id="company_customer_index" name="company_customer_index" class="form-select form-select-md" onchange="chageSelect()">
				</select>
			</div>
			<div class="col-sm-3">
				<label for="company_customer_position" class="form-label">직급</label>
				<input type="text" class="form-control" id="company_customer_name" readonly="true">
			</div>	
			<div class="col-sm-3">
				<label for="member_name" class="form-label">내선번호</label>
				<input type="text" class="form-control" id="company_customer_phone" readonly="true">
			</div>
			<div class="col-sm-3">
				<label for="company_customer_email" class="form-label">이메일</label>
				<input type="text" class="form-control" id="company_customer_email" readonly="true">
			</div>
			<div class="col-sm-3">
				<label for="company_customer_name" class="form-label">제안서전송일자</label>
				<input type="text" class="form-control" id="proposal_history_job_date1" readonly="true">
			</div>		
			<div class="col-sm-3">
				<label for="member_name" class="form-label">견적서전송일자</label>
				<input type="text" class="form-control" id="proposal_history_job_date2" readonly="true">
			</div>
			<div class="col-sm-3">
				<label for="proposal_history_job_date3" class="form-label">최종통화일자</label>
				<input type="text" class="form-control" id="proposal_history_job_date3" readonly="true">
			</div>
		</div>
	</div>
  <div class="row mb-2">
    <div class="col-md-12">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col-md-6 p-3 d-flex flex-column position-static">
         	<div class="list-group w-auto overflow-auto" id="callogList" style="height: 270px;">
			</div>
        </div>
        <div class="col-md-6 p-3 d-flex flex-column position-static">
        	<input type="hidden" id="calllog_index" />
        	<textarea class="form-control mb-3" id="calllog_call_contents" cols="100" rows="4"></textarea>
        	<div class="row item-end gy-2">
	        	<div class="col-md-6">
	        		<button id="reset" class="w-100 btn btn-md btn-success" type="reset">입력</button>
	        	</div>
	        	<div class="col-md-6">
	        		<button id="saveCalllog" type="button" class="w-100 btn btn-md btn-success">저장</button>
	        	</div>
	        	<div class="col-md-6">
		  		<button onClick="saveProposalHistory(1)" class="w-100 btn btn-md btn-warning" type="button">제안서전송</button>
		  	</div>
			<div class="col-md-6">
			  <button onClick="saveProposalHistory(2)" class="w-100 btn btn-md btn-info" type="button">견적서전송</button>
			 </div>	        	
	        </div>
      </div>
    </div>
	        	
	        	
	        </div>
	      
	        
	        
      </div>
      
      <div class="row mb-2">
    <div class="col-md-12">
    	<ul class="nav nav-tabs">
    		<li class="nav-item col-md-2" role="presentation">
			    <button class="nav-link active" id="member_script1-tab" data-bs-toggle="tab" data-bs-target="#member_script1-tab-pane" type="button" role="tab" aria-controls="member_script1-tab-pane" aria-selected="true">1차 콜스크립트</button>
			  </li>
			  <li class="nav-item col-md-2" role="presentation">
			    <button class="nav-link" id="member_script2-tab" data-bs-toggle="tab" data-bs-target="#member_script2-tab-pane" type="button" role="tab" aria-controls="member_script2-tab-pane" aria-selected="false">2차 콜스크립트</button>
			  </li>
			  <li class="btn-group col-md-6"></li>
			  <li class="btn-group col-md-2">
				<button id="saveScript" type="button" class="w-50 btn btn-md btn-success">스크립트 저장</button>
			  </li>
		</ul>
		
		<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade show active" id="member_script1-tab-pane" role="tabpanel" aria-labelledby="member_script1-tab" tabindex="0">
				<textarea id="member_script1" name="content" cols="100" rows="15" class="form-control editor"></textarea>
		  </div>
		  <div class="tab-pane fade" id="member_script2-tab-pane" role="tabpanel" aria-labelledby="member_script2-tab" tabindex="0">
		  		<textarea id="member_script2" name="content" cols="100" rows="15" class="form-control editor"></textarea>
		  </div>
		</div>
    </div>
    
  </div>

  
</div>

<!-- <script src="https://appsforoffice.microsoft.com/lib/1/hosted/Office.js" type="text/javascript"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/nexteer/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	var today = "";
	var yymmdd = new Date();
	var month = "";
	var date = "";
	if(yymmdd.getMonth()<10) {
		month = "0" + (yymmdd.getMonth() + 1);
	} else {
		month = yymmdd.getMonth() + 1;
	}
	if(yymmdd.getDate()<10) {
		date = "0" + yymmdd.getDate();
	} else {
		date = yymmdd.getDate();
	}
	var today = yymmdd.getFullYear() + '-' + month + '-' + date;
	
	$(document).on('click', '#reset', function(e){
		$("#calllog_index").val(null);
		$("#calllog_call_contents").val("");
		$("#calllog_call_contents").attr("readonly", false);
		$("#calllog_call_contents").focus();
	});
	
	$(document).on('click', '#saveCalllog', function(e){
		var paramData = "";
		var company_index = localStorage.getItem("company_index");
		var selectList = document.getElementById("member_index");
		var member_index = selectList.options[selectList.selectedIndex].value;
		selectList = document.getElementById("company_customer_index");
		var company_customer_index = selectList.options[selectList.selectedIndex].value;
		var calllog_call_date = today;
		var calllog_call_contents = $("#calllog_call_contents").val();
		
		if($("#calllog_index").val() == "" || $("#calllog_index").val() == null) {
			paramData = { "company_index" : company_index,
					  "member_index" : member_index,
					  "company_customer_index" : company_customer_index,
					  "calllog_call_date" : calllog_call_date,
					  "calllog_call_contents" : calllog_call_contents }
			
		} else {
			var calllogVO = JSON.parse(localStorage.getItem("calllogVO"));
			paramData = { "calllog_index" : calllogVO.calllog_index,
						  "company_index" : calllogVO.company_index,
						  "member_index" : calllogVO.member_index,
						  "company_customer_index" : calllogVO.company_customer_index,
						  "calllog_call_date" : calllogVO.calllog_call_date,
						  "calllog_call_contents" : calllogVO.calllog_call_contents }
		}
		
		paramData = JSON.stringify(paramData);
			
		$.ajax({
			url : "${registerCalllogURL}",
			type : "POST" ,
			contentType : "application/json",
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == "True") {
					var html = "";
					$("#callogList").empty();
					result.listCalllogVO.forEach(function(e) {
						html += '<a href="#" onclick="getCalllog('+ e.calllog_index + ')" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">';
						html += '<div class="d-flex gap-2 w-100 justify-content-between">';
						html += '<div class="col-md-2">';
					    html += e.member_name;
					    html += '</div>';
					    html += '<div class="col-md-8">';
					    html += '<p class="d-inline-block mb-0 opacity-75 text-truncate" style="max-width: 300px;">' + e.calllog_call_contents + '</p>';
					    html += '</div>';
					    html += '<small class="opacity-50 text-nowrap">' + e.calllog_call_date + '</small>';
				    	html += '</div>';
				    	html += '</a>';
					});
					$("#callogList").html(html);
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
		
		saveProposalHistory(3);
	});
	
	$(document).on('click', '#saveScript', function(e){
		var member_index = selectList.options[selectList.selectedIndex].value;
		selectList = document.getElementById("company_customer_index");
		var member_script1 = $("#member_script1").val()
		var member_script2 = $("#member_script2").val()
		
		var paramData = { "member_index" : member_index,
				  "member_script1" : member_script1,
				  "member_script2" : member_script1 }
		
		paramData = JSON.stringify(paramData);
			
		$.ajax({
			url : "${updateScriptURL}",
			type : "POST" ,
			contentType : "application/json",
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == "True") {
					$("#member_script1").val(result.memberVO.member_script1)
					$("#member_script2").val(result.memberVO.member_script2)
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	});
	
	function chageSelect() {
		var listCompanyCustomerVO = JSON.parse(localStorage.getItem("listCompanyCustomerVO"));
		var selectList = document.getElementById("company_customer_index");
		listCompanyCustomerVO.forEach(function(list) {
			if(selectList.options[selectList.selectedIndex].value == list.company_customer_index){
				$("#company_customer_position").val(list.company_customer_position);
				$("#company_customer_phone").val(list.company_customer_phone);
				$("#company_customer_email").val(list.company_customer_email);
			}
 		});
	}
	
	function saveProposalHistory(type) {
		var proposal_history_suggested_product = $("#proposal_history_suggested_product").val()
		var selectList = document.getElementById("company_customer_index");
		var company_customer_index = selectList.options[selectList.selectedIndex].value
		selectList = document.getElementById("member_index");
		var member_index = $("#member_index").val()
		var proposal_history_job = ""
		if(type == 1) {
			proposal_history_job = "제안서 메일 전송"
		} else if(type == 2) {
			proposal_history_job = "견적서 메일 전송"
		} else {
			proposal_history_job = "통화"
		}
		var proposal_history_job_date = today;
		
		var paramData = { "proposal_history_suggested_product" : proposal_history_suggested_product,
				  "company_customer_index" : company_customer_index,
				  "member_index" : member_index,
				  "proposal_history_job" : proposal_history_job,
				  "proposal_history_job_date" : proposal_history_job_date }
		
		paramData = JSON.stringify(paramData);
		
		$.ajax({
			url : "${registerProposalHistoryURL}",
			type : "POST" ,
			contentType : "application/json",
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == "True") {
					$("#proposal_history_job_date1").val(result.proposalHistoryVO.proposal_history_job_date1)
					$("#proposal_history_job_date2").val(result.proposalHistoryVO.proposal_history_job_date2)
					$("#proposal_history_job_date3").val(result.proposalHistoryVO.proposal_history_job_date3)
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	}
</script>

