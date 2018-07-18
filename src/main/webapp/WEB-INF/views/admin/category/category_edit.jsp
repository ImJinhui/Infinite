<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
function checkNull(){
		if($("#category_seq").val().length<1){
			alert("대분류번호값을 입력해주세요");
			$("#category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if($("#category_name").val().length<1){
			alert("대분류이름값을 입력해주세요");
			$("#category_name").focus();
			return $('#cateInsert').submit(false);
		} else if($("#sub_category_seq").val().length<1){
			alert("중분류번호값을 입력해주세요");
			$("#sub_category_seq").focus();
			return $('#cateInsert').submit(false);
		} else if($("#sub_category_name").val().length<1){
			alert("중분류이름값을 입력해주세요");
			$("#sub_category_name").focus();
			return $('#cateInsert').submit(false);
		}
		return $('#cateInsert').submit();
}
</script>

<!-- 페이지 이름 -->
<nav class="teal">
     <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">장비관리</a>
        <a href="#!" class="breadcrumb">카테고리관리</a>
        <a href="#!" class="breadcrumb">카테고리수정</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->

  <!-- main -->
  <div class="main_body" style="width: 70%">
  <!-- 수정부분 -->
  <div class="row box">
    <form id="cateInsert" class="col s12" method="POST" action="<c:url value='/admin/category/category_merge'/>">
			<input type="hidden" name="forwardView" value="/admin/category/category_list" />
				
				<div class="row">
					<div class="input-field col s12">
						<input name="CATEGORY_SEQ" id="category_seq" type="text" class="validate" value="${resultMap.CATEGORY_SEQ}"> <label
							for="category_seq">대분류번호</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="CATEGORY_NAME" id="category_name" type="text" class="validate" value="${resultMap.CATEGORY_NAME}"> <label
							for="category_name">대분류이름</label>
					</div>
				</div>
				<c:if test="${!(resultMap.SUB_CATEGORY_SEQ eq null)}">
					<div class="row">
						<div class="input-field col s12">
							<input name="SUB_CATEGORY_SEQ" id="sub_category_seq" type="text" class="validate" value="${resultMap.SUB_CATEGORY_SEQ}"> <label
								for="sub_category_seq">중분류번호</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input name="SUB_CATEGORY_NAME" id="sub_category_name" type="text" class="validate" value="${resultMap.SUB_CATEGORY_NAME}"> <label
								for="sub_category_name">중분류이름</label>
						</div>
					</div>
				</c:if>
		<button class="btn waves-effect waves-light right" onclick="checkNull();" name="action">
			수정 <i class="material-icons right">send</i>
		</button>
	</form>
  </div>
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

