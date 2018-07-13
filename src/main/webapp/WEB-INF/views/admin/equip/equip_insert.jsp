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
        <a href="#!" class="breadcrumb">장비조회</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body">
  <!-- 수정부분 -->
  <!-- modal -->
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<div class="row">
				<div class="input-field col s12">
					<h4>장비추가</h4>
				</div>
			</div>
			<form class="col s12">
				<div class="row">
					<div class="input-field col s6">
						<select onchange="cateSelect(this.value);">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${resultMap.resultCateObject}" var="resultCate" varStatus="loop">
							<option value="${resultCate.CATEGORY_SEQ}">${resultCate.CATEGORY_NAME}</option>
							</c:forEach>
						</select> <label>장비위치</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<select id="subCate">
							<!-- <option value="" disabled selected>Choose your option</option> -->
						</select> <label>장비종류</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="name" type="text" class="validate"> <label
							for="name">장비명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="manufacturer" type="text" class="validate"> <label
							for="manufacturer">제조사</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-teal btn">장비추가</a>
	</div>
</div>
<!-- modal -->
  
  
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
<!-- 장비추가 modal selectbox ajax -->

<script type="text/javascript">
var fn_cate_select = function(url, params) {
	$.ajax({
		type : "POST", 
		url : url, 
		data : {"CATEGORY_SEQ" : params}, 
		dataType:'json',
		cache: false,
		success: function(data){
				alert(data);
			  var sub_cate = "<option value='' disabled selected>Choose your option</option>";
				        
			  /* $("#subCate").find("option").remove().end().append("<option value='' disabled selected>Choose your option</option>"); */
			  
			
			   $.each(data, function(i){
				   sub_cate += "<option value='"+(data[i])['SUB_CATEGORY_SEQ']+"'>"+(data[i])['SUB_CATEGORY_NAME']+"</option>";
			   /*  $("#subCate").append("<option value='"+data[i].SUB_CATEGORY_SEQ+"'>"+data[i].SUB_CATEGORY_NAME+"</option>") */
			   });    
			   $("#subCate").html(sub_cate);
			   
			   /* document.addEventListener('DOMContentLoaded', function() {
							var elems = document.querySelectorAll('select');
							var instances = M.FormSelect.init(elems, options);
						}); */
				/* $('select').formSelect(); */
			  },


		error : function(xhr, status, exception){
			alert("Failure \n ("+status+")");
			return false; 
		}
		});
	}

	function cateSelect(param) {
		alert(param);
		fn_cate_select("<c:url value='/wsEquip/subCateList'/>", param);
		
	};
</script>
<!-- 장비추가 modal selectbox ajax -->
  

