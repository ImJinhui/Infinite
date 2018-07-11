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
	$(document).ready(function() {
		$('.tabs').tabs();
	});
</script>

<style>
.card {
	
}
</style>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">장비·장소관리</a> <a href="#!"
				class="breadcrumb">장비관리</a> <a href="#!" class="breadcrumb">장비목록</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->
<!-- main -->
<div class="main_body" style="width: 70%">

	<!-- 수정부분 -->
	<!-- 장비관리list -->
	<div class="row">
		<div class="card col s12" style="padding: 0">
			<ul class="tabs">
				<li class="tab col m3 s12"><a class="active" href="#equip1">레이저커터</a></li>
				<li class="tab col m3 s12"><a href="#equip2">3D 프린터</a></li>
				<li class="tab col m3 s12"><a href="#equip3">목공기계</a></li>
				<li class="tab col m3 s12"><a href="#equip4">봉제기계</a></li>
			</ul>
		</div>
		<div id="equip1" class="col s12">
			<div class="row">
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<img class="activator"
								src="<c:url value='/resources/images/lasercutter.PNG'/>">
						</div>
						<div class="card-content">
							<span class="card-title activator grey-text text-darken-4">레이저커터
								<i class="material-icons right">more_vert</i>
							</span>
							<p>레이저픽스코리아</p>
							<p>
								<a href="#">예약내역</a>
							</p>
						</div>
						<div class="card-reveal">
							<span class="card-title grey-text text-darken-4">레이저커터<i
								class="material-icons right">close</i></span>
							<p>
								◎ 모델명 : CUBICON Single Plus​ <br>◎ 방식: FDM(FFF) 방식​ <br>◎​
								재료 : PLA 필라멘트 / 흰색 <br>◎ 노줄직경 : 0.4mm <br>◎​ 조형크기: 최대
								240 x 190 x 200​​mm(W x D x H) 50 x 50 x 50mm 이하 파일을 권장합니다. <br>​◎지원포멧
								: STL 파일
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="equip2" class="col s12">
			<div class="row">
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<img class="activator"
								src="<c:url value='/resources/images/lasercutter.PNG'/>">
						</div>
						<div class="card-content">
							<span class="card-title activator grey-text text-darken-4">3D
								프린터 <i class="material-icons right">more_vert</i>
							</span>
							<p>레이저픽스코리아</p>
						</div>
						<div class="card-reveal">
							<span class="card-title grey-text text-darken-4">3D 프린터<i
								class="material-icons right">close</i></span>
							<p>
								◎ 모델명 : CUBICON Single Plus​ <br>◎ 방식: FDM(FFF) 방식​ <br>◎​
								재료 : PLA 필라멘트 / 흰색 <br>◎ 노줄직경 : 0.4mm <br>◎​ 조형크기: 최대
								240 x 190 x 200​​mm(W x D x H) 50 x 50 x 50mm 이하 파일을 권장합니다. <br>​◎지원포멧
								: STL 파일
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="equip3" class="col s12">

			<div class="row"></div>
		</div>
		<div id="equip4" class="col s12">
			<div class="row"></div>
		</div>
	</div>
	<!--/ 장비관리list -->
</div>

<!-- modal -->
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<div class="row">
				<div class="input-field col s12">
					<h4>장비추가</h4>
				</div>
			</div>
			<form class="col s12">
				<div class="row">
					<div class="input-field col s6">
						<select>
							<option value="" disabled selected>Choose your option</option>
							<option value="1">Option 1</option>
							<option value="2">Option 2</option>
							<option value="3">Option 3</option>
						</select> <label>장비종류</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<select>
							<option value="" disabled selected>Choose your option</option>
							<option value="1">Option 1</option>
							<option value="2">Option 2</option>
							<option value="3">Option 3</option>
						</select> <label>관리자</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="name" type="text" class="validate"> <label
							for="name">장비명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="manufacturer" type="text" class="validate"> <label
							for="manufacturer">제조사</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-teal btn">장비추가</a>
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

<!-- /main -->