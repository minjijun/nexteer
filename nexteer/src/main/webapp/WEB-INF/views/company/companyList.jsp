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
		<div class="card-header">회사목록조회</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-sm caption-top-right">
					<caption>List of companies</caption>
					<colgroup>
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
							<th>인덱스</th>
							<th>회사명</th>
							<th>대표자명</th>
							<th>사업자등록번호</th>
							<th>지역</th>
							<th>대표번호</th>
							<th>대표이메일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listCompanyVO }" var="company">
							<tr>
								<td>${company.company_index }</td>
								<td><a href="getCompany?company_index=${company.company_index }">${company.company_name }</a></td>
								<td>${company.company_president }</td>
								<td>${company.company_business_number }</td>								
								<td>${company.company_region }</td>
								<td>${company.company_phone }</td>
								<td>${company.company_email }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>