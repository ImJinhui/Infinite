<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<script src="<c:url value='/resources/js/reservation.js'/> "></script>

<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">예약</a> <a href="#!"
				class="breadcrumb">예약확인</a>
		</div>
	</div>
</nav>
<div class="main_body" style="width: 70%">
	<div class="box center-align">
		<div class="row">
			<h5>예약이 완료되었습니다.</h5>
		</div>
		<div class="row">
			<a href="<c:url value='/user/reserve_apply'/>"
				class="waves-effect waves-light btn">이전페이지로 돌아가기</a>
		</div>
	</div>
</div>
<!-- /페이지 이름 -->



