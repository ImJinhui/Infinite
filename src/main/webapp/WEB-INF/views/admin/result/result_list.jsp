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
						<%-- <c:if test="null ne ${resultData.ATTACHFILE_SEQ}">
							<td>${resultData.NUM_OF_PROTOTYPE}</td>
						</c:if> --%>
						<c:choose>
							<c:when test="${null eq resultData.ATTACHFILE_SEQ}">
								<td>X</td>
							</c:when>
							<c:otherwise>
								<td>O</td>
							</c:otherwise>
						</c:choose>
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
<!-- /수정부분-->

<!-- /main -->