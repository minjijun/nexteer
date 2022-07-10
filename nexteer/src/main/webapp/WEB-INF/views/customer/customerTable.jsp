<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css" rel="stylesheet">

<script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table-locale-all.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.20.2/dist/extensions/export/bootstrap-table-export.min.js"></script>

<c:url var="getCalllogListURL" value="getCalllogList"></c:url>
<c:url var="getCalllogURL" value="getCalllog"></c:url>
<c:url var="apiserchURL" value="/api/search"></c:url>
<c:url var="getCustomerURL" value="getCustomer"></c:url>
<c:url var="getCompanyURL" value="getCompany"></c:url>

<style>
  select.form-select {
    display: inline-block;
    width: 150px;
  }
</style>

<!-- List -->
<div class="card mt-5">
	<div class="card-header text-center fs-5">고객목록조회</div>
	<div class="card-body">
		<div class="table-responsive">
			<!-- filter -->
			<form id="toolbar" class="d-flex flex-row">
				<div class="d-flex me-2">
					<label for="filter_member_name" class="col-form-label pe-2">우리담당자</label>
					<select id="filter_member_name" class="form-select form-select-md">
					</select>
				</div>
				<div class="d-flex me-2">
					<label for="filter_proposal_history_suggested_product" class="col-form-label pe-2">제안제품</label>
					<select id="filter_proposal_history_suggested_product" class="form-select form-select-md">
						<option value="%">전체</option>
						<option value="T4">T4</option>
						<option value="OK">OK</option>
					</select>
				</div>
				<div class="">
					<button id="삭제" class="btn btn-success" disabled><i class="fa-solid fa-trash-can"></i> 삭제</button>
				</div>
			</form>
			
			<table
				id="table"
				data-locale="ko-KR"
				data-classes="table table-borderless table-striped table-md"
				data-toggle="table"
				data-height="800"
				data-toolbar="#toolbar"
				data-buttons-class="success"
				data-show-columns="true"
				data-show-columns-toggle-all="true"
				data-minimum-count-columns="3"
				data-show-refresh="true"				
				data-show-fullscreen="true"
				data-search="true"
				data-show-search-button="false"
				data-show-search-clear-button="true"
				data-search-highlight="true"
				data-click-to-select="true"
				data-loading-template="loadingTemplate"
				data-show-pagination-switch="true"
				data-pagination="true"
				data-pagination-h-align="left"
  				data-pagination-detail-h-align="right"
				data-maintain-meta-data="true"
				data-url="${pageContext.request.contextPath}/customer/getCustomerList"
				data-response-handler="responseHandler">
				<thead>
					<tr>
						<th data-width="5px" data-field="state" data-align="center" data-checkbox="true"></th>
						<th data-width="10px" data-field="company_index" data-align="center" data-sortable="true" data-sort-name="company_index" data-sort-order="desc" data-searchable="false">회사<br>인덱스</th>
						<th data-width="20px" data-field="member_name" data-align="center" data-searchable="false">우리<br>담당자</th>
						<th data-width="150px" data-field="company_name" data-halign="center" data-searchable="true" data-sortable="true" data-search-highlight-formatter="customSearchFormatter" data-formatter="operateFormatter" data-events="operateEvents">거래처명</th>
						<th data-width="15px" data-field="company_customer_name" data-align="center" data-searchable="true" data-search-highlight-formatter="customSearchFormatter">담당자</th>
						<th data-width="15px" data-field="company_customer_position" data-align="center" data-searchable="false">직급</th>
						<th data-width="10px" data-field="proposal_history_suggested_product" data-align="center" data-searchable="false">제안<br>제품</th>
						<th data-width="20px" data-field="proposal_history_job_date1" data-align="center" data-sortable="true" data-searchable="false">제안서</th>
						<th data-width="20px" data-field="proposal_history_job_date2" data-align="center" data-sortable="true" data-searchable="false">견적서</th>
						<th data-width="20px" data-field="proposal_history_job_date3" data-align="center" data-sortable="true" data-searchable="false">최종통화</th>								
						<th data-width="100px" data-field="company_customer_phone" data-halign="center" data-searchable="true" data-search-highlight-formatter="customSearchFormatter">연락처</th>
						<th data-width="100px" data-field="company_customer_email" data-halign="center" data-searchable="true" data-search-highlight-formatter="customSearchFormatter">이메일</th>
						<th data-width="50px" data-field="company_region" data-align="center" data-searchable="false">지역</th>
						<th data-width="200px" data-field="company_location" data-halign="center" data-searchable="true" data-search-highlight-formatter="customSearchFormatter">주소</th>								
						<th data-width="80px" data-field="company_business_number" data-align="center" data-searchable="true" data-search-highlight-formatter="customSearchFormatter">사업자<br>번호</th>							
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>

<c:url var="registerCalllogURL" value="registerCalllog1"></c:url>
<c:url var="updateScriptURL" value="updateScript"></c:url>
<c:url var="registerProposalHistoryURL" value="registerProposalHistory"></c:url>

<!-- Full screen modal -->
<div class="modal fade" id="fullscreenModal" aria-hidden="true" aria-labelledby="fullscreenModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable modal-fullscreen">
		<div class="modal-content">
			<div class="modal-header container">
				<div class="col-3">
					<a class="link-secondary" href="#" data-bs-target="#companyModal" data-bs-toggle="modal">회사정보</a>
					<a class="link-secondary" href="#" data-bs-target="#companyCustomerModal" data-bs-toggle="modal">담당자정보</a>
				</div>
				<div class="col-6 text-center">
					<p class="blog-header-logo modal-title text-dark" id="fullscreenModalLabel"></p>
				</div>
				<button type="button" class="btn-close me-1" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
									<div class="list-group w-auto overflow-auto" id="callogList" style="height: 270px;"></div>
								</div>
		`						<div class="col-md-6 p-3 d-flex flex-column position-static">
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
									<textarea id="member_script1" name="content" cols="100" rows="15" class="form-control"></textarea>
								</div>
								<div class="tab-pane fade" id="member_script2-tab-pane" role="tabpanel" aria-labelledby="member_script2-tab" tabindex="0">
									<textarea id="member_script2" name="content" cols="100" rows="15" class="form-control"></textarea>
								</div>
							</div>
					    </div>
					</div>  
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
let $table = $('#table')
let $fullscreenModal = $('#fullscreenModal')
let $filter1 = $('#filter_member_name')
let $filter2 = $('#filter_proposal_history_suggested_product')
let drawCount = 0
let array1 = []
let array2 = ['T4','OK']

function responseHandler(res) {
	if(drawCount < 1) drawFilter1(res)
	return res
}

function loadingTemplate(message) {
	return '<i class="fa fa-spinner fa-spin fa-fw fa-2x"></i>'
}
  
function drawFilter1(res) {
	let html = '<option value="%">전체</option>'
	let html1 = '<option value="%">전체</option>'
	$.each(res.listMemberVO, function (i, item) {
    	array1.push(item.member_name)
		html += '<option value="' + item.member_name + '">' + item.member_name + '</option>'
		html1 += '<option value="' + item.member_index + '">' + item.member_name + '</option>'
	})
	$filter1.html(html)
	$("#member_index").html(html1)
	drawCount++
}

function getFilter() {
	let value1 = $filter1.val()
	let value2 = $filter2.val()
	let filter = new Map();
	let filter1 = []
	let filter2 = []
	if(value1 == "%") {
		filter.set('filter1', array1)
	} else {
		filter.set('filter1', value1)
	}
	if(value2 == "%") {
		filter.set('filter2', array2)
	} else {
		filter.set('filter2', value2)
	}
	return filter
}

window.customSearchFormatter = function(value, searchText) {
	return value.toString().replace(new RegExp('(' + searchText + ')', 'gim'), '<span style="background-color: yellow; border-radius:5px">$1</span>')
}

function operateFormatter(value, row, index) {
	return [
		'<a href="#" class="modalLink" data-bs-toggle="modal" data-bs-target="#fullscreenModal" data-bs-whatever="'+ value +'" data-bs-whatever1="'+ row.company_index +'" data-bs-whatever2="' + row.member_index + '">'+ value +'</a>'
	].join('')
}

let fullscreenModal = document.getElementById('fullscreenModal')
window.operateEvents = {
	'click .modalLink': function (e, value, row, index) {
		localStorage.setItem("company_index", row.company_index)

		fullscreenModal.querySelector('.modal-title').textContent = row.company_name
		fullscreenModal.querySelector('#calllog_call_contents').value = ""
		
		var paramData = { "company_index"	: row.company_index,
			  			  "member_name" : row.member_name };
		
	  	$.ajax({
			url : "${getCustomerURL}" ,
			type : "POST" ,
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == "True") {
					result.customerVO.forEach(function(e) {
						fullscreenModal.querySelector('.modal-body #member_index').value = e.member_index
						fullscreenModal.querySelector('.modal-body #proposal_history_suggested_product').value = e.proposal_history_suggested_product
						fullscreenModal.querySelector('.modal-body #company_name').value = e.company_name
						fullscreenModal.querySelector('.modal-body #company_customer_index').value = e.company_customer_index
						fullscreenModal.querySelector('.modal-body #company_customer_phone').value = e.company_customer_phone
						fullscreenModal.querySelector('.modal-body #company_customer_email').value = e.company_customer_email
						fullscreenModal.querySelector('.modal-body #proposal_history_job_date1').value = e.proposal_history_job_date1
						fullscreenModal.querySelector('.modal-body #proposal_history_job_date2').value = e.proposal_history_job_date2
						fullscreenModal.querySelector('.modal-body #proposal_history_job_date3').value = e.proposal_history_job_date3
					});
			 		html = "";
			 		$("#company_customer_index").empty();
			 		localStorage.setItem("listCompanyCustomerVO", JSON.stringify(result.listCompanyCustomerVO));
			 		result.listCompanyCustomerVO.forEach(function(list) {
			 			html += '<option value="' + list.company_customer_index + '">' + list.company_customer_name + '</option>';
			 		});
			 		$("#company_customer_index").append(html);
			 		
			 		html = "";
					result.listCalllogVO.forEach(function(e) {
						html += '<a href="#" onclick="getCalllog('+ e.calllog_index + ')" class="list-group-item list-group-item-success list-group-item-action d-flex gap-3 py-3" aria-current="true">';
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
					
					fullscreenModal.querySelector('#member_script1').value = result.memberVO.member_script1
					fullscreenModal.querySelector('#member_script2').value = result.memberVO.member_script1
				} else {
												
				}
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}

function getCalllog(calllog_index) {
	var paramData = { "calllog_index"	: calllog_index };
	
	$.ajax({
		url : "${getCalllogURL}" ,
		type : "POST" ,
		dataType : "json" ,
		data : paramData ,
		success : function(result){
			if(result.status == "True") {
				localStorage.setItem("calllogVO", JSON.stringify(result.calllogVO))
				fullscreenModal.querySelector('#calllog_index').value = result.calllogVO.calllog_index
				fullscreenModal.querySelector('#calllog_call_contents').value = result.calllogVO.calllog_call_contents
				if(result.calllogVO.member_index == member_index) {
					$("#calllog_call_contents").attr("readonly", false);
				} else {
					$("#calllog_call_contents").attr("readonly", true);
				}
				
			} else {
							
			}
		},
		error: function(request, status, error) {
 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		}
	});
}

fullscreenModal.addEventListener('closed.bs.alert', event => {
	localStorage.clear()
})

$(function() {
    $filter1.change(function () {
    	let filter = getFilter()
    	$table.bootstrapTable('filterBy', {
    		member_name : filter.get('filter1'),
    		proposal_history_suggested_product : filter.get('filter2')
		})
	})
	$filter2.change(function () {
    	let filter = getFilter()
    	$table.bootstrapTable('filterBy', {
    		member_name : filter.get('filter1'),
    		proposal_history_suggested_product : filter.get('filter2')
		})
	})
	$table.bootstrapTable('showLoading', {
		loadingFontSize : '8px'
	})
})

</script>

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

<!-- 회사정보 mmodal -->
<div class="modal fade" id="companyModal" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" aria-labelledby="companyModal" tabindex="-1">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel2">회사정보</h5>
				<button type="button" class="btn-close" data-bs-target="#fullscreenModal" data-bs-toggle="modal" aria-label="Close"></button>
			</div>
			<div id="companyModal-body" class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn btn-success" data-bs-target="#fullscreenModal" data-bs-toggle="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 담당자정보 mmodal -->
<jsp:include page="../company_customer/companyCustomerView.jsp" />

<script>
const companyModalEL = document.getElementById('companyModal')
companyModalEL.addEventListener('show.bs.modal', event => {
	var company_index = localStorage.getItem("company_index")
	var paramData = { "company_index" : company_index };

	$.ajax({
		url : "${getCompanyURL}" ,
		type : "GET" ,
		dataType : "json" ,
		data : paramData ,
		success : function(result){
 			if(result.status == "True") {
 				$("#companyModal-body").empty();
 				$("#companyModal-body").append(companyModalRender(result.companyVO));
 			}
		},
		error: function(request, status, error) {
 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		}
	});
})

function companyModalRender(data) {
	console.log(data)
	var html = "";
	html += '<div class="col-lg-8 mx-auto p-3 py-md-5">';
	html += '<div class="card">';
	html += '<div class="card-header text-center"><h5>회사정보조회</h5></div>';
	html += '<div class="card-body col-md-10 mx-auto">';
	html += '<table class="table border-white lh-lg">';
	html += '<tr class="border-top border-white">';
	html += '<th class="col-md-4">회사명</th>';
	html += '<td>'+ data.company_name +'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>대표자명</th>';
	html += '<td>'+data.company_president+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>사업자등록번호</th>';
	html += '<td>'+data.company_business_number+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>사업장소재지</th>';
	html += '<td>'+data.company_location+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>홈페이지</th>';
	html += '<td>'+data.company_website+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>대표번호</th>';
	html += '<td>'+data.company_phone+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>팩스번호</th>';
	html += '<td>'+data.company_fax+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<th>이메일</th>';
	html += '<td>'+data.company_email+'</td>';
	html += '</tr></table></div></div></div>';
	
	return html;
}

const companyCustomerModalEL = document.getElementById('companyCustomerModal')
companyCustomerModalEL.addEventListener('show.bs.modal', event => {
	var company_index = localStorage.getItem("company_index")
	
	refreshTable(company_index);
})

//myAlert.addEventListener('closed.bs.alert', event => {
  // do something, for instance, explicitly move focus to the most appropriate element,
  // so it doesn't get lost/reset to the start of the page
  // document.getElementById('...').focus()
//})

function refreshTable(company_index) {	
	$table1.bootstrapTable('refresh', {
		url: '${pageContext.request.contextPath}/customer/getCompanyCustomerList?company_index='+company_index
	})
}
</script>
