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
		
		var authority = ${resultMap.AUTHORITY_SEQ}
		console.log(authority);
		if(authority=='1'){
			 $('#user').prop("checked", true); //radio button
		}else if(authority=='2'){
			 $('#admin').prop("checked", true); //radio button
		}
	});
	
	
</script>
<script type="text/javascript">
	var comboChange = function(value) {
		console.log(value);

		$
				.ajax({
					type : "GET", //서버에 보낼 request 방식
					url : "<c:url value='/subadd'/>", //서버에서 받을 url
					dataType : "json",
					data : {
						"ADDR_SEQ" : value
					}, //Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
					////////
					success : function(result) { //서버에서 반환받은 데이터를 result에 담는다.
						var list = result.addrList;
						console.log(result.addrList);
						//SELECT BOX 초기화           
						/* 				$("#cate2")
												.find("option")
												.remove()
												.end()
												.append(
														"<option value=''>Choose your option</option>"); */

						var category = "<option value='' disabled selected>군,구</option>";

						//배열 개수 만큼 option 추가
						$.each(list, function(i) {

							console.log((list[i])['SUB_ADDR_NAME']);
							/* 							$("#cate2").append(
							 "<option value='"+(list[i])['SUB_ADDR_SEQ']+"'>"
							 + (list[i])['SUB_ADDR_NAME'] + "</option>"); */
							category += "<option value='"
									+ (list[i])['SUB_ADDR_SEQ'] + "'>"
									+ (list[i])['SUB_ADDR_NAME'] + "</option>";

						});
						console.log(category);
						$("#cate2").html(category);

						document.addEventListener('DOMContentLoaded',
								function() {
									var elems = document
											.querySelectorAll('select');
									var instances = M.FormSelect.init(elems,
											options);
								});
						$('select').formSelect();

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("오류가 발생하였습니다.");
					}
				});
	}
</script>
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


<!-- main -->
<div class="main_body" style="width: 70%">

	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" method="POST"
			action="<c:url value='/admin/member/member_admin_update'/>">

			<div class="row">
				<div class="input-field col s12">
					<input id="member_seq" type="text" class="validate"
						name="MEMBER_SEQ" value="${resultMap.MEMBER_SEQ}" readonly>
					<label for="ability_seq">회원 번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_name" type="text" class="validate" name="NAME"
						value="${resultMap.NAME}"> <label for="member_name">이름</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_id" type="text" class="validate" name="ID"
						value="${resultMap.ID}"> <label for="member_id">아이디</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="member_password" type="text" class="validate"
						name="PASSWORD" value="${resultMap.PASSWORD}"> <label
						for="member_password">비밀번호</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s12">

					<!-- 대분류 -->
					<select name="cate1" id="cate1" class="sel_cate"
						onchange="comboChange(this.value);">
						<option value="${resultMap2.ADDR_SEQ}" >${resultMap2.ADDR_NAME}</option>

						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<option value="${resultData.ADDR_SEQ}">${resultData.ADDR_NAME}</option>
						</c:forEach>
					</select> <label>주소</label>
				</div>

				<div class="input-field col s12">
					<!-- 소분류 -->
					<!-- onChange="cate2Select();" -->
					<select name="cate2" id="cate2">
						<option value="${resultMap2.SUB_ADDR_SEQ}" >${resultMap2.SUB_ADDR_NAME}</option>
					</select>

				</div>
			</div>



			<div class="row">
				<div class="input-field col s12">
					<input id="member_tel" type="text" class="validate" name="TEL"
						value="${resultMap.TEL}"> <label for="member_tel">전화번호</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s12">
				
					<p>
						<label> <input name="AUTHORITY_SEQ" id="admin" value ="2" type="radio"  /> <span>매니저</span>
						</label>
					</p>
					<p>
						<label> <input name="AUTHORITY_SEQ" id="user" value="1" type="radio"  /> <span>일반회원</span>
						</label>
					</p>

				</div>
			</div>

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
							<c:forEach items="${resultList2}" var="resultData"
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
				name="action" onclick="member_delete()">
				<a href="<c:url value='/admin/member/member_delete?'/>"></a> 삭제 <i
					class="material-icons right">delete</i>

			</button>


		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



