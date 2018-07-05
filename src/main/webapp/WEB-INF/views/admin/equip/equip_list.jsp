<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<script>
	$(document).ready(function() {
		$('.modal').modal();
	});
	$(document).ready(function() {
		$('select').formSelect();

	});

	$(document).ready(function() {
		$('.tabs').tabs();
	});
</script>

<!-- main -->
<div class="main_body" style="width: 70%">

	<!-- 수정부분 -->

	<div class="row">
		<div class="card col s12">
			<ul class="tabs">
				<li class="tab col s3"><a class="active" href="#equip1">레이저커터</a></li>
				<li class="tab col s3"><a href="#equip2">3D 프린터</a></li>
				<li class="tab col s3"><a href="#equip3">목공기계</a></li>
				<li class="tab col s3"><a href="#equip4">봉제기계</a></li>
			</ul>
		</div>
		<div id="equip1" class="col s12">
			레이저커터

			<div class="row">

				<div class="col s12 m4">
					<div class="card">
						<div class="card-image">
							<img src="<c:url value='/resources/images/lasercutter.PNG'/>">
							<!-- <span class="card-name" style="color: black;">레이저커터</span> -->
						</div>
						<div class="card-content">
							<div class="card-title">
								<label>장비명</label>
								<p class="form_title">레이저커터</p>
							</div>
							<div class="manufacturer">
								<label>제조사</label>
								<p class="form_manufacturer">레이저픽스코리아</p>
							</div>
							<div class="discript">
								<label>설명</label>
								<p class="form_discript">
									◎ 모델명 : CUBICON Single Plus​ ◎ 방식: FDM(FFF) 방식​ ◎​ 재료 : PLA
									필라멘트 / 흰색 ◎ 노줄직경 : 0.4mm
									<!-- ◎​ 조형크기: 최대 240
							x 190 x 200​​mm(W x D x H) 50 x 50 x 50mm 이하 파일을 권장합니다. -->
									​◎지원포멧 : STL 파일
								</p>
							</div>
							<div class="manager">
								<label>담당자</label>
								<p class="form_manager">김민채</p>
							</div>
						</div>
						<div class="card-action">
							<a href="#">예약내역</a>
						</div>
					</div>
				</div>
				<!-- card2 -->
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
							<p><a href="#">예약내역</a></p>
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
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<img class="activator"
								src="<c:url value='/resources/images/lasercutter.PNG'/>">
						</div>
						<div class="card-content">
							<span class="card-title activator grey-text text-darken-4">레이저커터</span>
						
						<div class="card-tabs">
							<ul class="tabs tabs-fixed-width">
								<li class="tab"><a href="#test4">제조사</a></li>
								<li class="tab"><a class="active" href="#test5">담당자</a></li>
								<li class="tab"><a href="#test6">설명</a></li>
							</ul>
						</div>
						<div class="card-content grey lighten-4">
							<div id="test4">레이저픽스코리아</div>
							<div id="test5">김민채</div>
							<div id="test6"><p>
								◎ 모델명 : CUBICON Single Plus​ <br>◎ 방식: FDM(FFF) 방식​ <br>◎​
								재료 : PLA 필라멘트 / 흰색 <br>◎ 노줄직경 : 0.4mm <br>◎​ 조형크기: 최대
								240 x 190 x 200​​mm(W x D x H) 50 x 50 x 50mm 이하 파일을 권장합니다. <br>​◎지원포멧
								: STL 파일
							</p></div>
						</div>
						</div>
					</div>
				</div>
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
			3D 프린터
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
			목공기계
			<div class="row"></div>
		</div>
		<div id="equip4" class="col s12">봉제기계<div class="row"></div></div>
	</div>



	<!--   장비관리 navbar -->
	<!-- <nav class="nav-extended">
		<div class="nav-wrapper">

			<a href="#" class="brand-logo" style="margin-left: 20px;">장비관리</a>
			
			<a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
				class="material-icons">menu</i></a>
 			<ul id="nav-mobile" class="right hide-on-med-and-down">
				<li><a href="sass.html">Sass</a></li>
				<li><a href="badges.html">Components</a></li>
				<li><a href="collapsible.html">JavaScript</a></li>
			</ul>
		</div>
		<div class="nav-content">
			<ul class="tabs tabs-transparent">
				<li class="tab"><a class="active" href="#test1">3D 프린터</a></li>
				<li class="tab"><a class="active" href="#test2">레이저커터</a></li>
				<li class="tab"><a class="active" href="#test3">목공기계</a></li>
				<li class="tab"><a class="active" href="#test4">봉제기계</a></li>
			</ul>
		</div>
	</nav> -->


	<!--   /장비관리 navbar -->

	<!-- 장비관리list -->


	<a class="waves-effect waves-light btn modal-trigger" href="#modal1"
		style="color: teallighten-2; float: right;">장비추가</a>

</div>
<div id="modal1" class="modal">
	<div class="modal-content">
		<div class="row">

			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons Medium">build</i>
					<h4 style="display: inline-block;">장비추가</h4>
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
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">장비추가</a>
	</div>
</div>
<!-- end of main_body -->



<!--/ 장비관리list -->

<!-- 장비관리 list -->
<!-- 
	<div class="equip_list">
		<ul class="collection">
			<li class="collection-item avatar"><i
				class="material-icons circle">build</i> <span class="title">Title</span>
				<p>
					First Line <br> Second Line
				</p> <a href="#!" class="secondary-content"><i
					class="material-icons">grade</i></a></li>

			<li class="collection-item avatar"><i
				class="material-icons circle">build</i> <span class="title">Title</span>
				<p>
					First Line <br> Second Line
				</p> <a href="#!" class="secondary-content"><i
					class="material-icons">grade</i></a></li>

			<li class="collection-item avatar"><i
				class="material-icons circle">build</i> <span class="title">Title</span>
				<p>
					First Line <br> Second Line
				</p> <a href="#!" class="secondary-content"><i
					class="material-icons">grade</i></a></li>

			<li class="collection-item avatar"><i
				class="material-icons circle">build</i> <span class="title">Title</span>
				<p>
					First Line <br> Second Line
				</p> <a href="#!" class="secondary-content"><i
					class="material-icons">grade</i></a></li>
		</ul>
		<a class="waves-effect waves-light btn-large"
			style="float: right; color: teal lighten-2">장비추가</a>

	</div>
	
	<!-- 장비관리 list -->
<!-- /수정부분 -->

<!-- /main -->