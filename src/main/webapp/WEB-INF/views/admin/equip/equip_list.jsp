<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>
.card .card-image img {
  height: 230px;
}
</style>
<script>
	$(document).ready(function() {
		$('.collapsible').collapsible();
		$('.modal').modal({
			endingTop : '5%',
			dismissible : false
		});
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
<!-- 장비추가 널 체크  -->
<script>
function checkNull(){
	if ($("#subCate").find(":selected").val() == null
				|| $("#subCate").find(":selected").val() == "Choose your option") {
			alert("장비종류값을 입력해주세요");
			$("#subCate").focus();
			return false;
		} else if ($("#equip_seq").trim().val().length < 1) {
			alert("장비아이디값을 입력해주세요");
			$("#equip_seq").focus();
			return false;
		} else if ($("#equip_name").trim().val().length < 1) {
			alert("장비이름값을 입력해주세요");
			$("#equip_name").focus();
			return false;
		} else if ($("#description").trim().val().length < 1) {
			alert("장비설명값을 입력해주세요");
			$("#description").focus();
			return false;
		} else if (!($('input:radio[name=AVAILABLE]').is(':checked'))) {
			alert("사용가능여부를 입력해주세요");
			$("#available").focus();
			return false;
		}else if (!($('input:radio[name=ABILITY]').is(':checked'))) {
			alert("능력카드 필요여부를 입력해주세요");
			$("#ability").focus();
			return false;
		} else if ($("#attachedfiles").val().length < 1) {
			alert("장비이미지파일 입력해주세요");
			$("#attachedfiles").focus();
			return false;
		}
		$('#equipInsert').submit();
	}
</script>
<!-- /장비추가 널 체크  -->



<!-- 장비추가 modal selectbox ajax -->
<script type="text/javascript">
	var fn_cate_select = function(url, params) {
		$.ajax({
					type : "POST",
					url : url,
					data : {
						"CATEGORY_SEQ" : params
					},
					dataType : 'json',
					cache : false,
					success : function(data) { 
						
						/* subCate 목록 생성 */
						var sub_cate = "<option disabled selected>Choose your option</option>";
						
						$.each(data, function(i) {
							sub_cate += "<option value='"
									+ (data[i])['SUB_CATEGORY_SEQ'] + "'>"
									+ (data[i])['SUB_CATEGORY_NAME']
									+ "</option>";
						});
						
						$("#subCate").html(sub_cate);
						$('select').formSelect();
 
						/* subCate 목록 선택 시 선택된 value값 얻어옴  */
						 $("#subCate").on(
								'change',
								function() {
									if (this.value !== "") {
										var selOption = $(this).find(
												":selected").val();
										$("#equipInsert").attr(
												"action",
												"<c:url value='/admin/equip/equip_merge?SUB_CATEGORY_SEQ="
														+ selOption + "'/>");
									}
								});
						/* subCate 목록 선택 시 선택된 value값 얻어옴  */

					 },
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});
	}

	function cateSelect(param) {
		fn_cate_select("<c:url value='/wsEquip/subCateList'/>", param);
	};  
</script>
<!-- /장비추가 modal selectbox ajax -->



<style>
.box {
	border: none;
	margin: 0;
}
</style>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">장비관리</a> <a href="#!"
				class="breadcrumb">장비관리</a> <a href="#!" class="breadcrumb">장비목록</a>
		</div>
	</div>

</nav>
<!-- /페이지 이름 -->
<!-- main -->
<div class="main_body row" style="width: 70%">

	<!-- 수정부분 -->
	<!-- 좌측카테고리 -->
	<div class="box col s2">
		<ul class="collapsible">
			<c:forEach items="${resultMap.resultCateList}" var="resultCate"
				varStatus="loop">
				<li>
					<div class="collapsible-header">${resultCate.CATEGORY_NAME}</div>
					<div class="collapsible-body collection">
						<c:forEach items="${resultMap.resultSubCateList}"
							var="resultSubCate" varStatus="loop2">
							<c:if
								test="${resultCate.CATEGORY_SEQ == resultSubCate.CATEGORY_SEQ}">
								<a
									href="<c:url value='/admin/equip/equip_listByCate?SUB_CATEGORY_SEQ=${resultSubCate.SUB_CATEGORY_SEQ}'/>"
								class="collection-item">${resultSubCate.SUB_CATEGORY_NAME}</a>
							</c:if>
						</c:forEach>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- /좌측카테고리 -->

	<!-- 장비목록 -->
	<div class="col s10">
		<div class="row">
			<c:forEach items="${resultMap.resultEquipList}" var="resultData"
				varStatus="loop">
				<div class="col s12 m4">
					<div class="card hoverable">
						<div class="card-image waves-effect waves-block waves-light">
							 <%-- <img class="activator" src="<c:url value='/resources/images/lasercutter.PNG'/>"> --%>
							 <img class="activator"	src="<c:url value='/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>">
						</div>
						<div class="card-content">
							<span style="cursor: pointer;" class="activator grey-text text-darken-4">${resultData.EQUIP_NAME}
								<i class="material-icons right">more_vert</i>
							</span>
						</div>
						<div class="card-reveal">
							<span class="card-title grey-text text-darken-4">${resultData.EQUIP_NAME}<i
								class="material-icons right">close</i></span>
							<p>장비 설명 : ${resultData.DESCRIPTION}</p>
							<p>관리자 : ${resultData.MANAGER}</p>
						</div>
						<div class="card-action">
							<a href="<c:url value='/admin/equip/equip_edit?EQUIP_SEQ=${resultData.EQUIP_SEQ}'/>">수정</a>
							<a class="btn_delete" href="<c:url value='/admin/equip/equip_delete?EQUIP_SEQ=${resultData.EQUIP_SEQ}'/>">삭제</a>
							<span class="right">${resultData.AVAILABLE}</span>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
</div>
<!-- /장비목록 -->

<!-- 장비추가 modal -->
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<div class="row">
				<div class="input-field col s12">
				<span><i class="modal-close material-icons right">close</i></span>
					<h4>장비추가</h4>
				</div>
			</div>
			<form name="equipInsert" id="equipInsert" class="col s12" method="POST" action="<c:url value='/admin/equip/equip_merge'/>" enctype="multipart/form-data">
				<input type="hidden" name="forwardView"	value="/admin/equip/equip_list" />
				<div class="row">
					<div class="input-field col s6">
						<select onchange="cateSelect(this.value);">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateList}" var="resultCate"
								varStatus="loop">
								<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
							</c:forEach>
						</select> <label>장비위치</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<select id="subCate">
						</select> <label>장비종류</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="EQUIP_SEQ" id="equip_seq" type="text" class="validate">
						<label for="equip_seq">장비아이디</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="EQUIP_NAME" id="equip_name" type="text" class="validate">
						<label for="equip_name">장비명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="MANUFACTURER" id="manufacturer" type="text"
							class="validate"> <label for="manufacturer">제조사</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="MANAGER" id="manager" type="text" class="validate">
						<label for="manager">관리자</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea name="DESCRIPTION" id="description"
							class="materialize-textarea"></textarea>
						<label for="description">장비 설명</label>
					</div>
				</div>
					<div class="row">
					<label for="available">사용가능여부</label>
				<div class="input-field inline col s12">
					<p id="available">
						<label> <input name="AVAILABLE" value="사용가능" type="radio"/> <span>사용가능</span>
						</label>
					
						<label> <input name="AVAILABLE" value="사용불가" type="radio" /> <span>사용불가</span>
						</label>
					</p>
				</div>
			</div>
					<div class="row">
					<label for="available">능력카드 필요여부</label>
				<div class="input-field inline col s12">
					<p id="ability">
						<label> <input name="ABILITY" value="T" type="radio"/> <span>능력카드 필요</span>
						</label>
					
						<label> <input name="ABILITY" value="F" type="radio" /> <span>능력카드 불필요</span>
						</label>
					</p>
				</div>
			</div>

				<div class="file-field input-field">
					<div class="btn">
						<span>File</span> <input type="file" id="attachedfiles" name="ATTACHEDFILES">
					</div>
					<div class="file-path-wrapper">
						<input id="image" name="IMAGE" class="file-path validate" type="text"
							placeholder="장비이미지">
					</div>
				</div>
				<input type="hidden" name="FILE_SEQ" value="${resultMap.resultObject.ATTACHFILE_SEQ}" />
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn waves-effect waves-light" onclick="return checkNull();"
			name="action">
			장비추가 <i class="material-icons right">send</i>
		</button>
	</div>
	</form>
</div>
<!-- /장비추가 modal -->

<!-- 장비추가버튼 -->
<div class="fixed-action-btn">
	<a class="btn-floating btn-large red modal-trigger" href="#modal1">
		<i class="large material-icons">add</i>
	</a>
</div>
<!-- /장비추가버튼 -->

<!-- /수정부분 -->

<!-- /main -->

