<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css" rel="stylesheet">

<article>
	<div class="container col-md-12" role="main">
		<div class="py-5 text-center">
			<h2>엑셀업로드다운로드</h2>
			<p class="lead"></p>
		</div>
		<div class="card">
			<div class="card-body">
				<!-- Excel Form {s} -->
				<form class="form-signup" id="excelForm" name="excelForm" role="form" method="post" enctype="multipart/form-data">
					<div class="form-group row mb-3">
						<label for="file" class="col-md-3 col-form-label text-end">엑셀 업로드</label>
						<div class="col-md-6">
							<input type="file" id="file" name="file" class="form-control">
						</div>
						<button type="button" onclick="doExcelUploadProcess()" class="btn btn-success col-md-1">업로드</button>
						<table
							id="table"
							data-classes="table table-borderless table-striped table-md"
							data-toolbar="#toolbar"
							data-buttons-class="success"
							data-page-list="[10, all]"
							data-side-pagination="server"
							data-toggle="table"
							data-height="460"
						  >
							<thead>
								<tr>
									<th data-width="70" data-field="excel_row" data-align="center" data-valign="middle">엑셀번호</th>
									<th data-field="company_name" data-align="center" data-valign="middle">거래처명</th>
									<th data-field="company_business_number" data-align="center" data-valign="middle">사업자등록번호</th>
								</tr>
							</thead>
							<tbody id="tbody"></tbody>
						</table>
					</div>
				    			
					<div class="form-group row mb-3">
						<label for="company_fax" class="col-md-3 col-form-label text-end">엑셀 다운로드</label>
						<div class="col-md-6">
							<button type="button" onclick="doExcelDownloadProcess()" class="btn btn-success">다운로드</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</article>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  -->

<script type="text/javascript">
	var $table = $('#table')

    function doExcelUploadProcess(){
    	let file = document.getElementById('file').value
    	let listCompanyVO = [];
    	if(file == null || file == "") {
    		alert("업로드 할 파일을 선택하세요.")
    		$("#file").focus()
    		return false
    	}
    	if(!confirm("업로드 하시겠습니까?")) return false;
    	
        let form = new FormData(document.getElementById('excelForm'))        
        let html = "";
        $.ajax({
            url: "uploadExcelFile",
            data: form,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data){
            	data.rows.forEach(function(list) {
            		html += '<tr><td>'+ list.excel_row +'</td>';
            		html += '<td>'+list.company_name+'</td>';
            		html += '<td>'+list.company_business_number+'</td>';
            		html += '</tr>';
            	})
            	$("#tbody").html(html)
            }
        })
    }
    
    function doExcelDownloadProcess(){
    	if(!confirm("다운로드 하시겠습니까?")) return false;
        var form = document.excelForm;
        form.action = "${pageContext.request.contextPath}/excel/downloadExcelFile";
        form.submit();
    }
</script>