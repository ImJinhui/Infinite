<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>
.tabs {
	overflow-x: hidden;
}
</style>
<script>
	$(document).ready(function() {
		$('.modal').modal({
			dismissible : false
		});
		$('select').formSelect();
		$('.tabs').tabs();
		
		/* subCate 목록 선택 시 선택된 value값 얻어옴  */
		/* $("#cate").on(
				'change',
				function() {
					if (this.value !== "") {
						var selOption = $(this).find(
								":selected").val();
						$("#cateInsert").attr(
								"action",
								"<c:url value='/admin/category/subCategory_merge?CATEGORY_SEQ="
										+ selOption + "'/>");
					}
				}); */
	});
	
</script>

<!-- 삭제 확인창 -->
<script>
	function deleteAlert(name, seq) {
		alert("'" + name + "' 을 삭제하시겠습니까?");
		/* $("#deleteLink").attr("href","<c:url value='/admin/equip/equip_delete?EQUIP_SEQ="+seq+"'/>");
		var deleteLink = "<c:url value='/admin/equip/equip_delete?EQUIP_SEQ="+seq+"'/>";
		location.href=deleteLink;  */
	}
</script>
<!-- /삭제 확인창 -->
<script>
	function checkNull() {
		if ($("#category_seq").val().length < 1) {
			alert("대분류번호값을 입력해주세요");
			$("#category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#category_name").val().length < 1) {
			alert("대분류이름값을 입력해주세요");
			$("#category_name").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#sub_category_seq").val().length < 1) {
			alert("중분류번호값을 입력해주세요");
			$("#sub_category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#sub_category_name").val().length < 1) {
			alert("중분류이름값을 입력해주세요");
			$("#sub_category_name").focus();
			return $('#cateInsert').submit(false);
		}
		return $('#cateInsert').submit();
	}
</script>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">장비관리</a> <a href="#!"
				class="breadcrumb">카테고리관리</a> <a href="#!" class="breadcrumb">카테고리목록</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->
<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<div class="row">
	
	<!-- 탭메뉴 -->
		<div class="col s12">
			<ul class="tabs">
				<li class="tab col s6"><a href="#test1">대분류</a></li>
				<li class="tab col s6"><a href="#test2">중분류</a></li>
			</ul>
		</div>
	<!-- /탭메뉴 -->
	
	<!-- 대분류list -->
		<div id="test1" class="col s12">
			<div class="row box">
				<table class="highlight centered">
					<thead>
						<tr>
							<th>대분류 번호</th>
							<th>대분류 이름</th>
							<th>수정 / 삭제</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${resultMap.cateList}" var="cateList" varStatus="loop">
							<tr>
								<td>${cateList.CATEGORY_SEQ}</td>
								<td>${cateList.CATEGORY_NAME}</td>

								<td><a class="waves-effect waves-light btn-small"
									href="<c:url value='/admin/category/category_edit?CATEGORY_SEQ=${cateList.CATEGORY_SEQ}'/>">수정</a>
									<a class="waves-effect waves-light btn-small"
									href="<c:url value='/admin/category/category_delete?CATEGORY_SEQ=${cateList.CATEGORY_SEQ}'/>">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 대분류추가버튼 -->
			<div class="fixed-action-btn">
				<a class="btn-floating btn-large red modal-trigger" href="#modal1">
					<i class="large material-icons">add</i>
				</a>
			</div>
			<!-- /대분류추가버튼 -->
		</div>
	<!-- /대분류list -->
	
	<!-- 중분류list -->
		<div id="test2" class="col s12">
			<div class="row box">
				<table class="highlight centered">
					<thead>
						<tr>
							<th>대분류 번호</th>
							<th>대분류 이름</th>
							<th>중분류 번호</th>
							<th>중분류 이름</th>
							<th>수정 / 삭제</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${resultMap.allCateList}" var="allCateList" varStatus="loop">
							<tr>
								<td>${allCateList.CATEGORY_SEQ}</td>
								<td>${allCateList.CATEGORY_NAME}</td>
								<td>${allCateList.SUB_CATEGORY_SEQ}</td>
								<td>${allCateList.SUB_CATEGORY_NAME}</td>

								<td><a class="waves-effect waves-light btn-small"
									href="<c:url value='/admin/category/category_edit?SUB_CATEGORY_SEQ=${allCateList.SUB_CATEGORY_SEQ}'/>">수정</a>
									<a class="waves-effect waves-light btn-small"
									href="<c:url value='/admin/category/category_delete?SUB_CATEGORY_SEQ=${allCateList.SUB_CATEGORY_SEQ}'/>">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 중분류추가버튼 -->
			<div class="fixed-action-btn">
				<a class="btn-floating btn-large blue modal-trigger" href="#modal2">
					<i class="large material-icons">add</i>
				</a>
			</div>
			<!-- /중분류추가버튼 -->
		</div>
<!-- /중분류list -->
	</div>
</div>


<!-- 대분류추가 modal -->
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<div class="row">
				<div class="input-field col s12">
					<span><i class="modal-close material-icons right">close</i></span>
					<h4 class="center-align">대분류추가</h4>
				</div>
			</div>

			<form id="cateInsert" class="col s12" method="POST"
				action="<c:url value='/admin/category/category_merge'/>">
				<input type="hidden" name="forwardView"
					value="/admin/category/category_list" />

				<div class="row">
					<div class="input-field col s12">
						<input name="CATEGORY_SEQ" id="category_seq" type="text"
							class="validate"> <label for="category_seq">대분류번호</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="CATEGORY_NAME" id="category_name" type="text"
							class="validate"> <label for="category_name">대분류이름</label>
					</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<!-- <button class="btn waves-effect waves-light" onclick="checkNull();"	name="action"> -->
		<button class="btn waves-effect waves-light" type="submit" name="action">
			추가 <i class="material-icons right">send</i>
		</button>
	</div>
	</form>
</div>
<!-- /대분류추가 modal -->

<!-- 중분류추가 modal -->
<div id="modal2" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<div class="row">
				<div class="input-field col s12">
					<span><i class="modal-close material-icons right">close</i></span>
					<h4>중분류추가</h4>
				</div>
			</div>

			<form id="cateInsert" class="col s12" method="POST"
				action="<c:url value='/admin/category/subCategory_merge'/>">
				<input type="hidden" name="forwardView"
					value="/admin/category/category_list" />
				<div class="row">
					<div class="input-field col s6">
						<select id="cate" name="CATEGORY_SEQ">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.cateList}" var="cateList"
								varStatus="loop">
								<option value="${cateList.CATEGORY_SEQ}">${cateList.CATEGORY_NAME}</option>
							</c:forEach>
						</select> <label>대분류선택</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="SUB_CATEGORY_SEQ" id="sub_category_seq" type="text"
							class="validate"> <label for="sub_category_seq">중분류번호</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="SUB_CATEGORY_NAME" id="sub_category_name" type="text"
							class="validate"> <label for="sub_category_name">중분류이름</label>
					</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<!-- <button class="btn waves-effect waves-light" onclick="checkNull();"	name="action"> -->
		<button class="btn waves-effect waves-light" type="submit"	name="action">
			추가 <i class="material-icons right">send</i>
		</button>
	</div>
	</form>
</div>
<!-- /중분류추가 modal -->

<!-- 카테고리추가버튼 -->
<!-- <div class="fixed-action-btn">
	<a class="btn-floating btn-large red modal-trigger" href="#modal1">
		<i class="large material-icons">add</i>
	</a>
</div>  -->
<!-- /카테고리추가버튼 -->
<!-- /수정부분 -->

<!-- /main -->