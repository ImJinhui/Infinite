<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

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
	<div class="row">
		<a class="waves-effect waves-light btn right"><i
			class="material-icons left">add</i>추가</a>
	</div>
	<div class="box">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>능력번호</th>
					<th>능력 이름</th>
					<th>등록일</th>
					<th>담당자</th>
					<th>수정 삭제</th>
					
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>af876e5ty</td>
					<td>3D프린터</td>
					<td>2017.05.01</td>
					<td>김은지</td>
					<td>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_edit'/>">수정</a>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_read'/>">삭제</a>
					</td>
				</tr>
				
				<tr>
					<td>af876e5ty</td>
					<td>3D프린터</td>
					<td>2017.05.01</td>
					<td>김은지</td>
					<td>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_edit'/>">수정</a>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_read'/>">삭제</a>
					</td>
				</tr>
				
				<tr>
					<td>af876e5ty</td>
					<td>3D프린터</td>
					<td>2017.05.01</td>
					<td>김은지</td>
					<td>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_edit'/>">수정</a>
						<a class="waves-effect waves-light btn-small"
						href="<c:url value='/admin/ability/ability_read'/>">삭제</a>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	

	<!-- /수정부분 -->
</div>
<!-- /main -->



