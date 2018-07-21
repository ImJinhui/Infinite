<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%-- <link href="<c:url value='/resources/css/customize_fullcalendar.css'/>" type="text/css"	rel="stylesheet"/>
<link href="<c:url value='/resources/css/infinite.css'/>" type="text/css"	rel="stylesheet"/>
<script src="<c:url value='/resources/js/ko.js'/> "></script> --%>
<script>
var newpage = "";
var addIdList = new Array();
var timeid = null;
var equiplistcount=0;
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
                +'<div class="col s2" id='+dateary[0]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[0]+'/am'+' id='+item.EQUIP_SEQ+dateary[0]+'amid'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[0]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[0]+'pmid'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[1]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[1]+'/am'+' id='+item.EQUIP_SEQ+dateary[1]+'amid'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[1]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[1]+'pmid'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[2]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[2]+'/am'+' id='+item.EQUIP_SEQ+dateary[2]+'amid'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[2]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[2]+'pmid'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[3]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[3]+'/am'+' id='+item.EQUIP_SEQ+dateary[3]+'amid'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[3]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[3]+'pmid'+'>오후</button>	</div>'
                +'<div class="col s2" id='+dateary[4]+'><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[4]+'/am'+' id='+item.EQUIP_SEQ+dateary[4]+'amid'+'>오전</button><button class="waves-effect waves-light btn" type="button" onclick="addreserve(this.value)" value='+item.EQUIP_SEQ+'/'+dateary[4]+'/'+'pm'+' id='+item.EQUIP_SEQ+dateary[4]+'pmid'+'>오후</button>	</div>'
                +'</div>';
                jbary[listcount]=item.EQUIP_SEQ;
				listcount++;
                /*                 fn_timeList("<c:url value='/wss/equip_List' />", id,item.EQUIP_SEQ); */
            });
            formTag += '</div>';
           	$('#'+id).html(formTag);
           	addlistcheck();
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
	            		timeid=item.EQUIP_SEQ+item.RESERVE_DATE+'am'+'id';
	            		$('#'+timeid).attr("disabled","disabled");      		
            	}else{
            		timeid=item.EQUIP_SEQ+item.RESERVE_DATE+'pm'+'id';
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

     var date = new Date();
  function printDate() {
     	var datetext1 = "<div class='row'><div class='col s2' style='text-align: center;'></div>"
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
	        datetext1 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
	        }
		datetext1 +="</div>";
			/* document.write(datetext1); */
			$('#datediv').append(datetext1);

}

function printDate1(val) {
     	var datetext1 = "<div class='row'><div class='col s2' style='text-align: center;'></div>";
		var datecount=0;
     	var count=0;
     	if(val==1){
     		date.setTime(date.getTime()+(24*60*60*1000));
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
		        datetext1 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
		        }
			datetext1 +="</div>";
				$('#datediv').append(datetext1);
     	}else{
     		date.setTime(date.getTime()-(24*60*60*1000)*13);
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
    	        datetext1 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
    	        }
    		datetext1 +="</div>";
    			$('#datediv').append(datetext1);
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
#firstpage{
	align:right;
}
#secondpage{
	display:none;
	align:left;
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
<div id="pagebody">
<a class="waves-effect waves-light btn" id="beforepage"><i class="material-icons right">navigate_before</i>1주전 예약보기</a>
<a class="waves-effect waves-light btn" id="nextpage"><i class="material-icons left">navigate_next</i>1주뒤 예약보기</a>
<div id="newpage">
<div id="datediv" style="padding: 0 1rem 0 1rem;">
	<script>
		printDate();
	</script>


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
			equiplistcount++;
		</script>
	</div>
	</c:forEach>
<script> 
setTimeout(function(){
 	for(var data1=0; data1<jbary.length; data1++)
	 {
	  console.log("jbary["+data1+"]:  "+jbary[data1]);
 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
	 }
}, 1000);
</script>
</div>
</div>
</div>




<!-- <a class="waves-effect waves-light btn" onclick="beforepage()"><i class="material-icons right">navigate_before</i>1주전 예약보기</a> -->

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
		<tbody class="modal-tbody" id="tempId">
			
		</tbody>
		<input name="EQUIP_SEQ" type="hidden" value="W-DR01" class="insertvalue">
		<input name="RESERVE_DATE" type="hidden" value="1900-1-1" class="insertvalue">
		<input name="RESERVE_S_TIME" type="hidden" value="09:00" class="insertvalue">
		<input name="RESERVE_E_TIME" type="hidden" value="13:00" class="insertvalue">

	  	</table>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
      <button class="waves-effect waves-light btn-large" id="btn_reserve" type="submit">예약하기</button>
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


for (var i = 0; i < acc.length; i++) {
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
 	$('#'+deleteparam+'id').css("background-color","#26a69a");
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
function addlistcheck(){
		/* $('#newpage').children('#'+addIdList[i]).css("background-color","#ffb74d"); */
		var list = $('#tempId').children('tr');
		var tempidvalue = "";
		for(var j=0;j<list.length;j++){
			tempidvalue = (list[j].attributes[0].value)+'id';
 			$('#'+tempidvalue).css("background-color","#ffb74d");
		}
}
function addreserve(string){
	
	 var arr = string.split('/');
	if('rgb(255, 183, 77)' == $('#'+arr[0]+arr[1]+arr[2]+'id').css("background-color")){
		alert("이미 선택되어 있습니다");
		return;
	}
	var idvalue =arr[0]+arr[1]+arr[2]+'id';
 	addIdList.push(arr[0]+arr[1]+arr[2]+'id');
	M.toast({html: string+'   예약목록에 추가됨'})
	 if(arr[2] =='am'){
		var reserve_s_time = '09:00';
		var reserve_e_time = '13:00';
	 }else{
		var reserve_s_time = '13:00';
		var reserve_e_time = '18:00'; 
	 }
	 $('#'+arr[0]+arr[1]+arr[2]+'id').css("background-color","#ffb74d");
	 var addDiv = '<tr id='+arr[0]+arr[1]+arr[2]+'><td NAME="EQUIP_SEQ">'+arr[0]+'</td><td NAME="RESERVE_DATE">'+arr[1]+'</td><td NAME="RESERVE_S_TIME">'+reserve_s_time+'</td>'
	 +'<td NAME="RESERVE_E_TIME">'+reserve_e_time+'</td><td><button value='+arr[0]+arr[1]+arr[2]+' class="btn_delete">X</button></td><input name="EQUIP_SEQ" type="hidden" value='+arr[0]+' class="insertvalue">'
	 +'<input name="RESERVE_DATE" type="hidden" value='+arr[1]+' class="insertvalue"><input name="RESERVE_S_TIME" type="hidden" value='+reserve_s_time+' class="insertvalue"><input name="RESERVE_E_TIME" type="hidden" value='+reserve_e_time+' class="insertvalue">';
	 +'</tr>';
	 $('.modal-tbody').append(addDiv);
}

$(document).on("click","#nextpage",function(){
	$('#newpage').remove();
	newpage = '<div id="newpage"><div id="datediv" style="padding: 0 1rem 0 1rem;"></div>';
	newpage +='<c:forEach items="${resultList}" var="resultData" varStatus="loop">'
		+'<div id="selectable" class="accordion row">'
		+'<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div></div>'
		+'<div class="panel">'
		+'<div id="${resultData.SUB_CATEGORY_SEQ}first"></div>';
		for(var i=0; i<equiplistcount; i++){
			var id=${resultData.SUB_CATEGORY_SEQ}+"first";
			var params=${resultData.SUB_CATEGORY_SEQ};
			fn_setfirstList("<c:url value='/wss/equip_List' />", id,params);
		}
		newpage +='</div></c:forEach>';
	$('#pagebody').append(newpage);
	setTimeout(function(){
	 	for(var data1=0; data1<jbary.length; data1++)
		 {
	 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
		 }
	}, 1000);
	newpage ='</div></div>';
	$('#pagebody').append(newpage);
	printDate1(1);
	
	acc = document.getElementsByClassName("accordion");


	for (var i = 0; i < acc.length; i++) {
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
});

$(document).on("click","#beforepage",function(){
	$('#newpage').remove();
	newpage = '<div id="newpage"><div id="datediv" style="padding: 0 1rem 0 1rem;"></div>';
	newpage +='<c:forEach items="${resultList}" var="resultData" varStatus="loop">'
		+'<div id="selectable" class="accordion row">'
		+'<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div></div>'
		+'<div class="panel">'
		+'<div id="${resultData.SUB_CATEGORY_SEQ}first"></div>';
		for(var i=0; i<equiplistcount; i++){
			var id=${resultData.SUB_CATEGORY_SEQ}+"first";
			var params=${resultData.SUB_CATEGORY_SEQ};
			fn_setfirstList("<c:url value='/wss/equip_List' />", id,params);
		}
		newpage +='</div></c:forEach>';
	$('#pagebody').append(newpage);
	setTimeout(function(){
	 	for(var data1=0; data1<jbary.length; data1++)
		 {
	 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
		 }
	}, 1000);
	newpage ='</div></div>';
	$('#pagebody').append(newpage);
	printDate1(0);
	
	acc = document.getElementsByClassName("accordion");


	for (var i = 0; i < acc.length; i++) {
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
});
/* function nextpage(){
	
	$('#newpage').remove();
	newpage = '<div id="newpage"><div id="datediv" style="padding: 0 1rem 0 1rem;">아빡친다';
	$('#pagebody').append(newpage);
	printDate();

	newpage ='<c:forEach items="${resultList}" var="resultData" varStatus="loop">'
		+'<div id="selectable" class="accordion row">'
		+'<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div></div>'
		+'<div class="panel">'
		+'<div id="${resultData.SUB_CATEGORY_SEQ}first"></div>';
	$('#pagebody').append(newpage);
	
	var id=${resultData.SUB_CATEGORY_SEQ}+"first";
	var params=${resultData.SUB_CATEGORY_SEQ};
	fn_setfirstList("<c:url value='/wss/equip_List' />", id,params);
	newpage ='</div></c:forEach>';
	
	$('#pagebody').append(newpage);
	setTimeout(function(){
	 	for(var data1=0; data1<jbary.length; data1++)
		 {
		  console.log("jbary["+data1+"]:  "+jbary[data1]);
	 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);
		 }
	}, 1000);
	newpage ='</div></div>';
	$('#pagebody').append(newpage);
} */
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
