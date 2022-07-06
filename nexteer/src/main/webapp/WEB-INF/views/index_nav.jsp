<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex flex-column pt-3 flex-shrink-0 p-3">
	<ul class="list-unstyled ps-0">
		<li class="mb-1 mt-3">
			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">고객관리</button>
			<div class="collapse show" id="home-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="${pageContext.request.contextPath}/customer/getCustomerList" class="link-dark d-inline-flex text-decoration-none rounded">제안내역조회(전체)</a></li>
					<li><a href="${pageContext.request.contextPath}/customer/getCustomerListOfJob1" class="link-dark d-inline-flex text-decoration-none rounded">제안내역조회(제안서)</a></li>
					<li><a href="${pageContext.request.contextPath}/customer/getCustomerListOfJob2" class="link-dark d-inline-flex text-decoration-none rounded">제안내역조회(견적서)</a></li>
				</ul>
			</div>
		</li>
		<li class="mb-1">
			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">회사관리</button>
			<div class="collapse show" id="dashboard-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="${pageContext.request.contextPath}/company/registerCompany" class="link-dark d-inline-flex text-decoration-none rounded">회사등록</a></li>
					<li><a href="${pageContext.request.contextPath}/company/getCompanyList" class="link-dark d-inline-flex text-decoration-none rounded">회사목록조회</a></li>
					<li><a href="${pageContext.request.contextPath}/excel/excelProcess" class="link-dark d-inline-flex text-decoration-none rounded">엑셀업로드다운로드</a></li>
				</ul>
			</div>
		</li>
		<li class="border-top my-3"></li>
		<li class="mb-1">
			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">직원관리</button>
			<div class="collapse show" id="account-collapse">
		        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="${pageContext.request.contextPath}/member/registerMember" class="link-dark d-inline-flex text-decoration-none rounded">직원등록</a></li>
					<li><a href="${pageContext.request.contextPath}/member/getMemberList" class="link-dark d-inline-flex text-decoration-none rounded">직원목록조회</a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>