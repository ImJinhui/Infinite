<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('select').formSelect();
  });
</script>
  <!-- main -->
  <!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">회원가입</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->
  <div class="main_body" style="width: 50%;">
  <!-- 수정부분 -->
  
  <div class="row box">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">face</i>
          
          <input id="name" type="text" class="validate">
          <label for="name">이름</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">account_circle</i>
          <input id="id" type="text" class="validate">
          <label for="id">아이디</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">lock</i>
          <input id="password" type="password" class="validate">
          <label for="password">비밀번호</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">lock</i>
          <input id="password_c" type="password" class="validate">
          <label for="password_c">비밀번호 재확인</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">phone</i>
          <input id="tel" type="tel" class="validate">
          <label for="tel">전화번호</label>
        </div>
      </div>
	  <div class="row">
	     <div class="input-field col s12">
	       	<i class="material-icons prefix">email</i>	
	        <input id="email" type="email" class="validate">
	        <label for="email">이메일</label>
	        <span class="helper-text" data-error="이메일 형식이 아닙니다." data-success="이메일 형식이 맞습니다."></span>
	      </div>
	  </div>
      <div class="row">
			<div class="input-field col s5">
      		<i class="material-icons prefix">home</i>
				<select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select> <label>주소</label>
			</div>
			<div class="input-field col s4">
    			  <select>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select>
			</div>
			</div>
			<div class="row">
<!--         <div class="col s12"> -->
<!--           This is an inline input field: -->
<!--           <div class="input-field inline"> -->
<!--             <input id="email_inline" type="email" class="validate"> -->
<!--             <label for="email_inline">Email</label> -->
<!--             <span class="helper-text" data-error="wrong" data-success="right">Helper text</span> -->
<!--           </div> -->
<!--         </div> -->
			<div class="row">
	    	  <div class="input-field col s12">
	   		   	<a class="waves-effect waves-light btn-large" style="width:100%; margin: 0 auto; ">회원가입</a>
	  	    </div>
 	    </div>
      </div>
    </form>
  </div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

