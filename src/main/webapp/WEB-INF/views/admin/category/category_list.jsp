<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<script>
	$(document).ready(function() {
		$('.modal').modal();
	});
	$(document).ready(function() {
		$('select').formSelect();

	});

	$(document).ready(function() {
		$('.tabs').tabs();
	});
</script>

<style>
.card {
	
}
</style>

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

	<div class="row box">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>대분류 번호</th>
					<th>대분류 이름</th>
					<th>중분류 번호</th>
					<th>중분류 이름</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${resultList}" var="resultData" varStatus="loop">
					<tr>
						<td>${resultData.CATEGORY_SEQ}</td>
						<td>${resultData.CATEGORY_NAME}</td>
						<td>${resultData.SUB_CATEGORY_SEQ}</td>
						<td>${resultData.SUB_CATEGORY_NAME}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- 카테고리추가버튼 -->
<div class="fixed-action-btn">
	<a class="btn-floating btn-large red modal-trigger" href="#modal1">
		<i class="large material-icons">add</i>
	</a>
</div>
<!-- /카테고리추가버튼 -->
<!-- /수정부분 -->

<!-- /main -->