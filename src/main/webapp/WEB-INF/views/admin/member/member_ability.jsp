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
<!-- 
<script>
	var ability_check = function() {

		var ability_seq = $("#ability").val();
		/* var member_seq = $("paramMap.MEMBER_SEQ") */
		$
				.ajax({
					type : "GET", //서버에 보낼 request 방식
					url : "<c:url value='/abilitycheck'/>", //서버에서 받을 url
					dataType : "json",
					data : {
						"ability_seq" : ability_seq
					}, //Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
					////////
					success : function(result) { //서버에서 반환받은 데이터를 result에 담는다.
						console.log(result);

						if (result == null) {
							alert("능력이 추가되었습니다.");
							$('form')
									.attr(
											"action",
											"<c:url value='/admin/member/ability_insert?MEMBER_SEQ=${paramMap.MEMBER_SEQ}'/>");
						} else {
							alert("이미 존재하는 능력입니다.");
						}

					},

					error : function(jqXHR, textStatus, errorThrown) {
					}
				});

	}
</script> -->


<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" method="POST" role="form"
			action="<c:url value='/admin/member/ability_insert?MEMBER_SEQ=${paramMap.MEMBER_SEQ}'/>"
			name="AbilityInsertForm" id="AbilityInsertForm">

			<!-- 		<input type="hidden" name="forwardView"
				value="/admin/member/member_ability" /> -->

			<div class="row">
				<div class="input-field col s12">
					<select name="ability" id="ability" class="ability"
						onchange="checkAbility(this.value);">
						<option value="0" disabled selected>능력이름</option>

						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<option value="${resultData.ABILITY_SEQ}">${resultData.ABILITY_NAME}</option>
						</c:forEach>
					</select>
				</div>
			</div>


			<script>
				var checkAbility = function(value) {
					console.log(value);
					$
							.ajax({
								type : "GET", //서버에 보낼 request 방식
								url : "<c:url value='/abilitycheck'/>", //서버에서 받을 url
								data : {
									"ability_seq" : value,
									"member_seq" : "${paramMap.MEMBER_SEQ}"
								}, //Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
								////////
								success : function(result) { //서버에서 반환받은 데이터를 result에 담는다.
									//console.log("결과값 : " + result.resultData);
									//console.log("크기 : " + (result.resultData).length);
									if ((result.resultData).length == 0) {

									console.log(flag);
											$('form')
													.attr(
															"action",
															"<c:url value='/admin/member/ability_insert?MEMBER_SEQ=${paramMap.MEMBER_SEQ}'/>");
										
									} else {

										alert("이미 존재하는 능력입니다.");
										$("#ability").val("0").prop("selected",true);
									}

								},

								error : function(jqXHR, textStatus, errorThrown) {
									alert("error");
									/* $("#ability option:eq(0)").prop("selected", true); */
									 /* $('select.ability option[value=0]').attr('selected','selected'); */	 						}
							});

				}
			</script>


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
				id="insertBtn">
				추가 <i class="material-icons right">edit</i>
			</button>

		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



