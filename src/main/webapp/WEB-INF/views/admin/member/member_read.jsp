<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">회원관리</a> <a href="#!"
				class="breadcrumb">회원조회</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->


<!-- main -->
<div class="main_body" style="width: 70%">

	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" method="POST"
			action="<c:url value='/admin/member/member_admin_update'/>">

			<div class="row">
				<div class="input-field col s12">
					<input id="member_seq" type="text" class="validate"
						value="${resultMap.MEMBER_SEQ}" readonly> <label for="ability_seq">회원
						번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_name" type="text" class="validate"
						value="${resultMap.NAME}"> <label for="member_name">이름</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_id" type="text" class="validate"
						value="${resultMap.ID}"> <label for="member_id">아이디</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="member_password" type="text" class="validate"
						value="${resultMap.PASSWORD}"> <label
						for="member_password">비밀번호</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s12">
					<input id="member_pass" type="text" class="validate"
						value="${resultMap.ADDR_NAME}"> <label
						for="member_address">주소</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_pass" type="text" class="validate"
						value="${resultMap.SUB_ADDR_NAME}"> <label
						for="member_sub_address">상세주소</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_tel" type="text" class="validate"
						value="${resultMap.TEL}"> <label for="member_tel">전화번호</label>
				</div>
			</div>

			<%-- 	<div class="row">
				<div class="input-field col s12">

					<c:forEach items="${resultList}" var="resultData" varStatus="loop">

						<input id="member_ability_name" type="text" class="validate"
							value="${resultData.ABILITY_NAME}">
						<input id="member_ability_manager" type="text" class="validate"
							value="${resultData.MANAGER}">
						<input id="member_ability_date" type="text" class="validate"
							value="${resultData.OBTAIN_DATE}">
						<label for="member_ability">보유 능력</label>
					</c:forEach>
				</div>
			</div> --%>

			<!-- 능력테이블 -->
			<div class="row">
				<div class="input-field col s12">
					<label for="member_ability">보유 능력</label> <a
						class="btn-floating btn-large waves-effect waves-light red right"
						href="<c:url value="/admin/member/member_ability?MEMBER_SEQ=${resultMap.MEMBER_SEQ}"/>"><i
						class="material-icons">add</i></a></br> </br> </br>
					<table class="highlight centered">
						<thead>
							<tr>
								<th>보유 능력 이름</th>
								<th>담당자</th>
								<th>발급 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${resultList}" var="resultData"
								varStatus="loop">
								<tr
									class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">

									<td>${resultData.ABILITY_NAME}</td>
									<td>${resultData.MANAGER}</td>
									<td>${resultData.OBTAIN_DATE}</td>
							</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /능력테이블 -->

			<button class="btn waves-effect waves-light right" type="submit"
				name="action">
				수정 <i class="material-icons right">edit</i>
			</button>
			<button class="btn waves-effect waves-light right" type="button"
				name="action" onclick="member_delete()"><a href="<c:url value='/admin/member/member_delete?'/>"></a>
				삭제 <i class="material-icons right">delete</i>
				
			</button>
			
		 	<script type="text/javascript">
				var member_delete = function() {
					var id = $('#member_id').val();

					$.ajax({
						type : "GET", //서버에 보낼 request 방식
						url : "<c:url value='/admin/member/member_delete'/>", //서버에서 받을 url
						dataType : "json",
						data : {
							"id" : id
							
						}, //Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
						////////
						success : function(result) { //서버에서 반환받은 데이터를 result에 담는다.
							console.log(result);
							alert("회원 삭제가 완료되었습니다.")
						},

						error : function(jqXHR, textStatus, errorThrown) {
							alert("오류발생");
						}
					});

				}
			</script>
 
		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



