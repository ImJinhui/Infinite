<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!-- 페이지 이름 -->
<nav class="teal">
     <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">결과물관리</a>
        <a href="#!" class="breadcrumb">결과물조회</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body" style="width: 70%">
  <!-- 수정부분 -->
  <div class="row box">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s6">
          <input id="reserve_seq" type="text" class="validate">
          <label for="reserve_seq">대여번호</label>
        </div>
        <div class="input-field col s6">
          <input id="reserve_mem" type="text" class="validate">
          <label for="reserve_mem">대여자</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="reserve_item" type="text" class="validate">
          <label for="reserve_item">대여장비 및 장소</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="reserve_date" type="text" class="validate">
          <label for="reserve_date">예약일</label>
        </div>
        <div class="input-field col s6">
          <input id="reserve_time" type="text" class="validate">
          <label for="reserve_time">예약시간</label>
        </div>
      </div>
    </form>
  </div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

