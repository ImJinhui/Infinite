<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- 페이지 이름 -->
<nav class="teal">
     <div class="nav-wrapper">
      <div class="bread_div">
      	<a href="#!" class="breadcrumb">장비·장소관리</a>
        <a href="#!" class="breadcrumb">장비관리</a>
        <a href="#!" class="breadcrumb">장비수정</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body" style="width:70%">
  <!-- 수정부분 -->
  <div class="row box" >
		<form class="col s12" method="POST"
			action="<c:url value='/admin/equip/equip_list'/>">

			<div class="row">
				<div class="input-field col s12">
				<i class="material-icons prefix">play_arrow</i>
					<input id="member_seq" type="text" class="validate"> <label
						for="ability_seq">장비 번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
				<i class="material-icons prefix">play_arrow</i>
					<input id="member_name" type="text" class="validate"> <label
						for="member_name">장비명</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
				<i class="material-icons prefix">play_arrow</i>
					<input id="member_pass" type="text" class="validate"> <label
						for="member_address">제조사</label>
				</div>
			</div>

			<div class="row">
					<div class="input-field col s12">
					<i class="material-icons prefix">play_arrow</i>
						<textarea id="textarea1" class="materialize-textarea"></textarea>
						<label for="textarea1">장비 설명</label>
					</div>
			</div>

			<button class="right btn-large waves-effect waves-light" type="submit" name="action">
				수정 <i class="material-icons right">edit</i>
			</button>
		</form>
	</div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

