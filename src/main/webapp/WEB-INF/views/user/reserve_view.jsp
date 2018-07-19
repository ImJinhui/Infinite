<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%-- <link href="<c:url value='/resources/css/customize_fullcalendar.css'/>" type="text/css"	rel="stylesheet"/>
<link href="<c:url value='/resources/css/infinite.css'/>" type="text/css"	rel="stylesheet"/>
<script src="<c:url value='/resources/js/ko.js'/> "></script> --%>
<script>

var timeid = null;
var dateary = new Array();
var jbary = new Array();
var listcount = 0;
var fn_setFormTagList = function(url, id, params) {
    $.ajax({
        type : "GET", 
        url : url, 
        dateType : "JSON",
        data : {'SUB_CATEGORY_SEQ': params},
        async: true
        , success : function(data) {
            var formTag = "<div>";
            $.each(data, function(i,item){
                formTag += '<div class="row"><div class ="col s2" style="display:block; text-align: center; vertical-align: middle" id='+item.EQUIP_SEQ+'>'+ item.EQUIP_SEQ+'</div>'
                +'<div class="col s2" id='+dateary[0]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[0]+'/am'+' id='+item.EQUIP_SEQ+dateary[0]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[0]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[0]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[1]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[1]+'/am'+' id='+item.EQUIP_SEQ+dateary[1]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[1]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[1]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[2]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[2]+'/am'+' id='+item.EQUIP_SEQ+dateary[2]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[2]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[2]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[3]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[3]+'/am'+' id='+item.EQUIP_SEQ+dateary[3]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[3]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[3]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[4]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[4]+'/am'+' id='+item.EQUIP_SEQ+dateary[4]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[4]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[4]+'pm'+'>오후</button>	</div>'
                
                +'</div>';
                jbary[listcount]=item.EQUIP_SEQ;
				listcount++;
                /*                 fn_timeList("<c:url value='/wss/equip_List' />", id,item.EQUIP_SEQ); */
            });
            formTag += '</div>';
           	$('#'+id).html(formTag);
        }
        , error : function(request,status,error) {
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert("Failure \n ("+status+")");
            return false;
        }
    });
};

var fn_timeList = function(url,param1, param2, param3) {
    $.ajax({
        type : "GET", 
        url : url, 
        dateType : "JSON",
        data : {'RESERVE_S_DATE': param1,'RESERVE_E_DATE': param2,'EQUIP_SEQ': param3},
        async: true
        , success : function(data) {
        	if(data ==("")){
        		
        	}
            $.each(data, function(i,item){
            	var stime = item.RESERVE_S_TIME;
            	var etime = item.RESERVE_E_TIME;
            	if(stime == ("09:00")){
            		
	            		timeid=item.EQUIP_SEQ+item.RESERVE_DATE+'am';
	            		$('#'+timeid).attr("disabled","disabled");      		
            		
            	}else{
            		timeid=item.EQUIP_SEQ+item.RESERVE_DATE+'pm';
            		$('#'+timeid).attr("disabled","disabled"); 	
            	}
            });
        }
        , error : function(request,status,error) {
        	
        	/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert("Failure \n ("+status+")"); */
            return false;
        }
    });
}
/* var test = function(){
 	for(var data1=0; data1<jbary.length; data1++)
	 {
	  console.log("jbary["+data1+"]:  "+jbary[data1]);
	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4]);
	 }
}; */

</script>
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

 function printDate() {
     var date = new Date();
     	var datetext = "<div class='row'><div class='col s2' style='text-align: center;'></div>"
		var datecount=0;
     	var count=0;
		for(var i = 0; datecount<5; i++){
			if(i!=0){
				date.setTime(date.getTime()+(24*60*60*1000));
			}
			var day  = date.getDate();
	        var month = date.getMonth() + 1;
	        var year = date.getYear();
	        var dow = date.getDay();
	        year = (year < 1000) ? year + 1900 : year;
	        if(dow==0||dow==1) continue;
	        else datecount++;
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
	        datevalue = year+"-"+month+"-"+day;
	        dateary[count] = datevalue;
	        count++;
	        datetext += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
		}
     		datetext += "</div>";
			document.write(datetext);
}
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
.row{
	border: 1px solid black;
}
.col.s2{
	text-align: center;
	width: 100%;
}
.am_pm{
	display:block;  text-align: center;
}
.insertvalue{
	display:none;
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

<div style="padding: 0 1rem 0 1rem;">
	<script>
		printDate();
	</script>
</div>

	<c:forEach items="${resultList}" var="resultData" varStatus="loop">
	<div id="selectable" class="accordion row">
		<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div>
		
		
	</div>
	
	<div class="panel">
		<div id="${resultData.SUB_CATEGORY_SEQ}"></div>
		<script>
			var id=${resultData.SUB_CATEGORY_SEQ};
			var params=${resultData.SUB_CATEGORY_SEQ};
			fn_setFormTagList("<c:url value='/wss/equip_List' />", id,params);
		</script>
<!-- 			<div class="col s2"><span style="display:block;  text-align: center;">오전</span><span style="display:block;  text-align: center;">오후</span></div>
			<div class="col s2"><span style="display:block;  text-align: center;">오전</span><span style="display:block;  text-align: center;">오후</span>	</div>
			<div class="col s2"><span style="display:block;  text-align: center;">오전</span><span style="display:block;  text-align: center;">오후</span></div>
			<div class="col s2"><span style="display:block;  text-align: center;">오전</span><span style="display:block;  text-align: center;">오후</span></div>
			<div class="col s2"><span style="display:block;  text-align: center;">오전</span><span style="display:block;  text-align: center;">오후</span></div> -->
	</div>
	</c:forEach>
	<!-- fn_setFormTagList 종료 -->
<script> setTimeout(function(){
 	for(var data1=0; data1<jbary.length; data1++)
	 {
	  console.log("jbary["+data1+"]:  "+jbary[data1]);
 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
	 }
}, 1000); </script>
	<!-- /수정부분 -->
 <a class="waves-effect waves-light btn modal-trigger" onclick="reservecheck()" href="#modal1">예약목록보기</a>
</div>
<!-- /main -->
<!-- 예약확인 modal -->
<div id="modal1" class="modal">
  <form role="form" method="POST"	action="<c:url value='/reserve/reserve_complete'/>">
    <div class="modal-content">
      <table>
      	
        <thead>
          <tr>
              <th>장비명</th>
              <th>예약일</th>
              <th>사용시작시간</th>
              <th>사용종료시간</th>
              <th>목록삭제</th>
          </tr>
        </thead>
		<tbody class="modal-tbody" >
			
		</tbody>
		<input name="EQUIP_SEQ" type="hidden" value="W-DR01" class="insertvalue">
		<input name="RESERVE_DATE" type="hidden" value="1900-1-1" class="insertvalue">
		<input name="RESERVE_S_TIME" type="hidden" value="09:00" class="insertvalue">
		<input name="RESERVE_E_TIME" type="hidden" value="13:00" class="insertvalue">

	  	</table>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
      <button class="waves-effect waves-light btn-large" id="btn_reserve"type="submit">예약하기</button>
    </div>
    </form>
  </div>
<!-- 예약확인 modal -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.modal').modal();

  });

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

$(document).on("click",".btn_delete",function(){
	var deleteparam = $(this).attr('value');
	$('tr').remove('#'+deleteparam);
 	$('#'+deleteparam).css("background-color","#26a69a");
 	reservecheck();
});
function reservecheck(){
	var reservelistcheck =$(".modal-tbody").children().length;
	if(reservelistcheck > 0){
		$('#btn_reserve').attr("disabled",false);
	}else{
		$('#btn_reserve').attr("disabled","disabled");
	}
}
function addreserve(string){
	 var arr = string.split('/');
	if('rgb(255, 183, 77)' == $('#'+arr[0]+arr[1]+arr[2]).css("background-color")){
		alert("이미 선택되어 있습니다");
		return;
	}
	M.toast({html: string+'   예약목록에 추가됨'})
	 if(arr[2] =='am'){
		var reserve_s_time = '09:00';
		var reserve_e_time = '13:00';
	 }else{
		var reserve_s_time = '13:00';
		var reserve_e_time = '18:00'; 
	 }
	 $('#'+arr[0]+arr[1]+arr[2]).css("background-color","#ffb74d");
	 var addDiv = '<tr id='+arr[0]+arr[1]+arr[2]+'><td NAME="EQUIP_SEQ">'+arr[0]+'</td><td NAME="RESERVE_DATE">'+arr[1]+'</td><td NAME="RESERVE_S_TIME">'+reserve_s_time+'</td>'
	 +'<td NAME="RESERVE_E_TIME">'+reserve_e_time+'</td><td><button value='+arr[0]+arr[1]+arr[2]+' class="btn_delete">X</button></td><input name="EQUIP_SEQ" type="hidden" value='+arr[0]+' class="insertvalue">'
	 +'<input name="RESERVE_DATE" type="hidden" value='+arr[1]+' class="insertvalue"><input name="RESERVE_S_TIME" type="hidden" value='+reserve_s_time+' class="insertvalue"><input name="RESERVE_E_TIME" type="hidden" value='+reserve_e_time+' class="insertvalue">';
	 +'</tr>';
	 $('.modal-tbody').append(addDiv);
}

</script>
	<script>

		/* $(function() {
			console.log(jbary);
			test();
		}); */
	</script>
