<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
$(document).ready(function() {
	$('.modal').modal({
		endingTop : '5%'
	}
	);
});
$(document).ready(function() {
	$('select').formSelect();

});
</script>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">능력카드관리</a> <a href="#!"
				class="breadcrumb">능력카드목록</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<!-- main -->
<div class="main_body" style="width: 50%">
	<!-- 수정부분 -->
	<div class="box">
		<table class="highlight centered">
			<thead>
				<tr>
					<th>능력번호</th>
					<th>능력 이름</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>

			<tbody>
					<c:forEach items="${resultList}" var="resultData" varStatus="loop" >
						<tr
							class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
							<td>${resultData.test_col}</td>
							<%-- <td>${resultData.ABILITY_NAME}</td> --%>
							<td><a class="waves-effect waves-light btn-small"
								href="<c:url value='/admin/ability/ability_edit'/>">수정</a></td>
							<td><a class="waves-effect waves-light btn-small"
								href="<c:url value='/admin/ability/ability_read'/>">삭제</a></td>
						</tr>
						</c:forEach>
						</tbody>
		</table>
	</div>
	<!-- modal -->
	<div id="modal1" class="modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="row">
					<div class="input-field col s12">
						<h4>능력추가</h4>
					</div>
				</div>
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<input id="name" type="text" class="validate"> <label
								for="name">능력 이름</label>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-close waves-effect waves-teal btn">능력추가</a>
		</div>
	</div>


	<!-- modal -->
	<!-- 추가버튼 -->
	<div class="fixed-action-btn">
		<a class="btn-floating btn-large red modal-trigger" href="#modal1">
			<i class="large material-icons">add</i>
		</a>
	</div>
	<!-- /추가버튼 -->

	<!-- /수정부분 -->
</div>
<!-- /main -->



