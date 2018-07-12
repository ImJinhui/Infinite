<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<script>
$(document).ready(function(){
    $('.collapsible').collapsible();
  });
	$( function() {
	    $( ".tabs" ).tabs({
	      collapsible: true
	    });
	  } );
	$(document).ready(function() {
		$('.modal').modal({
			endingTop : '5%'
		});
	});
	$(document).ready(function() {
		$('select').formSelect();
	});
/* 	$(document).click(function() {
		$('.tabs').tabs();
	}); 
*/
  
</script>

<style>
.box {
	border:none;
	margin:0;
}
.tabs {
  height: 100%;
}

</style>

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
			<c:forEach items="${resultMap.resultCateObject}" var="resultCate"
				varStatus="loop">
				<li>
					<div class="collapsible-header">${resultCate.CATEGORY_NAME}</div>
					<div class="collapsible-body collection">
						<c:forEach items="${resultMap.resultSubCateObject}"
							var="resultSubCate" varStatus="loop2">
							<c:if
								test="${resultCate.CATEGORY_SEQ == resultSubCate.CATEGORY_SEQ}">
								<a href="#equip${loop2.index}" class="collection-item">${resultSubCate.SUB_CATEGORY_NAME}</a>
							</c:if>
						</c:forEach>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- /좌측카테고리 -->


		<div id="equip0" class="col s10">
			<div class="row">
				<c:forEach items="${resultMap.resultEquipObject}" var="resultData" varStatus="loop">
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
		<div id="equip1">equip1</div>
	</div>
	
	<!--/ 장비관리list -->


<!-- modal -->
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
						<select>
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateObject}" var="resultCate" varStatus="loop">
							<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
							
							</c:forEach>
						</select> <label>장비위치</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<select>
							<option value="" disabled selected>Choose your option</option>
							<option value="1">Option 1</option>
							<option value="2">Option 2</option>
							<option value="3">Option 3</option>
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
<!-- modal -->
<!-- 추가버튼 -->
<div class="fixed-action-btn">
	<a class="btn-floating btn-large red modal-trigger" href="#modal1">
		<i class="large material-icons">add</i>
	</a>
</div>
<!-- /추가버튼 -->



<!-- /수정부분 -->

<!-- /main -->