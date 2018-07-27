<%@ page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script>
$(document).ready(function() {
	$('select').formSelect();
    $('.datepicker').datepicker();
});

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
<!-- 날짜별 예약목록 가져오는 ajax  -->
<script type="text/javascript">
	var fn_search_by_date = function(date1, date2, url) {
		$.ajax({
					type : "POST",
					url : url,
					data : {
						"FIRST_DATE" : date1,
						"SECOND_DATE" : date2
					},
					dataType : 'json',
					cache : false,
					success : function(data) { 
						
						var listTable = "<tr>";
						
						$.each(data, function(i) {
							listTable += "<td>" + (data[i])['RESERVATION_SEQ']	+ "</td>";
							listTable += "<td>"	+ (data[i])['ID']	+ "</td>";
							listTable += "<td>"	+ (data[i])['NAME']	+ "</td>";
							listTable += "<td>"	+ (data[i])['EQUIP_NAME']	+ "</td>";
							listTable += "<td>"	+ (data[i])['RESERVE_DATE']	+ "</td>";
							listTable += "<td>"	+ (data[i])['RESERVE_S_TIME'] +"~"+(data[i])['RESERVE_E_TIME']	+ "</td>";
							listTable += "<td>"	+ (data[i])['NUM_OF_PROTOTYPE']	+ "</td>";
							listTable += "<td>"	+ (data[i])['RETURN_CHECK']	+ "</td>";
							if(null == (data[i])['RETURN_CHECK']){
								listTable += "<td>X</td>";
							} else{
								listTable += "<td>O</td>";
							}
								listTable += "</tr>";
						});
						
						$("#listTable").html(listTable);
					 },
					error : function(xhr, status, exception) {
						alert("Failure \n (" + status + ")");
						return false;
					}
				});
	}

	function search_by_date(first_date, second_date) {
		fn_search_by_date(first_date, second_date, "<c:url value='/wsResult/reserveListByDate'/>");
	};  
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
	
	<!-- 날짜검색 -->
	<div class="box">
		<div class="row" style="padding-left: 4rem">
			<div class="col s5">
				<label for="first_date">First Date</label> <input id="first_date" name="FIRST_DATE"
					type="text" class="datepicker">
			</div>
			<div class="col s5">
				<label for="second_date">Second Date</label> <input id="second_date" name="SECOND_DATE"
					type="text" class="datepicker">
			</div>

			<div class="input-field col s2">
				<button class="btn waves-effect waves-light" onclick="search_by_date(first_date.value, second_date.value);"
					name="action">검색</button>
			</div>

		</div>
	</div>
	<!-- /날짜검색 -->
	
	<!-- 출력부분-->
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

			<tbody id="listTable">
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