<%@ page contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
$(function(){
   $("#btnExport").click(function (e) {
      /*alert($('#export').html());*/
      var flag = confirm("엑셀파일로 출력 하시겠습니까?");
        if(flag==true) {
            $(this).parent().click();
        } else if(flag==false){
            return false;
        }
      
      var uri = encodeURI('data:application/vnd.ms-excel,' + $('#export').html());
      window.open(uri);
       e.preventDefault();
   });
});
</script>

<!-- 페이지이름-->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">결과물관리</a> <a href="#!"
				class="breadcrumb">결과물출력</a>
		</div>
	</div>
</nav>
<!-- /페이지이름-->
<!-- main -->
<div class="main_body" style="width: 70%">
	<!-- 수정부분-->

	<div id="export" class="box">
		<table class="centered">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>예약자 ID</th>
					<th>예약자 이름</th>
					<th>예약장비</th>
					<th>예약일</th>
					<th>예약시간</th>
					<th>시제품개수</th>
					<th>장비반납여부</th>
					<th>결과물제출여부</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${resultList}" var="resultData" varStatus="loop">
					<tr>
						<td>${resultData.RESERVATION_SEQ}</td>
						<td>${resultData.ID}</td>
						<td>${resultData.NAME}</td>
						<td>${resultData.EQUIP_NAME}</td>
						<td>${resultData.RESERVE_DATE}</td>
						<td>${resultData.RESERVE_S_TIME}~${resultData.RESERVE_E_TIME}</td>
						<td>${resultData.NUM_OF_PROTOTYPE}</td>
						<td>${resultData.RETURN_CHECK}</td>
						<c:choose>
							<c:when test="${null eq resultData.ATTACHFILE_SEQ}">
								<td>X</td>
							</c:when>
							<c:otherwise>
								<td>O</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row">
		<a id="btnExport" class="waves-effect waves-light btn right">출력</a>
	</div>
</div>
<!-- /수정부분-->

   
  

<!-- /main -->