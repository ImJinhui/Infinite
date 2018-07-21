
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
$(document).ready(function() {
	$('.modal').modal({
		endingTop : '5%',
		dismissible : false
	}
	);
	
	$('select').formSelect();
	
	/* 삭제확인팝업 */
	$(".btn_delete").click( function() {
    	var flag = confirm("삭제 하시겠습니까?");
        if(flag==true) {
            $(this).parent().click();
        } else if(flag==false){
            return false;
        }
    });
});
</script>

<!-- 장비 selectbox ajax -->
<script type="text/javascript">
 var fn_cate_select = function(url, params) {
	$.ajax({
		type : "POST", 
		url : url, 
		data : {"CATEGORY_SEQ" : params}, 
		dataType:'json',
		cache: false,
		success: function(data){ 
			/* subCate 목록 생성 */
			   var sub_cate = "<option value='' disabled selected>Choose your option</option>";
			   $.each(data, function(i){
				   sub_cate += "<option value='"+(data[i])['SUB_CATEGORY_SEQ']+"'>"+(data[i])['SUB_CATEGORY_NAME']+"</option>";
			   });    
			   $("#subCate").html(sub_cate);
				$('select').formSelect(); 
				
				/* subCate 목록 선택 시 선택된 value값 얻어옴  */
				$("#subCate").on('change', function(){
					if(this.value !== ""){
						var selOption = $(this).find(":selected").val();
						$("#abilityInsertForm").attr("action", "<c:url value='/admin/ability/ability_merge?SUB_CATEGORY_SEQ="+selOption+"'/>");
					}
				});
				
			  },
		error : function(xhr, status, exception){
			alert("Failure \n ("+status+")");
			return false; 
		}
		});
	}
	
	function cateSelect(param) {
		fn_cate_select("<c:url value='/wsEquip/subCateList'/>", param);
	}; 
</script>
<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">능력카드관리</a> <a href="#!"
				class="breadcrumb">능력카드목록</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<!-- main -->
<div class="main_body" style="width: 50%">
	<!-- 수정부분 -->
	<div class="box">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>능력번호</th>
					<th>능력 이름</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>

			<tbody>
					<c:forEach items="${resultMap.resultAbilityList}" var="resultData" varStatus="loop" >
						<tr
							class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
							<td>${resultData.ABILITY_SEQ}</td>
							 <td>${resultData.ABILITY_NAME}</td> 
							<td><a class="waves-effect waves-light btn-small"
								href="<c:url value='/admin/ability/ability_edit?ABILITY_SEQ=${resultData.ABILITY_SEQ}'/>">수정</a></td>
							<td><a class="btn_delete waves-effect waves-light btn-small"
								href="<c:url value='/admin/ability/ability_delete?ABILITY_SEQ=${resultData.ABILITY_SEQ}'/>">삭제</a></td>
						</tr>
						</c:forEach>
						</tbody>
		</table>
	</div>
	<!-- modal -->
	<div id="modal1" class="modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="row">
					<div class="input-field col s12">
					<span><i class="modal-close material-icons right">close</i></span>
						<h4>능력추가</h4>
					</div>
				</div>
				<div class="col s12">
				<form id="abilityInsertForm" action="<c:url value='/admin/ability/ability_merge'/>" role="form" method="POST">
				<input type="hidden" name="forwardView" value="/admin/ability/ability_list" />
					<div class="row">
					<div class="input-field col s6">
						<select onchange="cateSelect(this.value);">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateList}" var="resultCate" varStatus="loop">
								<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
								  <%-- <c:if test="${(resultCate.CATEGORY_SEQ) eq (paramMap.CATEGORY_SEQ)}">
									<option value="${resultCate.CATEGORY_SEQ}" selected="selected">${resultCate.CATEGORY_NAME}</option>
								</c:if>  --%> 
							</c:forEach>
						</select> <label>장비위치</label>
					</div>
			
					<div class="input-field col s6">
						<select id="subCate">
						</select> <label>장비종류</label>
					</div>
				</div>
					<div class="row">
						<div class="input-field col s12">
							<input name ="ABILITY_NAME" id="name" type="text" class="validate"> <label
								for="name">능력 이름</label>
						</div>
					</div>
				
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<!-- <a href="#!" class="modal-close waves-effect waves-teal btn">능력추가</a> -->
			<button class="btn waves-effect waves-light" type="submit" name="action">
				추가 <i class="material-icons right">add</i>
			</button>
		</div>
		</form>
	</div>


	<!-- modal -->
	<!-- 추가버튼 -->
	<div class="fixed-action-btn">
		<a class="btn-floating btn-large red modal-trigger" href="#modal1">
			<i class="large material-icons">add</i>
		</a>
	</div>
	<!-- /추가버튼 -->

	<!-- /수정부분 -->
</div>
<!-- /main -->




