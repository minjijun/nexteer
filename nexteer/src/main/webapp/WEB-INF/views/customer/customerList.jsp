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

<div class="starter-template" role="main">
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
					<tbody>
						<c:forEach items="${listCustomerVO }" var="customer">
							<tr>
								<c:set var="company_index" value="${customer.company_index }" scope="request"/>
								<c:set var="member_index" value="${customer.member_index }" scope="request"/>
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
<div class="modal fade" id="fullscreenModal" tabindex="-1" aria-labelledby="fullscreenModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
      	
		      <div class="col-3 text-center">
		        <a class="link-secondary" href="#">회사정보</a>
		        <a class="link-secondary" href="#">담당자정보</a>
		      </div>
		    <div class="col-6 text-center">
		      <p class="blog-header-logo modal-title text-dark" id="fullscreenModalLabel"></p>
		  	</div>
			  
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		 </div>
      <div class="modal-body">
      	<jsp:include page="customerView.jsp"/>
      	<!-- 
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
         -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
const fullscreenModal = document.getElementById('fullscreenModal')
fullscreenModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  const button = event.relatedTarget
  // Extract info from data-bs-* attributes
  const recipient = button.getAttribute('data-bs-whatever')
  const company_index = button.getAttribute('data-bs-whatever1')
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  
  const modalTitle = fullscreenModal.querySelector('.modal-title')
  const modalBodyInput = fullscreenModal.querySelector('.modal-body input')

  modalTitle.textContent = recipient
  modalBodyInput.value = recipient
  
  var paramData = { "company_index"	: company_index };
  
	$.ajax({
		url : "${getCalllogListURL}" ,
		type : "POST" ,
		dataType : "json" ,
		data : paramData ,
		success : function(result){
			console.log(result);
			if(result.status == "True") {
				var html = "";
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
			console.log(result);
			if(result.status == "True") {
				const input = fullscreenModal.querySelector('#calllog_call_contents')
				input.value = result.calllogVO.calllog_call_contents
			} else {
							
			}
		},
		error: function(request, status, error) {
 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		}
	});
}
</script>
