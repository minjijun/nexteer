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
		<div class="card-header">직원 목록</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-sm caption-top-right">
					<caption>List of users</caption>
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
							<th>이름</th>
							<th>아이디</th>
							<th>내선번호</th>
							<th>휴대폰</th>
							<th>이메일</th>
							<th>직급</th>
							<th>권한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listMemberVO }" var="member">
							<tr>
								<td><a href="getMember?member_index=${member.member_index }">${member.member_name }</a></td>
								<td>${member.member_id }</td>
								<td>${member.member_phone }</td>
								<td>${member.member_mobile }</td>								
								<td>${member.member_email }</td>
								<td>${member.member_position }</td>
								<td>${member.member_authority }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>