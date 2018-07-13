<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%-- <link href="<c:url value='/resources/css/customize_fullcalendar.css'/>" type="text/css"	rel="stylesheet"/>
<link href="<c:url value='/resources/css/infinite.css'/>" type="text/css"	rel="stylesheet"/>
<script src="<c:url value='/resources/js/ko.js'/> "></script> --%>
<script>
/* 
  $(document).ready(function() {
	  var initialLocaleCode = 'ko';

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listMonth'
      },
      defaultDate: '2018-03-12',
      locale: initialLocaleCode,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2018-03-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2018-03-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2018-03-18',
          end: '2018-03-20'
        },
        {
          title: 'Party',
          start: '2018-03-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          id: 'availableForMeeting',
          start: '2018-03-11T10:00:00',
          end: '2018-03-11T16:00:00',
          rendering: 'background'
        },
        {
          id: 'availableForMeeting',
          start: '2018-03-13T10:00:00',
          end: '2018-03-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2018-03-24',
          end: '2018-03-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2018-03-06',
          end: '2018-03-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ]
    });

  });
 */
</script>
<style>
.collapsible {
   -webkit-box-shadow: none; 
   box-shadow: none; 
}

.collapsible-body{
	padding : 1.5rem;
}
</style>



<script>
$(document).ready(function(){
    $('.collapsible').collapsible();
  }); 
</script>

<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 10px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}


</style>

<!-- main -->
<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">예약</a> <a href="#!"
				class="breadcrumb">예약현황</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<!-- <div id='calendar'></div> -->

	<div class="row">
		<div class="col s2"></div>
		<div class="col s2">7/10</div>
		<div class="col s2">7/11</div>
		<div class="col s2">7/12</div>
		<div class="col s2">7/13</div>
		<div class="col s2">7/14</div>
	</div>
	
	<div id="selectable" class="accordion row">
		<div class="col s12">3D Printer</div>
	</div>
	<div class="panel">
		<div class="row">
			<div class="col s2">3D Printer 01</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">
				<label> <input type="checkbox" /> <span>오전</span></label> 
				<label>	<input type="checkbox" /> <span>오후</span></label>
			</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
		<div class="row">
			<div class="col s2">3D Printer 02</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
	</div>
	<div id="selectable" class="accordion row">
		<div class="col s12">레이저커터</div>
	</div>
	<div class="panel">
		<div class="row">
			<div class="col s2">3D Printer 01</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">
				<label> <input type="checkbox" /> <span>오전</span></label> 
				<label>	<input type="checkbox" /> <span>오후</span></label>
			</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
		<div class="row">
			<div class="col s2">3D Printer 02</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
	</div>
	<div id="selectable" class="accordion row">
		<div class="col s12">프레스</div>
	</div>
	<div class="panel">
		<div class="row">
			<div class="col s2">3D Printer 01</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">
				<label> <input type="checkbox" /> <span>오전</span></label> 
				<label>	<input type="checkbox" /> <span>오후</span></label>
			</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
		<div class="row">
			<div class="col s2">3D Printer 02</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
			<div class="col s2">오전 오후</div>
		</div>
	</div>
	
	


	
	<!-- /수정부분 -->
</div>
<!-- /main -->
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
</script>

