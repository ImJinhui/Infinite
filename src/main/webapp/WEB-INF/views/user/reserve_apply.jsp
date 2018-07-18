<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<script src="<c:url value='/resources/js/reservation.js'/> "></script>
<!-- left collapse -->
<script>
(function($) {
	$(function() {

$('.collapsible').collapsible({
  
}
);

	}); // End Document Ready
})(jQuery); // End of jQuery name space

</script>
<!-- /left collapse -->
<script language="javascript">

function printDate() {
        var date = new Date();
		for(var i = 0; i<=13; i++){
			if(i!=0){
				date.setTime(date.getTime()+(24*60*60*1000));
			}
			var day  = date.getDate();
	        var month = date.getMonth() + 1;
	        var year = date.getYear();
	        var dow = date.getDay();
	        year = (year < 1000) ? year + 1900 : year;
	        switch(dow){
			case 0:dow="일";break;
			case 1:dow="월";break;
			case 2:dow="화";break;
			case 3:dow="수";break;
			case 4:dow="목";break;
			case 5:dow="금";break;
			case 6:dow="토";break;
			default:break;
			}
	        var selectdate = year+"-"+month+"-"+day;

/* 			document.write(year+""+month+""+day+dow); */
			var text = "<label class='date_label'>"+"<span class='date_span'>"+dow+"</span>"+"<span class='date_em' value="+selectdate+">"+day+"</span>"+"</label>"; 
			document.write(text);
		}
/*         document.write(year + "년 "+ month + "월 " + day + "일 "+ dow +"요일"); 
        document.write(date.toLocaleString());
        document.write("---------");
        var newtimems=date.getTime()+(30*24*60*60*1000);
        document.write(newtimems);
		date.setTime(newtimems);
        document.write("---------");
        document.write(date.getDate()); */
}
</script>
<script>
var ss="";
$(document).on("click",".date_em",function(){
	var ss = $(this).attr('value');
	$(this).css("color","#ffffff")
	.css("border-radius","80%")
    .css("background","#6C6C6C");
	alert(ss);
});
</script>
<style>
.date_card{
	height: 60px;
	margin-right:0.5rem;
}

.row .col{
	padding: 0 1.5rem;
}

.row .col .s2{
	width:18.7%;
}

.date_card p {
	margin-top: 15px;
	font-size: large;
}
#dates{
	/* padding-left: 0.7rem; */
}
.date_label{
	display:inline-block;
	font-size:3vw;
	width:5%;
	margin-left:1.5vw;
}
.date_span{
	display:block;
	font-size:1.5vw;
}
.date_em{
    display: block;
	cursor:pointer;
    text-align: center;
    width: 4vw;
    height: 4vw;
}
/* .date_em:before {
    content: "";
    padding-top: 100%; /* 1:1 비율 */
} */
</style>
 <!-- 페이지 이름 -->
<nav class="teal">
    <div class="nav-wrapper">
      <div class="bread_div">
        <a href="#!" class="breadcrumb">예약</a>
        <a href="#!" class="breadcrumb">예약신청</a>
      </div>
    </div>
  </nav>
<!-- /페이지 이름 -->
 

  <!-- main -->
  <div class="main_body row">
	<div class="col s12" style="display:center;text-align:center;">
		<script>
		printDate();
		</script>
	</div>
  <!-- 수정부분 -->
  <!-- left -->
<div class="col s3">
	  <ul class="collapsible">
	    <li class="active">
	      <div class="collapsible-header"><i class="material-icons">print</i>3D Printer</div>
	      
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Printer 1</a>
	        <a href="#!" class="collection-item">Printer 2</a>
	        <a href="#!" class="collection-item">Printer 3</a>
	        <a href="#!" class="collection-item">Printer 4</a>
	      </div>
	      
	    </li>
	    <li>
	      <div class="collapsible-header"><i class="material-icons">content_cut</i>Laser Cutter</div>
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Cutter 1</a>
	        <a href="#!" class="collection-item">Cutter 2</a>
	        <a href="#!" class="collection-item">Cutter 3</a>
	        <a href="#!" class="collection-item">Cutter 4</a>
	      </div>
	    </li>
	    <li>
	      <div class="collapsible-header"><i class="material-icons">computer</i>Computer</div>
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Computer 1</a>
	        <a href="#!" class="collection-item">Computer 2</a>
	        <a href="#!" class="collection-item">Computer 3</a>
	        <a href="#!" class="collection-item">Computer 4</a>
	      </div>
	    </li>
	  </ul>
  </div>
  <!-- /left -->
  
  <!-- center -->
 <div class="col s6">
 
 	<!-- <div class="row" style="text-align: center;">
		<div id="dates">	 
	
	      <div class="col s2 card date_card btn"><p>07/02</p></div>
	      <div class="col s2 card date_card btn"><p>07/03</p></div>
	      <div class="col s2 card date_card btn"><p>07/04</p></div>
	      <div class="col s2 card date_card btn"><p>07/05</p></div>
	      <div class="col s2 card date_card btn"><p>07/06</p></div>
	      
	      <div class="col s2 card date_card btn"><p>07/09</p></div>
	      <div class="col s2 card date_card btn"><p>07/10</p></div>
	      <div class="col s2 card date_card btn"><p>07/11</p></div>
	      <div class="col s2 card date_card btn"><p>07/12</p></div>
	      <div class="col s2 card date_card btn"><p>07/13</p></div>
     
     	</div>  
  	</div> -->
  	
  	<div class="row">
  	<div class="card ">
  	 <div class="collection">
        <a href="#!" class="collection-item">09:00 ~ 10:00</a>
        <a href="#!" class="collection-item">10:00 ~ 11:00</a>
        <a href="#!" class="collection-item">11:00 ~ 12:00</a>
        <a href="#!" class="collection-item">12:00 ~ 13:00</a>
        <a href="#!" class="collection-item">13:00 ~ 14:00</a>
        <a href="#!" class="collection-item">14:00 ~ 15:00</a>
        <a href="#!" class="collection-item">15:00 ~ 16:00</a>
        <a href="#!" class="collection-item">16:00 ~ 17:00</a>
        <a href="#!" class="collection-item">17:00 ~ 18:00</a>
      </div>
  	</div>
  	</div>
  </div>
  <!-- /center -->
  
  <!-- right -->
<div class="col s3">
      <div class="card">
        <div class="card-content">
        <i class="close material-icons right">close</i>
          <div class="card-title">3D Printer</div>
          <p>2018년 7월 4일</p>
          <p>12:00 ~ 13:00</p>
        </div>
      </div>
      <div class="card">
        <div class="card-content">
        <i class="close material-icons right">close</i>
          <span class="card-title">3D Printer</span>
          <p>2018년 7월 4일</p>
          <p>13:00 ~ 14:00</p>
        </div>
      </div>
      <div class="card">
        <div class="card-content">
        <i class="close material-icons right">close</i>
          <span class="card-title">Laser Cutter</span>
          <p>2018년 7월 4일</p>
          <p>12:00 ~ 13:00</p>
        </div>
      </div>
  </div>
  <!-- /right -->
  
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

