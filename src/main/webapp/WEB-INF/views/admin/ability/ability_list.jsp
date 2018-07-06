<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<style>
.card {
	padding: 2rem;
}
</style>

<!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">능력카드관리</a>
        <a href="#!" class="breadcrumb">능력카드목록</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->
<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_edit'/>">수정</a>
					<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_read'/>">읽기</a>
	<div class="card">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>능력번호</th>
					<th>능력 이름</th>
					<th>등록일</th>
					<th>담당자</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>af876e5ty</td>
					<td>3D프린터</td>
					<td>2017.05.01</td>
					<td>김은지</td>
				</tr>
				<tr>
					<td>af876e5tr</td>
					<td>레이저커터</td>
					<td>2017.05.01</td>
					<td>이대연</td>

				</tr>
				<tr>
					<td>af876e5te</td>
					<td>목공기계</td>
					<td>2017.05.01</td>
					<td>임진희</td>
				</tr>
				<tr>
					<td>af876e5te</td>
					<td>봉제기계</td>
					<td>2017.05.30</td>
					<td>임진희</td>
				</tr>
			</tbody>
		</table>
	</div>
	<a class="waves-effect waves-light btn-large"
		style="float: right; color: teal lighten-2">능력추가</a>

	<!-- /수정부분 -->
</div>
<!-- /main -->



