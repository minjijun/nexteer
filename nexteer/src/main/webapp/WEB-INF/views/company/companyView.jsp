<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<div class="col-lg-8 mx-auto p-3 py-md-5">
	<div class="card">
		<div class="card-header text-center"><h5>회사정보조회</h5></div>
		<div class="card-body col-md-9 mx-auto">
			
			<table class="table border-white lh-lg">
			
				<tr class="border-top border-white">
					<th class="col-md-3">회사명</th>
					<td class="">${companyVO.company_name}</td>
				</tr>
				<tr>
					<th>대표자명</th>
					<td>${companyVO.company_president}</td>
				</tr>
				<tr>
					<th>사업자등록번호</th>
					<td>${companyVO.company_business_number}</td>
				</tr>
				<tr>
					<th>사업장소재지</th>
					<td>${companyVO.company_location}</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td>${companyVO.company_website}</td>
				</tr>
				<tr>
					<th>대표번호</th>
					<td>${companyVO.company_phone}</td>
				</tr>
				<tr>
					<th>팩스번호</th>
					<td>${companyVO.company_phone}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${companyVO.company_phone}</td>
				</tr>
			  
			</table>
  		</div>
	</div>
</div>
