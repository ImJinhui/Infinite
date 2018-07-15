<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<script>

$(document).ready(function(){
     $('.collapsible').collapsible();  
    
    $('.modal').modal({
		endingTop : '5%'
	});
    $('select').formSelect();
  });
	

</script>
<!-- 장비추가 modal selectbox ajax -->
<script type="text/javascript">
var fn_cate_select = function(url, params) {
	$.ajax({
		type : "POST", 
		url : url, 
		data : {"CATEGORY_SEQ" : params}, 
		dataType:'json',
		cache: false,
		success: function(data){
			  var sub_cate = "<option value='' disabled selected>Choose your option</option>";
			  /* $("#subCate").find("option").remove().end().append("<option value='' disabled selected>Choose your option</option>"); */
			   $.each(data, function(i){
				   sub_cate += "<option value='"+(data[i])['SUB_CATEGORY_SEQ']+"'>"+(data[i])['SUB_CATEGORY_NAME']+"</option>";
			   /*  $("#subCate").append("<option value='"+data[i].SUB_CATEGORY_SEQ+"'>"+data[i].SUB_CATEGORY_NAME+"</option>") */
			   });    
			   $("#subCate").html(sub_cate);
			   
				$('select').formSelect();
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

<style>
.box {
	border:none;
	margin:0;
}
</style>
<!-- 카테고리별 장비 목록 불러오는 ajax -->
<script>
 /* var fn_cate_equipList = function(url, id, params) {
	$.ajax({
		type : "POST", 
		url : url, 
		data : {"SUB_CATEGORY_SEQ" : params}, 
		dataType:'json',
		cache: false,
		success : function(data) {
			alert(data);
			var formTag = ""; */
			/* formTag += "<div id='equip0' class='col s10'><div class='row'>"; */
			/* $.each(data, function(i, item) {
				formTag += '<div class="col s12 m4"><div class="card">';
				formTag += '<div class="card-image waves-effect waves-block waves-light">';
				formTag += '<img class="activator" src="<c:url value="/resources/images/lasercutter.PNG"/></div>">';
				formTag += '<div class="card-content">';
				formTag += '<span class="card-title activator grey-text text-darken-4">'+item.EQUIP_PLACE_NAME;
				formTag += '<i class="material-icons right">more_vert</i></span></div>';
				formTag += '<div class="card-reveal"><span class="card-title grey-text text-darken-4">'+item.EQUIP_PLACE_NAME;
				formTag += '<i class="material-icons right">close</i></span>';
				formTag += '<p>'+item.DESCRIPTION+'</p>';
				formTag += '</div></div></div>';
			}); */
				/* formTag += '</div></div>'; */
			/* $('#'+id).html(formTag);
		},
		error : function(xhr, status, exception){
			alert("Failure \n ("+status+")");
			return false; 
		}
		});
	}

	function equipList(param) {
		fn_cate_equipList("<c:url value='/wsEquip/equipList'/>", "setEquipList", param);
		
	};  */
</script>



<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">장비·장소관리</a> <a href="#!"
				class="breadcrumb">장비관리</a> <a href="#!" class="breadcrumb">장비목록</a>
		</div>
	</div>
	
</nav>
<!-- /페이지 이름 -->
<!-- main -->
<div class="main_body row" style="width: 70%">

	<!-- 수정부분 -->
	<!-- 장비관리list -->
	

<!-- 좌측카테고리 -->
	<div class="box col s2">
		<ul class="collapsible">
			<c:forEach items="${resultMap.resultCateList}" var="resultCate"	varStatus="loop">
				<li>
					<div class="collapsible-header">${resultCate.CATEGORY_NAME}</div>
					<div class="collapsible-body collection">
						<c:forEach items="${resultMap.resultSubCateList}" var="resultSubCate" varStatus="loop2">
							<c:if
								test="${resultCate.CATEGORY_SEQ == resultSubCate.CATEGORY_SEQ}">
								<a href="<c:url value='/admin/equip/equip_listByCate?SUB_CATEGORY_SEQ=${resultSubCate.SUB_CATEGORY_SEQ}'/>" <%-- onclick="equipList(${resultSubCate.SUB_CATEGORY_SEQ})" --%> class="collection-item">${resultSubCate.SUB_CATEGORY_NAME}</a>
							</c:if>
						</c:forEach>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
<!-- /좌측카테고리 -->

<!-- 장비목록 -->
		<div id="equip0" class="col s10">
			<div class="row">
				<c:forEach items="${resultMap.resultEquipListByCate}" var="resultData" varStatus="loop">
						<div class="col s12 m4">
							<div class="card">
								<div class="card-image waves-effect waves-block waves-light">
									<img class="activator"
										src="<c:url value='/resources/images/lasercutter.PNG'/>">
								</div>
								<div class="card-content">
									<span class="card-title activator grey-text text-darken-4">${resultData.EQUIP_PLACE_NAME}
										<i class="material-icons right">more_vert</i>
									</span>
									<p>${resultData.MANUFACTURER}</p>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4">${resultData.EQUIP_PLACE_NAME}<i
										class="material-icons right">close</i></span>
									<p>${resultData.DESCRIPTION}</p>
									<p>${resultData.SUB_CATEGORY_SEQ}</p>
									<p>${resultData.EQIP_PLACE_SEQ}</p>
									<p>${resultData.MANAGER}</p>
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
					<h4>장비추가</h4>
				</div>
			</div>
			<form class="col s12">
				<div class="row">
					<div class="input-field col s6">
						<select onchange="cateSelect(this.value);">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateList}" var="resultCate" varStatus="loop">
							<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
							</c:forEach>
						</select> <label>장비위치</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<select id="subCate">
							<!-- <option value="" disabled selected>Choose your option</option> -->
						</select> <label>장비종류</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="name" type="text" class="validate"> <label
							for="name">장비명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="manufacturer" type="text" class="validate"> <label
							for="manufacturer">제조사</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-teal btn">장비추가</a>
	</div>
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

