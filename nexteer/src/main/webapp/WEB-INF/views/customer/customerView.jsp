<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<main class="container">
<c:forEach items="${listCustomerVO }" var="customer">
<c:if test="${customer.company_index eq requestScope.company_index and customer.member_index eq requestScope.member_index }">
  <div class="p-4 p-md-3 mb-3 rounded bg-light">
  	<div class="row g-3">
    	<div class="col-sm-3">
		  <label for="member_name" class="form-label">우리담당자</label>
		  <input type="text" class="form-control" id="member_name" placeholder="" value="${customer.member_name }" required="">
		</div>
		<div class="col-sm-3">
		  <label for="proposal_history_suggested_product" class="form-label">제안제품</label>
		  <input type="text" class="form-control" id="proposal_history_suggested_product" placeholder="" value="${customer.proposal_history_suggested_product }" required="">
		</div>
		<div class="col-sm-6">
		  <label for="company_name" class="form-label">거래처명</label>
		  <input type="text" class="form-control" id="company_name" placeholder="" value="${customer.company_name }" required="">
		</div>
		<div class="col-sm-3">
		  <label for="company_customer_name" class="form-label">담당자명</label>
		  <input type="text" class="form-control" id="company_customer_name" placeholder="" value="${customer.company_customer_name }" required="">
		</div>
		<div class="col-sm-3">
		  <label for="company_customer_position" class="form-label">직급</label>
		  <input type="text" class="form-control" id="company_customer_position" placeholder="" value="${customer.company_customer_position }" required="">
		</div>	
		<div class="col-sm-3">
		  <label for="member_name" class="form-label">연락처</label>
		  <input type="text" class="form-control" id="company_customer_phone" placeholder="" value="${customer.company_customer_phone }" required="">
		</div>
		<div class="col-sm-3">
		  <label for="company_customer_email" class="form-label">e-mail</label>
		  <input type="text" class="form-control" id="company_customer_email" placeholder="" value="${customer.company_customer_email }" required="">
		</div>
		<div class="col-sm-3">
		  <label for="company_customer_name" class="form-label">제안서전송일자</label>
		  <input type="text" class="form-control" id="company_customer_name" placeholder="" value="${customer.proposal_history_job_date1 }" readonly="true">
		</div>		
		<div class="col-sm-3">
		  <label for="member_name" class="form-label">견적서전송일자</label>
		  <input type="text" class="form-control" id="company_customer_phone" placeholder="" value="${customer.proposal_history_job_date2 }" readonly="true">
		</div>
		<div class="col-sm-3">
		  <label for="proposal_history_job_date3" class="form-label">최종통화일자</label>
		  <input type="text" class="form-control" id="proposal_history_job_date3" placeholder="" value="${customer.proposal_history_job_date3 }" readonly="true">
		</div>
		<div class="col-sm-3">
		  <label for="proposal_history_job_date3" class="form-label text-light">저장</label>
		  <button class="w-100 btn btn-md btn-success" type="submit">저장</button>
		</div>
	</div>
  </div>
  </c:if>
  </c:forEach>
  <div class="row mb-2">
    <div class="col-md-12">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col-md-6 p-3 d-flex flex-column position-static">
         	<div class="list-group w-auto" id="callogList">
         	   <!-- 
			  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
			    <div class="d-flex gap-2 w-100 justify-content-between">
			      <div class="col-md-4">
			        <p class="mb-0 opacity-75 text-truncate">Some placeholder content in a paragraph.</p>
			      </div>
			      <small class="opacity-50 text-nowrap">2022-05-26</small>
			    </div>
			  </a>
			  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
			    <div class="d-flex gap-2 w-60 justify-content-between">
			      <div class="col-md-4">
			        <p class="mb-0 opacity-75 text-truncate">Some placeholder content in a paragraph that goes a little longer so it wraps to a new line.</p>
			      </div>
			    </div>
			    <small class="opacity-50 text-nowrap">2022-05-25</small>
			  </a>
			  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
			    <div class="d-flex gap-2 w-100 justify-content-between">
			      <div class="col-md-4">
			        <p class="mb-0 opacity-75 text-truncate">Some placeholder content in a paragraph.</p>
			      </div>
			    </div>
			    <small class="opacity-50 text-nowrap">2022-05-24</small>
			  </a> -->
</div>
        </div>
        <div class="col-md-6 p-3 d-flex flex-column position-static">
        	<textarea class="form-control mb-3" id="calllog_call_contents" cols="100" rows="4"></textarea>
        	<button class="w-100 btn btn-md btn-success" type="submit">저장</button>
        </div>
      </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-8">
    	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#">1차 콜스크립트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">2차 콜스크립트</a>
		  </li>
		</ul>
    </div>

    <div class="col-md-4">
      <div class="row g-3 position-sticky">
      	<div class="col-md-12">
		  <label for="company_customer_name" class="form-label">이메일주소</label>
		  <input type="text" class="form-control" id="company_customer_name" placeholder="" value="" required="">
		 </div>
        	<div class="col-md-6">
		  		<button class="w-100 btn btn-md btn-warning" type="submit">제안서전송</button>
		  	</div>
		  	<div class="col-md-6">
		  	<button class="w-100 btn btn-md btn-outline-warning" type="submit">프로모션제안서전송</button>
		  	</div>
			<div class="col-md-6">
			  <button class="w-100 btn btn-md btn-info" type="submit">견적서전송</button>
			 </div>
			 <div class="col-md-6">
			  <button class="w-100 btn btn-md btn-outline-info" type="submit">프로모션견적서전송</button>
			  </div>
		</div>
      </div>
    </div>
  </div>
</main>
