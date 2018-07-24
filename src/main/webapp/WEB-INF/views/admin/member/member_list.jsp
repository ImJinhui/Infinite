<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page isELIgnored="false"%>

<!-- 검색카테고리 script -->
<script>
	$(document).ready(function() {
		$('select').formSelect();
	});

	$('#dataTables-example').DataTable({
		responsive : true,
		"paging" : false,
		"ordering" : false,
		"info" : false
	});
</script>

<!-- 검색카테고리 script -->

<style>
.row {
	margin-bottom: 0;
}
</style>
<!-- main -->

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">회원관리</a> <a href="#!"
				class="breadcrumb">회원목록</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->

	<!-- 검색카테고리 -->
	<div class="search">
		<div class="box">
			<div class="row" style="padding-left: 4rem">
				<!-- /검색카테고리 -->

				<form class="col s12"
					action="<c:url value="/admin/member/member_search"/>">
					<div class="input-field col s3">
						<!-- style="display: inline-block; width: 30%;" -->
						<select name=searchitem id=searchitem>
							<option value="" disabled selected>검색 목록</option>
							<option value="name">이름</option>
							<option value="id">아이디</option>
							<option value="tel">전화번호</option>
						</select>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<input id="input" name=input type="text" class="validate">
							<label for="name">검색어를 입력하세요</label>
						</div>
						<div class="input-field col s2">
							<button class="btn waves-effect waves-light" type="submit"
								name="action">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /검색부분 -->

		<!-- 회원목록 table -->
		<div class="box">
			<table class="highlight centered">
				<thead>
					<tr>
						<!-- <th>회원번호</th> -->
						<th>아이디</th>
						<th>이름</th>
						<!-- <th>비밀번호</th> -->
						<!-- 	<th>주소</th> -->
						<th>전화번호</th>
						<th>보유능력</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${resultMap.resultList}" var="resultData"
						varStatus="loop">
						<tr style="cursor: pointer;"
							onclick="location.href='<c:url value="/admin/member/member_read?MEMBER_SEQ=${resultData.MEMBER_SEQ}"/>'"
							onMouseOver="window.status = '<c:url value="/admin/member/member_read?MEMBER_SEQ=${resultData.MEMBER_SEQ}" />'"
							onMouseOut=" window.status = '' ">

							<td>${resultData.ID}</td>
							<td>${resultData.NAME}</td>
							<td>${resultData.TEL}</td>

							<c:set value="${resultData.ABILITY_NAMES.size()}"
								var="abilityCnt">
							</c:set>

							<c:choose>
								<c:when test="${abilityCnt>2}">
									<!-- //보유 능력이 2개 이상일때 -->
									<td><c:forEach begin="1" end="2"
											items="${resultData.ABILITY_NAMES}" var="NAMES"
											varStatus="loop2">
											<c:choose>
												<c:when test="${loop2.last}">
							${NAMES.ABILITY_NAME}</c:when>
												<c:otherwise>		
							${NAMES.ABILITY_NAME},
							</c:otherwise>
											</c:choose>
										</c:forEach>....</td>

								</c:when>
								<c:otherwise>
									<!-- //보유 능력이 2개 미만일때 -->
									<td><c:forEach items="${resultData.ABILITY_NAMES}"
											var="NAMES" varStatus="loop2">
											<c:choose>
												<c:when test="${loop2.last}">
							${NAMES.ABILITY_NAME}</c:when>
												<c:otherwise>		
							${NAMES.ABILITY_NAME},
							</c:otherwise>
											</c:choose>
										</c:forEach></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>

					<%-- <c:forEach items="${resultMap.resultList}" var="resultData"
						varStatus="loop">
						<tr style="cursor: pointer;"
							onclick="location.href='<c:url value="/admin/member/member_read?MEMBER_SEQ=${resultData.MEMBER_SEQ}"/>'"
							onMouseOver="window.status = '<c:url value="/admin/member/member_read?MEMBER_SEQ=${resultData.MEMBER_SEQ}" />'"
							onMouseOut=" window.status = '' ">

							<td>${resultData.ID}</td>
							<td>${resultData.NAME}</td>
							<td>${resultData.TEL}</td>
							<td><c:forEach items="${resultData.ABILITY_NAMES}"
									var="NAMES" varStatus="loop2">
							${NAMES.ABILITY_NAME}
							</c:forEach></td>

						</tr>
					</c:forEach> --%>
				</tbody>

				<%-- 				
 --%>

			</table>



		</div>
		<!-- 회원목록 table -->


		<!-- pagenation -->
		<div class="pagination " style="text-align: center;">

			<ul class="pagination">

				<c:set var="page" value="${resultMap.pagination}" />
				<c:if test="${resultMap.pagination!=null}">
					<div id="dataTabes_paginate paging_simple_numbers"
						id="dataTables-example_paginate">
						<ul class="pagination center-align">
							<li class="pagination_button previous disabled"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="<c:url value="/admin/member/member_list?curPage=${page.prevPage}"/>"><i
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
											href="<c:url value="/admin/member/member_list?curPage=${pageNum}" />">${pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="paginate_button next waves-effect"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_next"><a
								href="<c:url value="/admin/member/member_list?curPage=${page.nextPage}" />"><i
									class="material-icons">chevron_right</i></a></li>
						</ul>
					</div>


				</c:if>


				
		</div>

		<!-- /수정부분 -->
	</div>
	<!-- /main -->
</div>
