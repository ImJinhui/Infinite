<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

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
			<a href="#!" class="breadcrumb">회원가입</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->
<div class="main_body" style="width: 50%;">
	<!-- 수정부분 -->


	<script>
		function checkform() {
			if (document.myForm.password.value=="") { // 자바스크립트 : 빈문자열 -> false 반환
				alert("비밀번호를 입력해주세요.");
				document.myForm.focus();
				return false;
			} else if(document.myForm.idcheck.value==""){
				alert("비밀번호가 일치하지 않습니다.");
				document.myForm.focus();
				return false;
			} else if(document.myForm.ID.value==""){
				alert("아이디를 입력해주세요.");
				document.myForm.focus();
				return false;
			} 
		}
	</script>

	<div class="row box">
		<form class="col s12" role="form" name="myForm" method="POST"
			action="<c:url value='/admin/member/insert'/>"
			onsubmit="return checkform()">
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i> <input id="name"
						type="text" class="validate" name="NAME"> <label
						for="name">이름</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">account_circle</i> <input id="id"
						type="text" class="validate" name="ID"> <label for="id">아이디</label>

					<a class="waves-effect waves-light btn-small" type="button"
						style="border-left: 30px" onclick="idcheck()">중복체크</a>
					<div id="idcheck" name="idcheck"></div>
				</div>
			</div>


			<script>
				var idcheck = function() {
					var id = $('#id').val();

					$.ajax({
						type : "GET", //서버에 보낼 request 방식
						url : "<c:url value='/idcheck'/>", //서버에서 받을 url
						dataType : "json",
						data : {
							"id" : id
						}, //Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
						////////
						success : function(result) { //서버에서 반환받은 데이터를 result에 담는다.
							console.log(result.ID);
							$("#idcheck").text("사용 불가능한 아이디입니다.");

						},

						error : function(jqXHR, textStatus, errorThrown) {
							$("#idcheck").text("사용가능한 아이디입니다.");
						}
					});

				}
			</script>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i> <input id="password"
						type="password" class="validate" name="PASSWORD"> <label
						for="password">비밀번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i> <input id="password_c"
						type="password" class="validate"> <label for="password_c">비밀번호
						재확인</label>
					<div id="passcheck"></div>
					<!-- <div id="passcheck" class="helper-text" data-error="비밀번호가 일치하지 않습니다."></div> -->
				</div>
			</div>


			<script>
				$('#password_c').focusout(function() {

					var firstpass = $('#password').val();
					var secondpass = $('#password_c').val();

					if (firstpass != secondpass) {
						$("#passcheck").text("비밀번호가 일치하지 않습니다");
						/*  $("#passcheck").attr("data-error","비밀번호가 일치하지 않습니다.");  */
					}
				});

				$('#password_c').onfocus(function() {
					/* if($('#password_c').val!=null){ */
					$("#passcheck").text("");
					/* } */
				});
			</script>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i> <input id="tel"
						type="tel" class="validate" name="TEL"> <label for="tel">전화번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">email</i> <input id="email"
						type="email" class="validate"> <label for="email">이메일</label>
					<span class="helper-text" data-error="이메일 형식이 아닙니다."
						data-success="이메일 형식이 맞습니다."></span>
				</div>
			</div>
			<!--   <div class="row">
			<div class="input-field col s5">
      		<i class="material-icons prefix">home</i>
				<select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select> <label>주소</label>
			</div>
			<div class="input-field col s4">
    			  <select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select>
			</div>
			</div> -->
			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">home</i>
					<!-- 대분류 -->
					<select name="cate1" id="cate1" class="sel_cate"
						onchange="comboChange(this.value);">
						<option value="" disabled selected>시,도</option>

						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<option value="${resultData.ADDR_SEQ}">${resultData.ADDR_NAME}</option>
						</c:forEach>
					</select> <label>주소</label>
				</div>

				<div class="input-field col s6">
					<!-- 소분류 -->
					<!-- onChange="cate2Select();" -->
					<select name="cate2" id="cate2">
						<option value="" disabled selected>군,구</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="row_title" style="margin-left: 10px; margin-top: 13px;">
					<i class="material-icons prefix">create</i> 개인정보 수집, 조회, 활용 제공 동의서
				</div>
				<div class="box" style="overflow-y: auto;">
					<h6>개인정보, 프로젝트 내용공유, 안전사고 및 시설피해 책임</h6>

					<p>
						(관련법령 개인정보보호법 제15조, 제17조, 제24조)</br> -금천구 무한상상 스페이스 운영을 위해 아래와 같이 개인정보를
						수집하고 있습니다.</br> </br>
						<개인정보를 제공받는자> </br>
						금천구 무한상상 스페이스 한국과학창의재단</br>
						</br>
						<개인정보의 수집.이용 목적> </br>
						이용자 정보를 확보하여 원활한 운영(자격 검토, 프로그램 안내)을 위함</br>
						</br>
						<수집.이용되는 개인정보 항복> </br>
						성명, 휴대폰 번호, 생년월일, 이메일 등 </br>
						</br>
						<개인정보의 보유 및 이용기간> </br>
						신청일로부터 1년 </br>
						</br>
						<개인정보 수집, 동의 거부의 권리 및 불이익 고지> </br>
						신청자는 개인정보 수집 동의에 거부할 권리가 있습니다. 다만 개인정보 수집을 거부할 경우 신청자격 검토 및 기타
						운영관련 안내에 대한 사항의 고지가 불가능하여 이용 신청을 거부할 수 있습니다. 
					</p>
					</br> </br> <label> <input type="checkbox" class="filled-in"
						checked="checked" /> <span>동의합니다.</span>
					</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<button class="waves-effect waves-light btn-large"
						style="width: 100%; margin: 0 auto;" type="submit;">회원가입</button>
				</div>
			</div>
		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->

<script>
	//AJAX select box
	/* 	var cate1 = $("#cate1").val(); */

	/* $(function(){
	 $("#product").change(function(){
	 if($("#product").val()==""){
	 $("#sub").find("option").remove().end().append(select);	
	 }else{
	 comboChange($(this).val());
	 }
	 });
	 */

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


