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
<!-- 장비추가 널 체크  -->
<script>
function checkNull(){
	if ($("#subCate").find(":selected").val()==null || $("#subCate").find(":selected").val()=="Choose your option") {
			alert("장비종류값을 입력해주세요");
			$("#subCate").focus();
			return $('#equipInsertForm').submit(false);
		} else if ($("#equip_seq").val().length < 1) {
			alert("장비아이디값을 입력해주세요");
			$("#equip_seq").focus();
			return $('#equipInsertForm').submit(false);
		} else if ($("#description").val().length < 1) {
			alert("장비설명값을 입력해주세요");
			$("#description").focus();
			return $('#equipInsertForm').submit(false);
		} else if ($("#equip_name").val().length < 1) {
			alert("장비이름값을 입력해주세요");
			$("#equip_name").focus();
			return $('#equipInsertForm').submit(false);
		}
		return $('#equipInsertForm').submit();
	}
	
</script>
<!-- /장비추가 널 체크  -->
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
						$("#equipInsertForm").attr("action", "<c:url value='/admin/equip/equip_merge?SUB_CATEGORY_SEQ="+selOption+"'/>");
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
      	<a href="#!" class="breadcrumb">장비·장소관리</a>
        <a href="#!" class="breadcrumb">장비관리</a>
        <a href="#!" class="breadcrumb">장비수정</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body" style="width:70%">
  <!-- 수정부분 -->
  <div class="row box" >
		<form id="equipInsertForm" class="col s12" method="POST" action="<c:url value='/admin/equip/equip_merge'/>" enctype="multipart/form-data">
			<input type="hidden" name="forwardView" value="/admin/equip/equip_list" />
				<div class="row">
					<div class="input-field col s6">
						<select onchange="cateSelect(this.value);">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateList}" var="resultCate" varStatus="loop">
								<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
								 <%-- <c:if test="${(resultCate.CATEGORY_SEQ) == (resultMap.resultObject.CATEGORY_SEQ)}">
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
						<input name="EQUIP_SEQ" id="equip_seq" type="text" class="validate" value="${resultMap.resultObject.EQUIP_SEQ }" readOnly> <label
							for="equip_seq">장비아이디</label>
					</div>
				</div>
			

			<div class="row">
					<div class="input-field col s12">
						<input name="EQUIP_NAME" id="equip_name" type="text" class="validate" value="${resultMap.resultObject.EQUIP_NAME}"> <label
							for="name">장비명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<input name="MANUFACTURER" id="manufacturer" type="text" class="validate" value="${resultMap.resultObject.MANUFACTURER}"> <label
							for="manufacturer">제조사</label>
					</div>
					<div class="input-field col s6">
						<input name="MANAGER" id="manager" type="text" class="validate" value="${resultMap.resultObject.MANAGER}"> <label
							for="manager">관리자</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea name="DESCRIPTION" id="description" class="materialize-textarea">${resultMap.resultObject.DESCRIPTION}</textarea>
						<label for="description">장비 설명</label>
					</div>
				</div>
				<div class="row">
					<label for="available">사용가능여부</label>
				<div class="input-field inline col s12">
					<p id="available">
						<label> <input name="AVAILABLE" value="사용가능" type="radio" /> <span>사용가능</span>
						</label>
					
						<label> <input name="AVAILABLE" value="사용불가" type="radio" /> <span>사용불가</span>
						</label>
					</p>
				</div>
			</div>
				<div class="file-field input-field">
					<div class="btn">
						<span>File</span> <input type="file" name="ATTACHEDFILES">
					</div>
					<div class="file-path-wrapper">
						<input id="image" name="IMAGE" class="file-path validate" type="text"
							placeholder="장비이미지">
					</div>
				</div>
		<button class="btn waves-effect waves-light right" onclick="checkNull();" name="action">
			장비수정 <i class="material-icons right">send</i>
		</button>
	</form>
	</div>
	</div>
  <!-- /수정부분 -->
  <!-- /main -->
  
  

