<%@ page language="java"
	contentType="text/html; charset=UTF-8; application/vnd.ms-excel;"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
	$(document).ready(function() {
		$('.modal').modal({
			dismissible : false
		});
		$('select').formSelect();
	});

	$('#dataTables-example').DataTable({
		responsive : true,
		"paging" : false,
		"ordering" : false,
		"info" : false
	});
</script>

<script>
	function checkNull() {
		if ($("#category_seq").val().length < 1) {
			alert("대분류번호값을입력해주세요");
			$("#category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#category_name").val().length < 1) {
			alert("대분류이름값을입력해주세요");
			$("#category_name").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#sub_category_seq").val().length < 1) {
			alert("중분류번호값을입력해주세요");
			$("#sub_category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if ($("#sub_category_name").val().length < 1) {
			alert("중분류이름값을입력해주세요");
			$("#sub_category_name").focus();
			return $('#cateInsert').submit(false);
		}
		return $('#cateInsert').submit();
	}
</script>

<!-- 페이지이름-->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">결과물관리</a> <a href="#!"
				class="breadcrumb">결과물목록</a>
		</div>
	</div>
</nav>
<!-- /페이지이름-->
<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분-->

	<div class="row box">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>예약자</th>
					<th>예약일</th>
					<th>장비반납여부</th>
					<th>결과물제출여부</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${resultMap.resultList}" var="resultData"
					varStatus="loop">
					<tr style="cursor: pointer;"
						onclick="location.href='<c:url value="/admin/result/result_read?RESERVATION_SEQ=${resultData.RESERVATION_SEQ}"/>'"
						onMouseOver="window.status = '<c:url value="/admin/result/result_read?RESERVATION_SEQ=${resultData.RESERVATION_SEQ}"/>'"
						onMouseOut=" window.status = '' ">
						<td>${resultData.RESERVATION_SEQ}</td>
						<td>${resultData.NAME}</td>
						<td>${resultData.RESERVE_DATE}</td>
						<td>${resultData.RETURN_CHECK}</td>
						<td>${resultData.NUM_OF_PROTOTYPE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:set var="page" value="${resultMap.pagination}" />
		<div id="dataTabes_paginate paging_simple_numbers"
			id="dataTables-example_paginate">
			<ul class="pagination center-align">
				<li class="pagination_button previous disabled"
					aria-controls="dataTables-example" tabindex="0"
					id="dataTables-example_previous"><a
					href="<c:url value="/admin/result/result_list?curPage=${page.prevPage}"/>"><i
						class="material-icons">chevron_left</i></a></li>
				<c:forEach var="pageNum" begin="${page.blockStart}"
					end="${page.blockEnd}">
					<c:choose>
						<c:when test="${pageNum == page.curPage}">
							<li class="paginate_button waves-effect active"
								aria-controls="dataTables-example" tabindex="0"><a
								href="#!">${pageNum}</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button waves-effect"
								aria-controls="dataTables-example" tabindex="0"><a
								href="<c:url value="/admin/result/result_list?curPage=${pageNum}" />">${pageNum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="paginate_button next waves-effect"
					aria-controls="dataTables-example" tabindex="0"
					id="dataTables-example_next"><a
					href="<c:url value="/admin/result/result_list?curPage=${page.nextPage}" />"><i
						class="material-icons">chevron_right</i></a></li>
			</ul>
		</div>
	</div>
</div>

<!-- CATEGORY추가modal -->
 <div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">

		<div class="row">
			<div class="input-field col s12">
				<span><i class="modal-close material-icons right">close</i></span>
				<h4>결과물추가</h4>
			</div>
		</div>
		<div class="row">
			<form class="col s12">
				<div class="row">
					<div class="input-field col s6">
						<input id="reservation_seq" type="text" class="validate"
							value="${resultMap.RESERVATION_SEQ}"> <label
							for="reservation_seq">예약번호</label>
					</div>
					<div class="input-field col s6">
						<input id="member_seq" type="text" class="validate"
							value="${resultMap.NAME}"> <label for="member_seq">예약자</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<input id="reserve_date" type="text" class="validate"
							value="${resultMap.RESERVE_DATE}"> <label
							for="reserve_date">예약일</label>
					</div>
					<div class="input-field col s6">
						<input id="reserve_time" type="text" class="validate"
							value="${resultMap.RESERVE_S_TIME} ~ ${resultMap.RESERVE_E_TIME}">
						<label for="reserve_time">예약시간</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="equip_seq" type="text" class="validate"
							value="${resultMap.EQUIP_NAME}"> <label for="equip_seq">대여장비</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<input id="return_check" type="text" class="validate"
							value="${resultMap.RETURN_CHECK}"> <label
							for="return_check">반납여부</label>
					</div>
					<div class="input-field col s6">
						<input id="num_of_prototype" type="text" class="validate"
							value="${resultMap.NUM_OF_PROTOTYPE}"> <label
							for="num_of_prototype">시제품개수</label>
					</div>
				</div>
				<div class="file-field input-field">
					<div class="btn">
						<span>File</span> <input type="file" name="ATTACHEDFILES">
					</div>
					<div class="file-path-wrapper">
						<input id="image" name="IMAGE" class="file-path validate"
							type="text" placeholder="결과물이미지">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn waves-effect waves-light" onclick="checkNull();"
			name="action">
			추가<i class="material-icons right">send</i>
		</button>
	</div>
</div> 

<!-- /CATEGORY추가modal -->

<!-- 카테고리추가버튼-->
<!-- <div class="fixed-action-btn">
	<a class="btn-floating btn-large red modal-trigger" href="#modal1">
		<i class="large material-icons">add</i>
	</a>
</div> -->

<!-- /카테고리추가버튼-->
<!-- /수정부분-->

<!-- /main -->