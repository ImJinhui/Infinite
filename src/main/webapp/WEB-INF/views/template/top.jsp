<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	/* navbar dropdown */
	(function($) {
		$(function() {

			$('.dropdown-trigger').dropdown({
				inDuration : 300,
				outDuration : 225,
				hover : true, // Activate on hover
				coverTrigger : false, // Displays dropdown below the button
				alignment : 'right' // Displays dropdown with edge aligned to the left of button
			});

		}); // End Document Ready
	})(jQuery); // End of jQuery name space
</script>

<!-- Dropdown 내부리스트 -->
<ul id="dropdown_equip" class="dropdown-content">
	<li><a href="<c:url value='/admin/equip/equip_list'/>">장비관리</a></li>
	<li><a href="<c:url value='/admin/category/category_list'/>">카테고리관리</a></li>
</ul>


<%-- <ul id="dropdown_member" class="dropdown-content">
  <li><a href="<c:url value='/common/login'/>">로그인</a></li>	
  <li><a href="<c:url value='/common/signup'/>">회원가입</a></li>	
  <li class="divider"></li>
  <li><a href="<c:url value='/common/mypage'/>">마이페이지</a></li>	
</ul> --%>
	<c:set var="principalName" value="${pageContext.request.userPrincipal.name }"/>
	
<c:choose>
	<c:when test="${principalName!=null}"> <!-- //로그인 성공 -->

		<ul id="dropdown_member" class="dropdown-content">
			<%--  <li><a href="<c:url value='/common/login'/>">로그인</a></li> --%>
			<li><a href="<c:url value='/common?action=signup'/>">회원가입</a></li>
			<li class="divider"></li>
			<li><a href="<c:url value='/common?action=mypage&id=${principalName}'/>">마이페이지</a></li>
			
			<li><a href="<c:url value='/j_spring_security_logout'/> "> 로그아웃</a></li>
			
		</ul>

		<ul id="dropdown_reserve" class="dropdown-content">
			<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
			<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
		</ul>

		<!-- nav bar -->
		<nav id="top_nav" class="white" role="navigation">
			<div class="nav-wrapper container">
				<a id="logo-container" href="<c:url value='/'/>" class="brand-logo">
					<img alt="logo"
					src="<c:url value='/resources/images/head_logo.jpg'/> ">
				</a>
				<ul class="right hide-on-med-and-down">
					<!-- <li><a class="dropdown-trigger" href="#!" data-target="dropdown_reserve">예약<i class="material-icons right">arrow_drop_down</i></a></li> -->
					<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
					<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
					<li><a href="<c:url value='/admin/member/member_list'/>">회원관리</a></li>
					<li><a href="<c:url value='/admin/result/result_list'/>">결과물관리</a></li>
					<li><a href="<c:url value='/admin/ability/ability_list'/>">능력관리</a></li>
					<li><a class="dropdown-trigger" href="#!"
						data-target="dropdown_equip">장비관리<i
							class="material-icons right">arrow_drop_down</i></a></li>
					<li><a class="dropdown-trigger" href="#!"
						data-target="dropdown_member">${principalName}님 환영합니다!<i
							class="material-icons right">arrow_drop_down</i></a></li>

				</ul>

				<ul id="nav-mobile" class="sidenav">
					<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
					<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value='/admin/member/member_list'/>">회원관리</a></li>
					<li><a href="<c:url value='/admin/result/result_list'/>">결과물관리</a></li>
					<li><a href="<c:url value='/admin/ability/ability_list'/>">능력관리</a></li>
					<li><a href="<c:url value='/admin/equip/equip_list'/>">장비관리</a></li>
					<li><a href="<c:url value='/admin/category/category_list'/>">카테고리관리</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value='/common?action=login'/>">로그인</a></li>
					<li><a href="<c:url value='/common?action=signup'/>">회원가입</a></li>
					<li><a href="<c:url value='/common?action=mypage&id=${principalName}'/>">마이페이지</a></li>
					<li><a href="<c:url value='/j_spring_security_logout'/> ">로그아웃</a></li>
				</ul>
				<a href="#" data-target="nav-mobile" class="sidenav-trigger"><i
					class="material-icons">menu</i></a>
			</div>
		</nav>

		<!-- nav bar -->

	</c:when>


	<c:otherwise>  <!-- //로그인 되지 않음 -->
		<!-- 로그인되지 않은경우 -->
		<ul id="dropdown_member" class="dropdown-content">
			<li><a href="<c:url value='/common?action=login'/>">로그인</a></li>
			<li><a href="<c:url value='/common?action=signup'/>">회원가입</a></li>
			<%-- <li><a href=${principalName==null?'login':'j_spring_security_logout'}>로그아웃</a></li> --%>
			<li class="divider"></li>
		</ul>

		<ul id="dropdown_reserve" class="dropdown-content">
			<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
			<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
		</ul>

		<!-- nav bar -->
		<nav id="top_nav" class="white" role="navigation">
			<div class="nav-wrapper container">
				<a id="logo-container" href="<c:url value='/'/>" class="brand-logo">
					<img alt="logo"
					src="<c:url value='/resources/images/head_logo.jpg'/> ">
				</a>
				<ul class="right hide-on-med-and-down">
					<!-- <li><a class="dropdown-trigger" href="#!" data-target="dropdown_reserve">예약<i class="material-icons right">arrow_drop_down</i></a></li> -->
					<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
					<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
					<li><a href="<c:url value='/admin/member/member_list'/>">회원관리</a></li>
					<li><a href="<c:url value='/admin/result/result_list'/>">결과물관리</a></li>
					<li><a href="<c:url value='/admin/ability/ability_list'/>">능력관리</a></li>
					<li><a class="dropdown-trigger" href="#!"					data-target="dropdown_equip">장비관리<i
							class="material-icons right">arrow_drop_down</i></a></li>
					<li><a class="dropdown-trigger" href="#!"					data-target="dropdown_member">로그인<i
							class="material-icons right">arrow_drop_down</i></a></li>

				</ul>

				<ul id="nav-mobile" class="sidenav">
					<li><a href="<c:url value='/user/reserve_apply'/>">예약신청</a></li>
					<li><a href="<c:url value='/user/reserve_view'/>">예약현황</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value='/admin/member/member_list'/>">회원관리</a></li>
					<li><a href="<c:url value='/admin/result/result_list'/>">결과물관리</a></li>
					<li><a href="<c:url value='/admin/ability/ability_list'/>">능력관리</a></li>
					<li><a href="<c:url value='/admin/equip/equip_list'/>">장비관리</a></li>
					<li><a href="<c:url value='/admin/category/category_list'/>">장소관리</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value='/common?action=login'/>">로그인</a></li>
					<li><a href="<c:url value='/common?action=signup'/>">회원가입</a></li>
					<li><a href="<c:url value='/common?action=mypage&id=${principalName}'/>">마이페이지</a></li>
				</ul>
				<a href="#" data-target="nav-mobile" class="sidenav-trigger"><i
					class="material-icons">menu</i></a>
			</div>
		</nav>
		<!-- nav bar -->
	</c:otherwise>
</c:choose>




