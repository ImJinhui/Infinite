<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">로그인</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body" style="width: 50%;">
  <!-- 수정부분 -->
  <div class="row box">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input id="id" type="text" class="validate">
          <label for="id">아이디</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">비밀번호</label>
        </div>
      </div>
      <div class="row">
	      <div class="input-field col s12">
	      	<a class="waves-effect waves-light btn-large" style="width:100%; margin: 0 auto; ">로그인</a>
	   	  </div>
 	  </div>
 	  <div class="row" >
        <div class="col s12" >
          <div style="border-top:1px solid #EAEAEA; padding-top:2%;">
          	 <a href="<c:url value='/common/signup'/>" style="text-decoration: none; color: #ABABAB;">회원가입</a> 
         </div>
        </div>
      </div>
    </form>
  </div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

