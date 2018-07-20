<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!-- 검색카테고리 script -->
<script>
	$(document).ready(function() {
		$('select').formSelect();
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

				<form class="col s12" action="<c:url value="/admin/member/member_search"/>">
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
							<input id="input" name=input type="text" class="validate"> <label
								for="name">검색어를 입력하세요</label>
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
						<tr
							class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">

							<%-- <td>${resultData.MEMBER_SEQ}</td> --%>
							<td><a
								href="<c:url value="/admin/member/member_read?MEMBER_SEQ=${resultData.MEMBER_SEQ}" />">${resultData.ID}</td>
							<td>${resultData.NAME}</td>
							<%-- <td>${resultData.PASSWORD}</td> --%>
							<%-- <td>${resultData.SUB_ADDR_SEQ}</td> --%>
							<td>${resultData.TEL}</td>
							<td><c:forEach items="${resultData.ABILITY_NAMES}"
									var="NAMES" varStatus="loop2">
							${NAMES.ABILITY_NAME}
							</c:forEach></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>



		</div>
		<!-- 회원목록 table -->


		<!-- pagenation -->
		<div class="pagination " style="text-align: center;">

			<ul class="pagination">
		

				<c:set var="page" value="${resultMap.pagination}" />
				Showing ${page.pageBegin} to ${page.pageEnd} of ${page.totalCount}
				entries
				<%-- 	<a
					href="<c:url value="/admin/member/list_pagination?curPage=${page.prevPage}" />">
					Previous</a> --%>
				<a href="<c:url value="/admin/member/member_list?curPage=${page.prevPage}" />"> Previous</a>
				<c:forEach var="pageNum" begin="${page.pageBegin}" end="${page.pageEnd}">
					<c:choose>
						<c:when test="${pageNum==page.curPage}">
							<a href="<c:url value="/admin/member/member_list?pageNum=${pageNum}"/>">${pageNum}</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value="/admin/member/member_list?curPage=${pageNum}"/>">${pageNum}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="<c:url value="/admin/member_list?curPage=${page.nextPage}" />"> Next</a>


			</ul>
		</div>



		<a class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_edit'/>">수정</a> <a
			class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_read'/>">읽기</a>
		<!-- /수정부분 -->
	</div>
	<!-- /main -->
</div>