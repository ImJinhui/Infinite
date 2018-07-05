<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<link href="<c:url value='/resources/css/customize_fullcalendar.css'/>" type="text/css"	rel="stylesheet"/>
<link href="<c:url value='/resources/css/style.css'/>" type="text/css"	rel="stylesheet"/>
<script src="<c:url value='/resources/js/ko.js'/> "></script>
<script>

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

</script>


<!-- main -->
  <div class="main_body">
  <!-- 수정부분 -->

	<!-- /수정부분 -->
	<div class="card">
	<div id='calendar'></div>
	</div>
  </div>
  <!-- /main -->
  
