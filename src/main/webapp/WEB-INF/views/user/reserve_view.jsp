<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:set var="principalName" value="${pageContext.request.userPrincipal.name }" />
<script>
var newpage = "";
var addIdList = new Array();
var timeid = null;
var equiplistcount=0;
var dateary = new Array();	/* 일,월요일을 제외한 5일을 저장하는 배열 */
var jbary = new Array();
var listcount = 0;
var fn_setfirstList = function(url, id, params) {	/* 예약버튼(오전,오후)을 생성하기 위해 각 sub_category_seq로 해당하는 장비의  예약정보를 가져와 하위태그에 버튼을 생성함 */
    $.ajax({
        type : "GET", 
        url : url, 
        dateType : "JSON",
        data : {'SUB_CATEGORY_SEQ': params}, /* sub_category_seq 를 파라미터로 할당함 */
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
                +'</div>';				/* 예약버튼을 생성함. 각 버튼마다 아이디는 장비명+예약날짜+am or pm 으로 생성되고 또한 버튼마다 장비명/예약날짜/am or pm 으로 값을 지정함 여기서 지정한 값들은 버튼을 클릭하였을떄 modal태그에 tr태그의 아이디 생성을 위해 사용함 */
                jbary[listcount]=item.EQUIP_SEQ;	/* 버튼 생성이 완료된후 예약신청이 가능여부를 체크하는 ajax에 파라미터로 던질 날짜정보를 jbary 배열에 저장함 */
				listcount++;
                /*                 fn_timeList("<c:url value='/wss/equip_List' />", id,item.EQUIP_SEQ); */
            });
            formTag += '</div>';
           	$('#'+id).html(formTag);
           	addlistcheck(); /* madal 태그에 있는 tr태그의 유무에 따라 버튼색상을 변경하는 함수 */
        }
        , error : function(request,status,error) {
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert("Failure \n ("+status+")");
            return false;
        }
    });
};

var fn_timeList = function(url,param1, param2, param3) {	/* 데이터베이스에 예약이 있는지 없는지 확인하여 버튼을 활성화.또는 비활성화 를 결정하는 함수 */
    $.ajax({
        type : "GET", 
        url : url, 
        dateType : "JSON",
        data : {'RESERVE_S_DATE': param1,'RESERVE_E_DATE': param2,'EQUIP_SEQ': param3}, /* 장비명/ 사용시작시간/종료시간을 파라미터로 줌 */
        async: true
        , success : function(data) { /* 예약이 있을시 */
        	if(data ==("")){
        		
        	}
            $.each(data, function(i,item){
            	var stime = item.RESERVE_S_TIME;	
            	var etime = item.RESERVE_E_TIME;
            	if(stime == ("09:00")){	/* 받아온 예약정보의 시작시간이 9시 이면 해당버튼을 비활성화 */
	            		timeid=item.EQUIP_SEQ+item.RESERVE_DATE+'am'+'id';
	            		$('#'+timeid).attr("disabled","disabled");      		
            	}else{ /* 받아온 예약정보의 시작시간이 13시 이면 해당버튼을 비활성화 */
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

     var date = new Date();		/* 날짜 객체 생성(오늘기준) */
  function printDate() {
     	var datetext1 = "<div class='row'><div class='col s2' style='text-align: center;'></div>"
		var datecount=0;
     	var count=0;
		for(var i = 0; datecount<5; i++){	/* 5개의 날짜만 불러오기 떄문에 5회반복 */
			if(i!=0){
				date.setTime(date.getTime()+(24*60*60*1000));	/* 현재시간에서 하루를 더함 */
			}
			var day  = date.getDate();		/* 일 */
	        var month = date.getMonth() + 1;	/* 월 */
	        var year = date.getYear();	/* 년도 */
	        var dow = date.getDay();	/* 요일 */
	        year = (year < 1000) ? year + 1900 : year;
	        if(dow==0||dow==1) continue;	/* 일요일이나 월요일은 반복문을 건너띄움. */
	        else datecount++;	/* 일요일 월요일이 아닐떄만 datecount 변수를 증가시켜 반복문을 5회 반복하게 만듬 */
	        switch(dow){
			case 0:dow="일";break;
			case 1:dow="월";break;
			case 2:dow="화";break;
			case 3:dow="수";break;
			case 4:dow="목";break;
			case 5:dow="금";break;
			case 6:dow="토";break;
			default:break;			/* 요일 지정(현재 사용 X 추후 사용가능) */
			}
	        datevalue = year+"-"+month+"-"+day;	/* 날짜를 표시하는 div태그에 id를 지정하기위해 년도-월-일 형식으로 변수를 저장*/
	        dateary[count] = datevalue;
	        count++;
	        datetext1 += "<div class='col s2' id='date"+i+"' value="+datevalue+">"+month+"/"+day+"</div>";
	        }
		datetext1 +="</div>";
			/* document.write(datetext1); */
			$('#datediv').append(datetext1);	/* datediv태그에 날짜정보 태그를 추가하여 화면에 출력 */

}

function printDate1(val) {			/* 동작은 위의 날짜함수와 같음. 차이점은 위의 함수는 페이지를 처음 불러올떄만 사용하고 아래 함수는 1주뒤/1주전 버튼을 클릭하였을때 사용됨 */
     	var datetext1 = "<div class='row'><div class='col s2' style='text-align: center;'></div>";
		var datecount=0;
     	var count=0;
     	if(val==1){	/* 변수가 1이면 1주뒤의 날짜정보를 화면에 출력함 */
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
     	}else{	/* 변수가 0이면 1주전의 날짜정보를 화면에 출력함 */
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
#newpage{
	margin: 3rem 0;
	padding:2rem;
	border: 1.3px solid #d4d4d4;
}
#datediv{

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
<div class="row center-align">
	<a class="waves-effect waves-light btn" id="beforepage"><i class="material-icons left">navigate_before</i>1주 전</a>
	<a class="waves-effect waves-light btn modal-trigger" onclick="reservecheck()" href="#modal1">예약목록보기</a>
	<a class="waves-effect waves-light btn" id="nextpage"><i class="material-icons right">navigate_next</i>1주 뒤</a>
</div>
<div id="newpage">
<div id="datediv">
	<script>
		printDate();
	</script>


	<c:forEach items="${resultList}" var="resultData" varStatus="loop">	<!-- resultList에는 컨트롤러에서 로그인한 아이디가 가진 능력카드정보를 조회해 예약가능한 장비의 목록만을 가지고 있음 -->
	<div id="selectable" class="accordion row">
		<div class="col s12">${resultData.SUB_CATEGORY_NAME}</div>	<!-- selectable.sub_category_name -->
	</div>
	
	<div class="panel">	<!-- 위의 selectable을 선택하였을때 보여주는 하위 태그의 내용을 아래에 작성한다 -->
		<div id="${resultData.SUB_CATEGORY_SEQ}first"></div>	<!-- 아이디를 위와 다르게 하기위해 임의로 first라는 단어를 추가한것이므로 신경쓸지 말것  -->
		<script>
			var id=${resultData.SUB_CATEGORY_SEQ}+"first";
			var params=${resultData.SUB_CATEGORY_SEQ};	/* 세부 장비목록을 받아오기 위해 변수정보와  ajax 실행후 정보는 받을 태그의 id를 지정함 */
			fn_setfirstList("<c:url value='/wss/equip_List' />", id,params);	/* 세부 장비 목록을 불러오는 ajax호출 */
			equiplistcount++;
		</script>
	</div>
	</c:forEach>
<script> 
setTimeout(function(){	/* 아래 정의된 기능을 페이지가 실행되고 1000ms 이후 실행하는 함수 */
 	for(var data1=0; data1<jbary.length; data1++)
	 {
	  console.log("jbary["+data1+"]:  "+jbary[data1]);	
 	  fn_timeList("<c:url value='/wss/reserve_time' />",dateary[0],dateary[4],jbary[data1]);	/* 현재 보여지는 날짜 정보의 시작dateary[0]과 끝dateary[4] (ex. 17 18 19 20 21을 화면에 보여준다고 할떄 17일과 21일), 장비목록을 변수로 줌 */
	 }	
}, 1000);
</script>
</div>
</div>
</div>




<!-- <a class="waves-effect waves-light btn" onclick="beforepage()"><i class="material-icons right">navigate_before</i>1주전 예약보기</a> -->

	<!-- /수정부분 -->
 <!-- <a class="waves-effect waves-light btn modal-trigger" onclick="reservecheck()" href="#modal1">예약목록보기</a> -->
</div>
<!-- /main -->
<!-- 예약확인 modal -->
<div id="modal1" class="modal">				<!-- 오전,오후 버튼을 눌렀을때  해당 예약정보를 모달 테이블에 추가함-->
  <form role="form" method="POST" action="<c:url value='/reserve/reserve_complete'/>">
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
			<!-- 예약 정보들이 저장되는 위치 -->
		</tbody>
		<input name="EQUIP_SEQ" type="hidden" value="W-DR01" class="insertvalue">
		<input name="RESERVE_DATE" type="hidden" value="1900-1-1" class="insertvalue">
		<input name="RESERVE_S_TIME" type="hidden" value="09:00" class="insertvalue">
		<input name="RESERVE_E_TIME" type="hidden" value="13:00" class="insertvalue">
		<input name="ID" type="hidden" value="AA" class="insertvalue">
		<!-- 위의 4개의 input정보는 복수개의 입력 정보는 컨트롤러에 넘기기 위한 더미데이터 이므로 신경쓸필요가 없으나 삭제하면 안됨 -->
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

$(document).on("click",".btn_delete",function(){ /* 모달창에서 선택한 예약정보를 삭제하기위해 x버튼을 눌렸을때 실행 */
	var deleteparam = $(this).attr('value');	/* 클릭한 버튼값을 가져와서 */
	$('tr').remove('#'+deleteparam);/* 클릭한 버튼값과 일치하는 tr태그를 삭제함*/
 	$('#'+deleteparam+'id').css("background-color","#26a69a");	/* 삭제한 목록과 일치하는 버튼의 색을 선택전의 색으로 되돌림 */
 	reservecheck();	/* 예약목록갯수를 확인하여 예약버튼 활성화/비활성화 여부 체크 */
});	

function reservecheck(){	/* 예약목록갯수를 확인하여 예약버튼 활성화/비활성화 여부 체크. 현재 예약목록이 빈상태에서 예약하기 버튼을 누르면 오류가 발생하기 떄문에 목록이 없으면 실행되지 못하도록 함 */
	var reservelistcheck =$(".modal-tbody").children().length;	/* 예약목록의  tr태그 갯수를 가져와서 0개이면 예약버튼을 비활성화 시킴 */
	if(reservelistcheck > 0){
		$('#btn_reserve').attr("disabled",false);
	}else{
		$('#btn_reserve').attr("disabled","disabled");
	}
}
function addlistcheck(){
		/* $('#newpage').children('#'+addIdList[i]).css("background-color","#ffb74d"); */
		var list = $('#tempId').children('tr');	/* 예약 목록에 있는 tr태그들을 배열에 저장 */
		var tempidvalue = "";
		for(var j=0;j<list.length;j++){	/* tr태그의 갯수만큼 반복문을 실행하여 */
			tempidvalue = (list[j].attributes[0].value)+'id';	/* tr태그에 있는 id값을 가져와서 */
 			$('#'+tempidvalue).css("background-color","#ffb74d"); /* 해당하는 아이디값을 가진 오전.오후 버튼의 상태를 예약선택하였을때 상태로 변경함 */
		}
}
function addreserve(string){
	
	 var arr = string.split('/');	/* 클릭한 버튼의 값을 가져와 '/' 문자를 기준으로 분리함 */ /* arr[0]:장비아이디 arr[1]:예약 날짜arr[2]: 시간 */
	if('rgb(255, 183, 77)' == $('#'+arr[0]+arr[1]+arr[2]+'id').css("background-color")){ /* 선택한 버튼의 색상이 선택하였을떄 색상(#ffb74d)과 같으면 */
		alert("이미 선택되어 있습니다");
		return;	/* 선택된 버튼이 이미 선택되어 있으면 아래의 예약목록에 추가하는 기능을 실행하지 않음 */
	}
	var idvalue =arr[0]+arr[1]+arr[2]+'id';/* 사용안하지만 일단 남겨둠 */
 	addIdList.push(arr[0]+arr[1]+arr[2]+'id');/* 사용안하지만 일단 남겨둠 */
	M.toast({html: string+'   예약목록에 추가됨'})
	 if(arr[2] =='am'){	/* 오전 오후에 따라 시작/종료시간을 변수에 지정함 */
		var reserve_s_time = '09:00';
		var reserve_e_time = '13:00';
	 }else{
		var reserve_s_time = '13:00';
		var reserve_e_time = '18:00'; 
	 }
	 $('#'+arr[0]+arr[1]+arr[2]+'id').css("background-color","#ffb74d");/* 선택한 버튼 색상 변경 */
	 var addDiv = '<tr id='+arr[0]+arr[1]+arr[2]+'><td NAME="EQUIP_SEQ">'+arr[0]+'</td><td NAME="RESERVE_DATE">'+arr[1]+'</td><td NAME="RESERVE_S_TIME">'+reserve_s_time+'</td>'
	 +'<td NAME="RESERVE_E_TIME">'+reserve_e_time+'</td><td><button value='+arr[0]+arr[1]+arr[2]+' class="btn_delete">X</button></td><input name="EQUIP_SEQ" type="hidden" value='+arr[0]+' class="insertvalue">'
	 +'<input name="RESERVE_DATE" type="hidden" value='+arr[1]+' class="insertvalue"><input name="RESERVE_S_TIME" type="hidden" value='+reserve_s_time+' class="insertvalue"><input name="RESERVE_E_TIME" type="hidden" value='+reserve_e_time+' class="insertvalue">'
 	 +'<input name="ID" type="hidden" value="${principalName}" class="insertvalue">'  // member_id값 추가
 	 +'</tr>'; /* 선택한 버튼의 정보를 이용해 모달창에 예약목록 정보에 tr태그로 추가함 */
	 $('.modal-tbody').append(addDiv);
}

$(document).on("click","#nextpage",function(){	/* 현재에서 1주 뒤의 예약정보를 가져오도록 하는 함수. 기존에 있던 페이지(#newpage태그)의 정보를 지우고 새로운 정보를 가져옴 위에서 페이지가 실행할 때 했던 동작을 그대로 한다고 생각하면됨 자세한점은 문의바람*/
	$('#newpage').remove();
	newpage = '<div id="newpage"><div id="datediv"></div>';
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

$(document).on("click","#beforepage",function(){/* 현재에서 1주 전의 예약정보를 가져오도록 하는 함수.*/
	$('#newpage').remove();
	newpage = '<div id="newpage"><div id="datediv"></div>';
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
