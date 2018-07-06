<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">능력카드관리</a>
        <a href="#!" class="breadcrumb">능력카드조회</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

<!-- main -->
<div class="main_body" style="width:70%">
	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12">

			<div class="row">
				<div class="input-field col s12">
					<input id="ability_seq" type="text" class="validate"> <label
						for="ability_seq">능력번호</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="ability_name" type="text" class="validate"> <label
						for="ability_name">능력이름</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12">
					<input id="registerationDate" type="text" class="validate">
					<label for="registerationDate">등록일</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="manager" type="text" class="validate"> <label
						for="manager">담당자</label>
				</div>
			</div>
			<button class="btn waves-effect waves-light right" type="submit"
				name="action">
				삭제 <i class="material-icons right">delete</i>
			</button>

		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



