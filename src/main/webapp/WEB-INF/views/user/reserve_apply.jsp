<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:set var="principalName" value="${pageContext.request.userPrincipal.name }" />

<script>
var timeid = null;
var dateary = new Array();
var jbary = new Array();
var listcount = 0;
var fn_setfirstList = function(url, id, params) {
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
var fn_setsecondList = function(url, id, params) {
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
                +'<div class="col s2" id='+dateary[5]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[5]+'/am'+' id='+item.EQUIP_SEQ+dateary[5]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[5]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[5]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[6]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[6]+'/am'+' id='+item.EQUIP_SEQ+dateary[6]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[6]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[6]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[7]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[7]+'/am'+' id='+item.EQUIP_SEQ+dateary[7]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[7]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[7]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[8]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[8]+'/am'+' id='+item.EQUIP_SEQ+dateary[8]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[8]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[8]+'pm'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[9]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[9]+'/am'+' id='+item.EQUIP_SEQ+dateary[9]+'am'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[9]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[9]+'pm'+'>오후</button>	</div>'
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

 function printDate(val) {
     var date = new Date();
     	var datetext1 = "<div class='row'><div class='col s2' style='text-align: center;'></div>"
     	var datetext2 = "<div class='row'><div class='col s2' style='text-align: center;'></div>"
		var datecount=0;
     	var count=0;
		for(var i = 0; datecount<10; i++){
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
	        if(datecount<=5){
	        datetext1 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
	        }else{
	        datetext2 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";	
	        }
	   }
     		datetext1 += "</div>";
     		datetext2 += "</div>";
     		if(val==1){
				document.write(datetext1);
     		}else{
				document.write(datetext2);     			
     		}
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
	/* border: 1px solid black; */
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
#firstpage{
	align:right;
}
#secondpage{
	display:none;
	align:left;
}
#main_list{
	margin: 3rem 0;
	padding:2rem;
	border: 1.3px solid #d4d4d4;
}
</style>

<!-- main -->
<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">예약</a> <a href="#!"
				class="breadcrumb">예약신청</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<div class="main_body" style="width: 70%">
	<!-- 수정부분 -->
	<!-- <div id='calendar'></div> -->
<div class="row center-align">
	<a class="left waves-effect waves-light btn" onclick="beforepage()"><i class="material-icons left">navigate_before</i>1주 전</a>
	<a class="waves-effect waves-light btn modal-trigger" onclick="reservecheck()" href="#modal1" style="padding: 0 2rem; background-color: #FFB74D">예약하기</a>
	<a class="right waves-effect waves-light btn" onclick="nextpage()" ><i class="material-icons right">navigate_next</i>1주 뒤</a>
</div>
<div id="firstpage">
<div id="main_list">
<div style="padding: 0 1rem 0 1rem; font-size: large">
	<script>
		printDate(1);
	</script>
</div>
	
	<c:forEach items="${resultList}" var="resultData" varStatus="loop">
	<div id="selectable" class="accordion row">
		<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div>
	</div>
	
	<div class="panel">
		<div id="${resultData.SUB_CATEGORY_SEQ}first"></div>
		<script>
			var id=${resultData.SUB_CATEGORY_SEQ}+"first";
			var params=${resultData.SUB_CATEGORY_SEQ};
			fn_setfirstList("<c:url value='/wss/equip_List' />", id,params);
		</script>
	</div>
	</c:forEach>
	</div>
<script> setTimeout(function(){
 	for(var data1=0; data1<jbary.length; data1++)
	 {
	  console.log("jbary["+data1+"]:  "+jbary[data1]);
 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
	 }
}, 1000);
</script>
</div>


<div id="secondpage">
<div id="main_list">
<div style="padding: 0 1rem 0 1rem; font-size: large">
	<script>
		printDate(2);
	</script>
</div>

	<c:forEach items="${resultList}" var="resultData" varStatus="loop">
	<div id="selectable" class="accordion row">
		<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div>
		
		
	</div>
	
	<div class="panel">
		<div id="${resultData.SUB_CATEGORY_SEQ}second"></div>
		<script>
			var id=${resultData.SUB_CATEGORY_SEQ}+"second";
			var params=${resultData.SUB_CATEGORY_SEQ};
			fn_setsecondList("<c:url value='/wss/equip_List' />", id,params);
		</script>
	</div>
	</c:forEach>
	</div>
	<!-- fn_setFormTagList 종료 -->

<script>
	setTimeout(function(){
	 	for(var data1=0; data1<jbary.length; data1++)
		 {
		  console.log("jbary["+data1+"]:  "+jbary[data1]);
	 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[5],dateary[9],jbary[data1]);
		 }
	}, 1000);
</script>
</div>
	<!-- /수정부분 -->
 
</div>
<!-- /main -->
<!-- 예약확인 modal -->
<div id="modal1" class="modal">
  <form role="form" method="POST" action="<c:url value='/reserve/reserve_complete'/>">
    <div class="modal-content">
    <div class="row">
			<div class="input-field col s12">
				<span><i class="modal-close material-icons right">close</i></span>
				<h4>임시저장내역</h4>
			</div>
		</div>
      <table class="highlight centered">
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
		<input name="ID" type="hidden" value="AA" class="insertvalue">
	  	</table>
    </div>
    <div class="modal-footer">
      <button class="waves-effect waves-light btn" id="btn_reserve"type="submit">예약하기</button>
    </div>
    </form>
  </div>
<!-- /예약확인 modal -->
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
	 +'<td NAME="RESERVE_E_TIME">'+reserve_e_time+'</td><td><button value='+arr[0]+arr[1]+arr[2]+' class="btn-small btn_delete">X</button></td><input name="EQUIP_SEQ" type="hidden" value='+arr[0]+' class="insertvalue">'
	 +'<input name="RESERVE_DATE" type="hidden" value='+arr[1]+' class="insertvalue"><input name="RESERVE_S_TIME" type="hidden" value='+reserve_s_time+' class="insertvalue"><input name="RESERVE_E_TIME" type="hidden" value='+reserve_e_time+' class="insertvalue">'
	 +'<input name="ID" type="hidden" value="${principalName}" class="insertvalue">'  // member_id값 추가
	 +'</tr>';
	 $('.modal-tbody').append(addDiv);
}
function nextpage(){
	$('#secondpage').css("display","block");
	$('#firstpage').css("display","none");
}
function beforepage(){
	$('#secondpage').css("display","none");
	$('#firstpage').css("display","block");
}
</script>
	<script>

		/* $(function() {
			console.log(jbary);
			test();
		}); */
	</script>
