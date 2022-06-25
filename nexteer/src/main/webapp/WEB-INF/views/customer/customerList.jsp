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
								<td>${customer.company_index }</td>
								<td>${customer.member_name }</td>
								<td><a href="#">${customer.company_name }</a></td>
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