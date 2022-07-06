<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	
<style>
.starter-template {
  padding: 5rem 1.5rem;
  text-align: center;
}
</style>

<c:url var="getCalllogListURL" value="getCalllogList"></c:url>
<c:url var="getCalllogURL" value="getCalllog"></c:url>
<c:url var="apiserchURL" value="/api/search"></c:url>
<c:url var="getCustomerURL" value="getCustomer"></c:url>
<c:url var="getCompanyURL" value="getCompany"></c:url>

<div id="customerList" class="starter-template" role="main">
	<!-- Toolbar -->
	<div class="search_wrap row pb-2">
		<form class="col-md-2 d-flex justify-content-start">
			<select name="member_index" id="filter" class="form-select form-select-md">
				<option value="%">전체</option>
				<c:forEach items="${listMemberVO }" var="listMember">
					<option value="${listMember.member_index}">${listMember.member_name }</option>
				</c:forEach>
			</select>
		</form>
		<form class="col-md-10 d-flex justify-content-end" name="form" id="form" role="form" method="get" action="${pageContext.request.contextPath}/customer/search">
			<div class="col-md-2">
				<select name="type" id="type" class="form-select form-select-md">
					<option value="A">거래처명</option>
					<option value="B">담당자</option>
				</select>
			</div>
			<div class="col-md-4">
				<input type="text" id="keyword" class="form-control" name="keyword"></input>
			</div>
			<div class="col-md-1">						
				<button class="btn btn-success btn-md btn-block" id="btn-search" type="button">검색</button>
			</div>
		</form>
	</div>
	
	<!-- List -->
	<div class="card">
		<div class="card-header">고객목록조회</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-sm caption-top-right">
					<caption>List of customers</caption>
					<colgroup>
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
						<col style="width:auto" />
					</colgroup>
					<thead>
						<tr>
							<th>거래처<br>순번</th>
							<th>우리<br>담당자</th>
							<th>거래처명</th>
							<th>담당자</th>
							<th>직급</th>
							<th>제안제품</th>
							<th>제안서<br>전송일자</th>
							<th>견적서<br>전송일자</th>
							<th>마지막<br>통화일자</th>
							<th>전화번호</th>
							<th>email</th>
							<th>지역</th>
							<th>주소</th>
							<th>사업자등록번호</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:forEach items="${listCustomerVO }" var="customer">
							<tr>
								<td>${customer.company_index }</td>
								<td>${customer.member_name }</td>
								<td><a href="#" data-bs-toggle="modal" data-bs-target="#fullscreenModal" data-bs-whatever="${customer.company_name }" data-bs-whatever1="${customer.company_index }" data-bs-whatever2="${customer.member_index }">${customer.company_name }</a></td>
								<td>${customer.company_customer_name }</td>
								<td>${customer.company_customer_position }</td>
								<td>${customer.proposal_history_suggested_product }</td>
								<td>${customer.proposal_history_job_date1 }</td>
								<td>${customer.proposal_history_job_date2 }</td>
								<td>${customer.proposal_history_job_date3 }</td>								
								<td>${customer.company_customer_phone }</td>
								<td>${customer.company_customer_email }</td>
								<td>${customer.company_region }</td>
								<td>${customer.company_location }</td>								
								<td>${customer.company_business_number }</td>							
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

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
				<jsp:include page="customerView.jsp"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

//자바스크립트로 CSR처리
$("#btn-search").click(()=>{
	let type = $("#type").val();
	let keyword = $("#keyword").val();
	let filter = $("#filter").val();
	let filter_type = '';
	if(filter == '%') {
		filter_type = '%';
		filter = '';
	}
		
	search(type, keyword, filter_type, filter);
});

$("#filter").change(()=>{
	let type = $("#type").val();
	let keyword = $("#keyword").val();
	let filter = $("#filter").val();
	let filter_type = '';
	if(filter == '%') {
		filter_type = '%';
		filter = '';
	}
	search(type, keyword, filter_type, filter);
});

async function search(type, keyword, filter_type, filter) {
	var paramData = { "type"	: type,
					  "keyword" : keyword,
					  "filter_type"	: filter_type,
					  "filter"	: filter };
	
	$.ajax({
		url : "${apiserchURL}" ,
		type : "GET" ,
		dataType : "json" ,
		data : paramData ,
		success : function(result){			
			if(result.status == "True") {
		 		$("#list").empty();
		 		var html = '';
		 		result.listCustomerVO.forEach(function(list) {
					html += '<tr>';
					html +=	'<td>'+list.company_index+'</td>';
					html +=	'<td>'+list.member_name+'</td>';
					html +=	'<td><a href="#" data-bs-toggle="modal" data-bs-target="#fullscreenModal" data-bs-whatever='+list.company_name+' data-bs-whatever1='+list.company_index +' data-bs-whatever2='+list.member_index+'>'+list.company_name +'</a></td>';
					html += '<td>'+list.company_customer_name +'</td>';
					html += '<td>'+list.company_customer_position +'</td>';
					html +=	'<td>'+list.proposal_history_suggested_product +'</td>';
					html +=	'<td>'+list.proposal_history_job_date1 +'</td>';
					html +=	'<td>'+list.proposal_history_job_date2 +'</td>';
					html +=	'<td>'+list.proposal_history_job_date3 +'</td>';								
					html +=	'<td>'+list.company_customer_phone +'</td>';
					html +=	'<td>'+list.company_customer_email +'</td>';
					html +=	'<td>'+list.company_region +'</td>';
					html +=	'<td>'+list.company_location +'</td>';								
					html +=	'<td>'+list.company_business_number +'</td>';						
					html +=	'</tr>';
		 		});
		 		$("#list").append(html);
			}
		},
		error: function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function trRender(list) {
	return `<tr>	
		<td>`+list.company_index+`</td>
		<td>`+list.member_name+`</td>
		<td>`+list.company_customer_name +`</td>
		<td>`+list.company_customer_position +`</td>
		<td>`+list.proposal_history_suggested_product +`</td>
		<td>`+list.proposal_history_job_date1 +`</td>
		<td>`+list.proposal_history_job_date2 +`</td>
		<td>`+list.proposal_history_job_date3 +`</td>								
		<td>`+list.company_customer_phone +`</td>
		<td>`+list.company_customer_email +`</td>
		<td>`+list.company_region +`</td>
		<td>`+list.company_location +`</td>								
		<td>`+list.company_business_number +`</td>							
	</tr>`;
}

const fullscreenModal = document.getElementById('fullscreenModal')
fullscreenModal.addEventListener('show.bs.modal', event => {
	const button = event.relatedTarget
	const company_name = button.getAttribute('data-bs-whatever')
	var company_index = button.getAttribute('data-bs-whatever1')
	if(company_index == null) {		
		company_index = localStorage.getItem("company_index")
	}	
	const member_index = button.getAttribute('data-bs-whatever2')
	
	localStorage.setItem("company_index", company_index)

	fullscreenModal.querySelector('.modal-title').textContent = company_name
	fullscreenModal.querySelector('#calllog_call_contents').value = ""
	
	var paramData = { "company_index"	: company_index,
		  				"member_index" : member_index };
	
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
				fullscreenModal.querySelector('#member_script2').value = result.memberVO.member_script2
			} else {
											
			}
		},
		error: function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
})

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
	alert("2:"+company_index)
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
	$table.bootstrapTable('refresh', {
		url: '${pageContext.request.contextPath}/customer/getCompanyCustomerList?company_index='+company_index
	})
}
</script>

