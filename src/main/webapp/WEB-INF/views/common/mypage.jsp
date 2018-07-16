<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<style>
.fomr_input {
	margin-left: 7px;
	margin-top: -7px;
}
</style>

<script>
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
<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">마이페이지</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->
<div class="main_body" style="width: 50%;">
	<!-- 수정부분 -->

	<div class="row box">
		<form class="col s12" role="form" name="myForm" method="POST"
			action="<c:url value='/admin/member/update'/>">

			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i> <input id="name"
						type="text" class="validate" name="NAME" value="${resultMap.NAME}">
					<!-- <div class="fomr_input">NAME</div> -->
					<label for="name">이름</label>
					<%-- <input type="hidden" name="MEMBER_SEQ" style="display:none">${resultMap.MEMBER_SEQ}</input>  --%>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">account_circle</i> <input id="id"
						type="text" name="ID" value="${resultMap.ID}">
					<!-- <div class="fomr_input">ID</div> -->
					<label for="id">아이디</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i> <input id="password"
						type="password" class="validate" name="PASSWORD" value="${resultMap.PASSWORD}">
					<!-- <div class="fomr_input">PASSWORD</div> -->
					<label for="password">비밀번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i> <input id="tel"
						type="tel" class="validate" name="TEL" value="${resultMap.TEL}">
					<!-- <div class="fomr_input">PHONE</div> -->
					<label for="tel">전화번호</label>
				</div>
			</div>

			<%-- <div class="row">
				<div class="input-field col s5">	
					<i class="material-icons prefix">home</i>
					<!-- <select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select> <label>주소</label> -->
					<input id="add" type="text" class="validate"> <div class="fomr_input">HOME</div><label
						for="add">${resultMap.ADDR_NAME}</label>
				</div>
				<div class="input-field col s4">
					<!-- <select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
					<input id="add" type="text" class="validate">
				</select> -->
					<input id="sub_add" type="text" class="validate"> <label
						for="sub_add">${resultMap.SUB_ADDR_NAME}</label>
				</div>
			</div> --%>

			<div class="row">
				<div class="input-field col s12">
					<button class="waves-effect waves-light btn-large"
						style="width: 100%; margin: 0 auto;" type="submit">내 정보
						수정</button>
				</div>
			</div>

		</form>
	</div>
</div>
<!-- /수정부분 -->
<!-- /main -->



