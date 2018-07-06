<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!-- 페이지 이름 -->
<nav class="teal">
     <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">회원관리</a>
        <a href="#!" class="breadcrumb">회원조회</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->


  <!-- main -->
<div class="main_body" style="width:70%">

	<!-- 수정부분 -->
	<div class="row">
		<form class="col s12" method="POST"
			action="<c:url value='/admin/member/member_list'/>">

			<div class="row">
				<div class="input-field col s12">
					<input id="member_seq" type="text" class="validate"> <label
						for="ability_seq">회원 번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_name" type="text" class="validate"> <label
						for="member_name">이름</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_id" type="text" class="validate"> <label
						for="member_id">아이디</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="member_password" type="text" class="validate"> <label
						for="member_password">비밀번호</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s12">
					<input id="member_pass" type="text" class="validate"> <label
						for="member_address">주소</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_tel" type="text" class="validate"> <label
						for="member_tel">전화번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="member_ability" type="text" class="validate"> <label
						for="member_ability">보유 능력</label>
				</div>
			</div>


				<a class="waves-effect waves-light btn-large">삭제</a>
		</form>
	</div>
	<!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

