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
					<c:forEach items="${resultList}" var="resultData" varStatus="loop">
						<tr
							class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
							
								<%-- <td>${resultData.MEMBER_SEQ}</td> --%>
							<td><a href="<c:url value="/admin/member/member_read?MEMBER_ID=${resultData.ID}" />">${resultData.ID}</td>
							<td>${resultData.NAME}</td>
							<%-- <td>${resultData.PASSWORD}</td> --%>
							<%-- <td>${resultData.SUB_ADDR_SEQ}</td> --%>
							<td>${resultData.TEL}</td>
							<td><c:forEach items="${resultData.ABILITY_NAMES}"
									var="NAMES" varStatus="loop2">
							${NAMES.ABILITY_NAME}
							</c:forEach></td>
						
						</tr>

						<%-- <tbody>
				<c:forEach items="${resultMap}" var="resultData" varStatus="loop">
					<tr class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
						<td>${resultData.MEMBER_SEQ}</td>
						<td>${resultData.NAME}</td>
						<td>${resultData.ID}</td>
						<td>${resultData.PASSWORD}</td>
						<td>${resultData.SUB_ADDR_SEQ}</td>
						<td>${resultData.TEL}</td>
						<td>
					<c:forEach items="${resultMap}" var="resultAbility" varStatus="loop">
						${resultAbility.ABILITY_NAME}
					</c:forEach>
					</td>
					</tr> --%>
						<!-- <tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>dl</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>임진희</td>
						<td>wlsgml</td>
						<td>dla</td>
						<td>인천광역시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr> -->
					</c:forEach>
				</tbody>
			</table>

		</div>
		<!-- 회원목록 table -->


		<!-- pagenation -->
		<div class="pagination " style="text-align: center;">
			<ul class="pagination">
				<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
				<li class="active"><a href="#!">1</a></li>
				<li class="waves-effect"><a href="#!">2</a></li>
				<li class="waves-effect"><a href="#!">3</a></li>
				<li class="waves-effect"><a href="#!">4</a></li>
				<li class="waves-effect"><a href="#!">5</a></li>
				<li class="waves-effect"><a href="#!"><i
						class="material-icons">chevron_right</i></a></li>
			</ul>
		</div>
		<!-- /pagenation -->


		<a class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_edit'/>">수정</a> <a
			class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_read'/>">읽기</a>
		<!-- /수정부분 -->
	</div>
	<!-- /main -->
</div>