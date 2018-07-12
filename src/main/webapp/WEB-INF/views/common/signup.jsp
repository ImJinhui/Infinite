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

	<div class="row box">
		<form class="col s12">
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">face</i> <input id="name"
						type="text" class="validate"> <label for="name">이름</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">account_circle</i> <input id="id"
						type="text" class="validate"> <label for="id">아이디</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i> <input id="password"
						type="password" class="validate"> <label for="password">비밀번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">lock</i> <input id="password_c"
						type="password" class="validate"> <label for="password_c">비밀번호
						재확인</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i> <input id="tel"
						type="tel" class="validate"> <label for="tel">전화번호</label>
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
						<option value="" disabled selected>Choose your option</option>

						<c:forEach items="${resultList}" var="resultData" varStatus="loop">
							<option value="${resultData.ADDR_SEQ}">${resultData.ADDR_NAME}</option>
						</c:forEach>
					</select> <label>주소</label>
				</div>

				<div class="input-field col s6">
					<!-- 소분류 -->
					<!-- onChange="cate2Select();" -->
					<select name="cate2" id="cate2" >
							
					</select>
				</div>
			</div>

			<!-- 	<SCRIPT LANGUAGE="JavaScript">
				function fn_data_change(obj) {
					var row_num = obj.cate2.length - 1; //기본(선택해주세요)는 제외하고 계산

					//셀레트박스1에서 다시 선택했을 경우..셀렉트박스2의 기존 옵션값들은 삭제한다.

					if (row_num != 0) {
						var x = document.getElementById("cate2")
						for (var k = 1; k <= row_num; k++) {

							//이부분 때문에 시간이 많이 걸렸다.. 
							//처음에는 x.remove(k)로 처리했는데..계속 값이 삭제되지 않고 남아있는 것이었다.
							//왜 그러지 왜 그러지 하면서..값을 계속 확인해보면서.. 1시간 정도는 헤맸다..-_-;;
							//결론은 첫번째 값을 삭제하면 그 뒤의 값은 하나씩 땡겨지므로.. 
							// 1만 적으면 되는거였다. orz
							//x.remove(option순서);
							x.remove(1);
						}
					}

					var sel_value = obj.cate1[obj.cate1.selectedIndex].value;

					var oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP")
					var sUrl = "xhp_test.asp?sel_value=" + sel_value;

					oXMLHTTP.open("GET", sUrl, false);
					oXMLHTTP.send();

					inner_value = oXMLHTTP.responseText.split(";");

					for (var i = 0; i < inner_value.length; i++) {
						var obj_node = document.createElement("option"); //option 객체를 생성
						document.frm_sel.cate2.appendChild(obj_node);

						option_value = inner_value[i].split("/"); //텍스트와 값 구분

						obj_node.innerText = option_value[0];
						obj_node.value = option_value[1];

					}
				}
			</SCRIPT> -->



			<div class="row">
				<!--         <div class="col s12"> -->
				<!--           This is an inline input field: -->
				<!--           <div class="input-field inline"> -->
				<!--             <input id="email_inline" type="email" class="validate"> -->
				<!--             <label for="email_inline">Email</label> -->
				<!--             <span class="helper-text" data-error="wrong" data-success="right">Helper text</span> -->
				<!--           </div> -->
				<!--         </div> -->
				<div class="row">
					<div class="input-field col s12">
						<a class="waves-effect waves-light btn-large"
							style="width: 100%; margin: 0 auto;">회원가입</a>
					</div>
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
 		
		$.ajax({
					type : "GET",					//서버에 보낼 request 방식
					url : "<c:url value='/subadd'/>",			//서버에서 받을 url
					dataType : "json",
					data : {"ADDR_SEQ" : value},			//Controller에 보낼 데이터(value = ADDR_SEQ 보내짐)
					////////
					success : function(result) {			//서버에서 반환받은 데이터를 result에 담는다.
						var list = result.addrList;
						console.log(result.addrList);
						//SELECT BOX 초기화           
		/* 				$("#cate2")
								.find("option")
								.remove()
								.end()
								.append(
										"<option value=''>Choose your option</option>"); */
										
					var category="<option value='' disabled selected>Choose your option</option>";

						//배열 개수 만큼 option 추가
						$.each(list, function(i) {
							
							console.log((list[i])['SUB_ADDR_NAME']);
/* 							$("#cate2").append(
									"<option value='"+(list[i])['SUB_ADDR_SEQ']+"'>"
											+ (list[i])['SUB_ADDR_NAME'] + "</option>"); */
						category +="<option value='"+(list[i])['SUB_ADDR_SEQ']+"'>" + (list[i])['SUB_ADDR_NAME'] + "</option>";
						
						});
						console.log(category);
						$("#cate2").html(category);
						
					 	document.addEventListener('DOMContentLoaded', function() {
							var elems = document.querySelectorAll('select');
							var instances = M.FormSelect.init(elems, options);
						}); 
					 	$('select').formSelect();
					 	
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("오류가 발생하였습니다.");
					}
				});
	}
</script>


