<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<script>
$(document).ready(function(){
    $('select').formSelect();
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
<!-- 장비 selectbox ajax -->
<!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">능력카드관리</a>
        <a href="#!" class="breadcrumb">능력카드수정</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

<!-- main -->
<div class="main_body" style="width:70%">
	<!-- 수정부분 -->
	<div class="row box">
		<form id="abilityInsertForm" class="col s12" method="POST"	action="<c:url value='/admin/ability/ability_merge'/>">
			<input type="hidden" name="forwardView" value="/admin/ability/ability_list" />
			<input type="hidden" name="ABILITY_SEQ" value="${resultMap.resultAbility.ABILITY_SEQ}" />
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
					<input name="ABILITY_NAME" id="ability_name" type="text" class="validate" value="${resultMap.resultAbility.ABILITY_NAME}"> <label
						for="ability_name">능력이름</label>
				</div>
				
			</div>
			
			<button class="btn waves-effect waves-light right" type="submit"
				name="action">
				수정 <i class="material-icons right">edit</i>
			</button>

		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



