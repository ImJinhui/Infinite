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
				<div class="input-field col s3">
					<!-- style="display: inline-block; width: 30%;" -->
					<select>
						<option value="" disabled selected>검색 목록 선택</option>
						<option value="1">이름</option>
						<option value="2">전화번호</option>
					</select>
				</div>
				<!-- /검색카테고리 -->

				<form class="col s9">
					<div class="row">
						<div class="input-field col s10">
							<input id="name" type="text" class="validate"> <label
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
				<%-- 	<c:if test="${pageMaker.preview}">
					<li class="disabled"><a
						href="<c:url value="/admin/member/list?page=${pageMaker.start -1}" />"><i
							class="material-icons">chevron_left</i></a></li>
				</c:if>

				<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
					var="idx">
					<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'><a
						href="<c:url value="list?page=${idx}"/>">${idx}</a></li>
				</c:forEach>

				<!-- <li class="waves-effect"><a href="#!">2</a></li>
				<li class="waves-effect"><a href="#!">3</a></li>
				<li class="waves-effect"><a href="#!">4</a></li>
				<li class="waves-effect"><a href="#!">5</a></li> -->
				<c:if test="${pageMaker.next}">

					<li class="waves-effect"><a href="#!"><i
							class="material-icons">chevron_right</i></a></li>
				</c:if> --%>



				<c:set var="page" value="${resultMap.pagination}" />
				Showing ${page.pageBegin} to ${page.pageEnd} of ${page.totalCount}
				entries
				<%-- 	<a
					href="<c:url value="/admin/member/list_pagination?curPage=${page.prevPage}" />">
					Previous</a> --%>
				<a
					href="<c:url value="/admin/member/member_list?curPage=${page.prevPage}" />">
					Previous</a>
				<c:forEach var="pageNum" begin="${page.pageBegin}"
					end="${page.pageEnd}">
					<c:choose>
						<c:when test="${pageNum==page.curPage}">
							<a
								href="<c:url value="/admin/member/member_list?pageNum=${pageNum}"/>">${pageNum}</a>
						</c:when>
						<c:otherwise>

							<a
								href="<c:url value="/admin/member/member_list?curPage=${pageNum}"/>">
								${pageNum}</a>

						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a
					href="<c:url value="/admin/member_list?curPage=${page.nextPage}" />">
					Next</a>


			</ul>
		</div>



		<!-- 페이징  -->
		<%-- <c:choose>
			<c:when
				test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
				<div class="text-center marg-top">
					<ul class="pagination">
						<c:if test="${paging.currentPageNo gt 5}">
							<!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
							<li><a
								href="<c:url value="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})"/>">이전</a></li>
							<!-- 이전페이지 표시 -->
						</c:if>
						<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
						<c:forEach var="i" begin="${paging.startPageNo}"
							end="${paging.endPageNo}" step="1">
							<!-- 변수선언 (var="i"), 조건식, 증감식 -->
							<c:choose>
								<c:when test="${i eq paging.currentPageNo}">
									<li class="active"><a
										href="<c:url value="javascript:goPage(${i}, ${paging.maxPost})"/>">${i}</a></li>
									<!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
								</c:when>
								<c:otherwise>
									<li><a
										href="<c:url value="javascript:goPage(${i}, ${paging.maxPost})"/>">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 파란색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
						<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->

						<!-- 소수점 제거 =>-->
						<fmt:parseNumber var="currentPage" integerOnly="true"
							value="${(paging.currentPageNo-1)/5}" />
						<fmt:parseNumber var="finalPage" integerOnly="true"
							value="${(paging.finalPageNo-1)/5}" />

						<c:if test="${currentPage < finalPage}">
							<!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
							<li><a
								href="<c:url value="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})"/>">다음</a></li>
						</c:if>
					</ul>
				</div>
			</c:when>
		</c:choose>

		<script>
			function goPage(pages, lines) {
				location.href = '?' + "pages=" + pages;
			}
		</script> --%>

		<!-- /pagenation -->


		<a class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_edit'/>">수정</a> <a
			class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_read'/>">읽기</a>
		<!-- /수정부분 -->
	</div>
	<!-- /main -->
</div>