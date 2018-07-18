<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">능력카드관리</a> <a href="#!"
				class="breadcrumb">능력카드수정</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<script>
	var doubleCheck = false;
	var passCheck = false;
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('select');
		var instances = M.FormSelect.init(elems, options);
	});

	// Or with jQuery

	$(document).ready(function() {
		$('select').formSelect();

	});
</script>


<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" method="POST"
			action="<c:url value='/admin/member/ability_insert?MEMBER_SEQ=${paramMap.MEMBER_SEQ}'/>">

			<!-- 		<input type="hidden" name="forwardView"
				value="/admin/member/member_ability" /> -->

			<div class="row">
				<div class="input-field col s12">
					<select name="ability" id="ability" class="ability">
						<option value="" disabled selected>능력이름</option>

						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<option value="${resultData.ABILITY_SEQ}">${resultData.ABILITY_NAME}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input name="MANAGER" id="ability_name" type="text"
						class="validate" value=""> <label for="ability_manager">담당자</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input name="OBTAIN_DATE" id="obtain_date" type="text"
						class="validate" value="${resultMap.OBTAIN_DATE}"> <label
						for="ability_manager">발급 날짜</label>
				</div>
			</div>


			<!-- <button class="btn waves-effect waves-light right" type="submit"
				name="action">
				삭제 <i class="material-icons right">delete</i>
			</button> -->
			<button class="btn waves-effect waves-light right" type="submit"
				name="action">
				추가 <i class="material-icons right">edit</i>
			</button>

		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



