<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
$(document).ready(function(){
    $('.materialboxed').materialbox();
  });
</script>

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
          <input id="reservation_seq" type="text" class="validate" value="${resultMap.RESERVATION_SEQ}" readOnly>
          <label for="reservation_seq">예약번호</label>
        </div>
        <div class="input-field col s6">
          <input id="member_seq" type="text" class="validate" value="${resultMap.NAME}" readOnly>
          <label for="member_seq">예약자</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="reserve_date" type="text" class="validate" value="${resultMap.RESERVE_DATE}" readOnly>
          <label for="reserve_date">예약일</label>
        </div>
        <div class="input-field col s6">
          <input id="reserve_time" type="text" class="validate" value="${resultMap.RESERVE_S_TIME} ~ ${resultMap.RESERVE_E_TIME}" readOnly>
          <label for="reserve_time">예약시간</label>
        </div>
      </div>
       <div class="row">
        <div class="input-field col s12">
          <input id="equip_seq" type="text" class="validate" value="${resultMap.EQUIP_NAME}" readOnly>
          <label for="equip_seq">대여장비</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="return_check" type="text" class="validate" value="${resultMap.RETURN_CHECK}" readOnly>
          <label for="return_check">반납여부</label>
        </div>
        <div class="input-field col s6">
          <input id="num_of_prototype" type="text" class="validate" value="${resultMap.NUM_OF_PROTOTYPE}" readOnly>
          <label for="num_of_prototype">시제품개수</label>
        </div>
      </div>
      	<label for="result_img">결과물 사진</label>
      <div id="result_img" class="row box">
      	<img class="materialboxed" width="100%" src="<c:url value='/resources/uploads/${resultMap.PHYSICALFILE_NAME}'/>" readOnly>
      </div>
    </form>
  </div>
  <div class="row">
    <a class="right waves-effect waves-light btn" href="<c:url value='/admin/result/result_edit?RESERVATION_SEQ=${resultMap.RESERVATION_SEQ}'/>">수정</a>
    </div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

