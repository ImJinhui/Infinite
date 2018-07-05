<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!-- 검색카테고리 script -->
<script>
	$(document).ready(function() {
		$('select').formSelect();
	});
</script>

<!-- 검색카테고리 script -->

<style>
.card {
	padding: 2rem;
}

.row {
	margin-bottom: 0;
}
</style>
<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->

	<!-- 	<div class="search">
		<form name="sub_form" id="sub_form" method="get"
			action="/equip/equipment.php" onsubmit="return find_string()"
			class="sub_sch_box">
			<input type="hidden" name="tsort" value="3"> <input
				type="hidden" name="msort" value="12"> <input type="hidden"
				name="page" value="51">
			row
			<div class="row">
				<label for="search">검색</label>
				<div class="slt_box" style="width: 17%;">
					<select name="s_agency_area" id="s_agency_area"
						onchange="agency_no_change(this.value,'')">
						<option value="" disabled selected>검색목록 선택</option>
						<option value="seach_name">이름</option>
						<option value="seach_tel">전화번호</option>

					</select>
				</div>

				<div class="input_box">
					<label for="kwd" class="hide">검색어 입력</label> <input type="text"
						name="key" id="key" value="" placeholder="검색어를 입력해주세요.">
				</div>
			</div>
			// row
			<a onclick="find_string();" style="cursor: pointer"
				class="st_sch_btn"><span class="m_txt">검색</span></a>
		</form>

	</div>
</div>
 -->

	<!-- 검색카테고리 -->


	<div class="search">
		<div class="card">
			<label>회원 검색</label>
			<div class="row"  style="padding-left: 4rem"> 
				<div class="input-field col s3">
					<!-- style="display: inline-block; width: 30%;" -->
					<select>
						<option value="" disabled selected>검색 목록 선택</option>
						<option value="1">이름</option>
						<option value="2">전화번호</option>
					</select>
				</div>
				<!-- /검색카테고리 -->

				<!-- 검색부분 -->
				<!-- <div class="input_box col s9" >style="display: inline-block; width: 60%;"
				<input class="input-field inline" type="text"	name="key" id="key" value="" placeholder="검색어를 입력해주세요.">
			<a onclick="find_string();"
				style="cursor: pointer; background-color: white;" class="btn-small"><span
				class="m_txt" style="color: black;">검색</span></a>
			</div> -->

				<form class="col s9">
					<div class="row">
						<div class="input-field col s10">
							<input id="name" type="text" class="validate"> <label
								for="name">검색어를 입력하세요</label>
						</div>
						<div class="input-field col s2">
							<button class="btn waves-effect waves-light" type="submit"
								name="action">검색</button>
						</div>
					</div>
				</form>


			</div>
		</div>
		<!-- /검색부분 -->

		<a class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_edit'/>">수정</a> <a
			class="waves-effect waves-light btn-small"
			href="<c:url value='/admin/member/member_read'/>">읽기</a>


		<!-- 회원목록 table -->
		<div class="card">
			<table class="highlight centered">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>보유능력</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>

					</tr>
					<tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>dl</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>임진희</td>
						<td>wlsgml</td>
						<td>dla</td>
						<td>인천광역시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member2</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>3D 두들러펜, 목공직소톱</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member3</td>
						<td>이대연</td>
						<td>dleodus</td>
						<td>qkqh</td>
						<td>경상남도 창원시</td>
						<td>010788788999</td>
						<td>VR, 3D스캐너</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr>
					<tr>
						<td>member1</td>
						<td>김은지</td>
						<td>eunji</td>
						<td>12345</td>
						<td>서울시 서대문구</td>
						<td>01011112222</td>
						<td>3D 프린터, 레이저커터</td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- 회원목록 table -->


		<!-- pagenation -->
		<div class="pagination " style="text-align: center;">
			<ul class="pagination">
				<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
				<li class="active"><a href="#!">1</a></li>
				<li class="waves-effect"><a href="#!">2</a></li>
				<li class="waves-effect"><a href="#!">3</a></li>
				<li class="waves-effect"><a href="#!">4</a></li>
				<li class="waves-effect"><a href="#!">5</a></li>
				<li class="waves-effect"><a href="#!"><i
						class="material-icons">chevron_right</i></a></li>
			</ul>
		</div>

		<!-- /pagenation -->

		<!-- /수정부분 -->
	</div>
	<!-- /main -->
</div>