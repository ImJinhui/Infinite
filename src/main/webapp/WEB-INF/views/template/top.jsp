<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- nav bar -->
  <nav class="light-blue lighten-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="<c:url value='/'/>" class="brand-logo">무한상상실</a>
      <ul class="right hide-on-med-and-down">
        <li><a href="<c:url value='/user/reserve_apply'/>">예약 신청</a></li>
        <li><a href="<c:url value='/user/reserve_view'/>">예약 현황</a></li>
        <li><a href="<c:url value='/admin/member_list'/>">회원관리</a></li>
        <li><a href="<c:url value='/admin/equip_list'/>">장비관리</a></li>
        <li><a href="<c:url value='/admin/result_manage'/>">실적관리</a></li>
        <li><a href="<c:url value='/common/login'/>">로그인</a></li>
        <li><a href="<c:url value='/common/signup'/>">회원가입</a></li>
      </ul>

      <ul id="nav-mobile" class="sidenav">
        <li><a href="<c:url value='/user/reserve_apply'/>">예약 신청</a></li>
        <li><a href="<c:url value='/user/reserve_view'/>">예약 현황</a></li>
        <li><a href="<c:url value='/admin/member_manage'/>">회원관리</a></li>
        <li><a href="<c:url value='/admin/equip_manage'/>">장비관리</a></li>
        <li><a href="<c:url value='/admin/result_manage'/>">실적관리</a></li>
        <li><a href="<c:url value='/common/login'/>">로그인</a></li>
        <li><a href="<c:url value='/common/signup'/>">회원가입</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
  </nav>
 <!-- nav bar --> 