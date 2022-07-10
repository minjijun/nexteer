<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css" rel="stylesheet">
1
<c:url var="updateCompany" value="updateCompany"></c:url>
<c:url var="deleteCompany" value="deleteCompany"></c:url>
<c:url var="updateCompanyCustomer" value="/customer/updateCompanyCustomer"></c:url>
<c:url var="deleteCompanyCustomer" value="/customer/deleteCompanyCustomer"></c:url>

<div class="modal fade" id="companyCustomerModal" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" aria-labelledby="companyCustomerModal" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel2">담당자정보</h5>
				<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
				<button type="button" class="btn-close" data-bs-target="#fullscreenModal" data-bs-toggle="modal" aria-label="Close"></button>
			</div>
			<div id="companyCustomerModal-body" class="modal-body">
				<div id="toolbar">
					<button id="insert" class="btn btn-success">추가</button>
					<button id="save" class="btn btn-success" disabled>저장</button>
					<button id="remove" class="btn btn-success" disabled>삭제</button>
				</div>
				
				<table
					id="table1"
					data-classes="table table-borderless table-striped table-md"
					data-toolbar="#toolbar"
					data-buttons-class="success"
					data-id-field="company_customer_index"
					data-page-list="[10, all]"
					data-side-pagination="server"
					data-toggle="table"
					data-height="460"
					data-url=""
					data-response-handler="responseHandler1"
				  >
					<thead>
						<tr>
							<th data-width="70" data-field="state" data-align="center" data-checkbox="true"></th>
							<th data-width="70" data-field="company_customer_index" data-align="center">인덱스</th>
							<th data-field="company_customer_name" data-align="center" data-valign="middle" data-formatter="inputFormatter" data-events="inputEvents1">이름</th>
							<th data-width="80" data-field="company_customer_position" data-align="center" data-valign="middle" data-formatter="inputFormatter" data-events="inputEvents2">직급</th>
							<th data-field="company_customer_phone" data-align="center" data-valign="middle" data-formatter="inputFormatter" data-events="inputEvents3">내선번호</th>
							<th data-field="company_customer_email" data-align="center" data-valign="middle" data-formatter="inputFormatter" data-events="inputEvents4">이메일</th>
							<th data-width="80" data-field="company_customer_status" data-align="center" data-valign="middle" data-formatter="inputFormatter" data-events="inputEvents5">상태</th>
							<th data-width="100" data-field="operate" data-align="center" data-valign="middle" data-clickToSelect="false" data-events="operate1Events" data-formatter="operate1Formatter"></th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success" data-bs-target="#fullscreenModal" data-bs-toggle="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	var $table1 = $('#table1')
	var $insert = $('#insert')
	var $save = $('#save')
	var $remove = $('#remove')
	var $company_customer_name = $('#company_customer_name')
	var company_index = localStorage.getItem("company_index")
	var max_index = -1
	
	var selections = []
	
	function getIdSelections() {
		return $.map($table1.bootstrapTable('getSelections'), function (row) {
			return row.company_customer_index
		})
	}
	
	function responseHandler1(res) {
		$.each(res.rows, function (i, row) {
			row.state = $.inArray(row.company_customer_index, selections) !== -1
			row.index = i
			max_index = i + 1		
		})
		return res
	}
	
	function inputFormatter(value, e, index, $element) {
		return '<input class="form-control" type="text" value="'+ value +'" id="'+ $element + '" />'
	}
	
	window.inputEvents1 = {
		'change :text': function (e, value, row, index) {
			row.company_customer_name = $(e.target).prop('value')
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'company_customer_name',
				value: row.company_customer_name
			})
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
		}
	}
	
	window.inputEvents2 = {
		'change :text': function (e, value, row, index) {
			row.company_customer_position = $(e.target).prop('value')
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'company_customer_position',
				value: row.company_customer_position
			})
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
		}
	}
	
	window.inputEvents3 = {
		'change :text': function (e, value, row, index) {
			row.company_customer_phone = $(e.target).prop('value')
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'company_customer_phone',
				value: row.company_customer_phone
			})
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
		}
	}
	
	window.inputEvents4 = {
		'change :text': function (e, value, row, index) {
			row.company_customer_email = $(e.target).prop('value')
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'company_customer_email',
				value: row.company_customer_email
			})
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
		}
	}
	window.inputEvents5 = {
		'change :text': function (e, value, row, index) {
			row.company_customer_status = $(e.target).prop('value')
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'company_customer_status',
				value: row.company_customer_status
			})
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
		}		
	}

	function operate1Formatter(value, row, index) {
		return ['<a class="remove" href="javascript:void(0)" title="Remove">삭제</a>'].join('')
	}
	
	function callAjax(operate) {
		var url = ""
		if(operate == 'save') {
			url = "${updateCompanyCustomer}" 
		} else if(operate == 'remove') {
			url = "${deleteCompanyCustomer}"
		}
		var paramData = JSON.stringify($table1.bootstrapTable('getSelections'))
		
		$.ajax({
			url : url,
			type : "POST" ,
			contentType : "application/json",
			dataType : "json" ,
			data : paramData ,
			success : function(result){
				if(result.status == "True") {
					$table1.bootstrapTable('refresh', {
						url: '${pageContext.request.contextPath}/customer/getCompanyCustomerList?company_index='+company_index
					})
					$save.prop('disabled', true)
					$remove.prop('disabled', true)
				}
			},
			error: function(request, status, error) {
	 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		}
		});
	}
	
	window.operate1Events = {
		'click .remove': function (e, value, row, index) {
			row.state = true
			$table1.bootstrapTable('updateCell', {
				index: index,
				field: 'state',
				value: row.state
			})
			callAjax("remove")
		}
	}
	
	function initTable() {
		$table1.on('check.bs.table uncheck.bs.table ' + 'check-all.bs.table uncheck-all.bs.table' + 
				' reset-view.bs.table load-success.bs.table refresh.bs.table', function () {
			$save.prop('disabled', !$table1.bootstrapTable('getSelections').length)
			$remove.prop('disabled', !$table1.bootstrapTable('getSelections').length)
		})
		$table1.on('all.bs.table', function (e, name, args) {
			console.log(name, args)
		})
		$table1.on('click-cell.bs.table', function (e, name, args) {
			//alert("click-cell.bs.table:"+name+"/"+args)
		})
		$table1.on('click-row.bs.table', function (e, name, args) {
			//alert("click-row.bs.table:"+name+"/"+args)
		})
		$remove.click(function () {			
			callAjax('remove')
		})
		$save.click(function () {
			callAjax('save')
		})
		$insert.click(function () {
			$table1.bootstrapTable('append', appendData())
		})
	}
	
	function appendData() {
		var rows = []
		
		rows.push({
        	company_business_number: null,
        	company_customer_delete_date: null,
        	company_customer_email: "",
        	company_customer_index: null,
        	company_customer_modify_date: null,
        	company_customer_name: "",
        	company_customer_phone: "",
        	company_customer_position: "",
        	company_customer_register_date: null,
        	company_customer_status: "재직",
        	company_index: company_index,
        	company_name: null,
        	index: max_index,
        	member_index: null,
        	state: true
          })
        max_index = max_index + 1
		return rows
	}
	$(function() {
		initTable()
	})	

</script>

