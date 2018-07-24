<%@ page contentType="application/vnd.ms-excel;charset=EUC-KR" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<meta http-equiv="Content-Type" content="text/html; charset=KSC5601">

<script>
$(function(){
   $("#btnExport").click(function (e) {
      alert($('#export').html());
      
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

	<div id="export">
		<table>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>예약자</th>
					<th>예약일</th>
					<th>장비반납여부</th>
					<th>결과물제출여부</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${resultMap.resultList}" var="resultData"
					varStatus="loop">
					<tr style="cursor: pointer;"
						onclick="location.href='<c:url value="/admin/result/result_read?RESERVATION_SEQ=${resultData.RESERVATION_SEQ}"/>'"
						onMouseOver="window.status = '<c:url value="/admin/result/result_read?RESERVATION_SEQ=${resultData.RESERVATION_SEQ}"/>'"
						onMouseOut=" window.status = '' ">
						<td>${resultData.RESERVATION_SEQ}</td>
						<td>${resultData.NAME}</td>
						<td>${resultData.RESERVE_DATE}</td>
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
	<a id="btnExport" class="waves-effect waves-light btn">출력</a>
</div>
<!-- /수정부분-->

   
  

<!-- /main -->