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
			<a href="#!" class="breadcrumb">결과물관리</a> <a href="#!"
				class="breadcrumb">결과물수정</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" action="<c:url value='/admin/result/result_merge'/>" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="forwardView"	value="/admin/result/result_list" />
			<div class="row">
				<div class="input-field col s6">
					<input name="RESERVATION_SEQ" id="reservation_seq" type="text" class="validate"
						value="${resultMap.RESERVATION_SEQ}" readOnly> <label
						for="reservation_seq">예약번호</label>
				</div>
				<div class="input-field col s6">
					<input id="member_seq" type="text" class="validate"
						value="${resultMap.NAME}" readOnly> <label
						for="member_seq">예약자</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6">
					<input id="reserve_date" type="text" class="validate"
						value="${resultMap.RESERVE_DATE}" readOnly> <label
						for="reserve_date">예약일</label>
				</div>
				<div class="input-field col s6">
					<input id="reserve_time" type="text" class="validate"
						value="${resultMap.RESERVE_S_TIME} ~ ${resultMap.RESERVE_E_TIME}"
						readOnly> <label for="reserve_time">예약시간</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="equip_seq" type="text" class="validate"
						value="${resultMap.EQUIP_NAME}" readOnly> <label
						for="equip_seq">대여장비</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input name="NUM_OF_PROTOTYPE" id="num_of_prototype" type="text" class="validate"
						value="${resultMap.NUM_OF_PROTOTYPE}"> <label
						for="num_of_prototype">시제품개수</label>
				</div>
			</div>
			
				<label for="available">반납여부</label>
			<div class="row">
				<div class="input-field inline col s12">
					<p id="available">
						<label> <input name="RETURN_CHECK" value="T" type="radio" />
							<span>반납</span>
						</label> <label> <input name="RETURN_CHECK" value="F" type="radio" />
							<span>미반납</span>
						</label>
					</p>
				</div>
			</div>

			<div class="file-field input-field">
				<div class="btn">
					<span>File</span> <input type="file" id="attachedfiles"
						name="ATTACHEDFILES">
				</div>
				<div class="file-path-wrapper">
					<input id="image" name="IMAGE" class="file-path validate"
						type="text" placeholder="결과물이미지">
				</div>
			</div>
			<input type="hidden" name="FILE_SEQ"
				value="${resultMap.resultObject.ATTACHFILE_SEQ}" />
			<button class="btn waves-effect waves-light right" type="submit">
				수정 <i class="material-icons right">send</i>
			</button>
		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->


