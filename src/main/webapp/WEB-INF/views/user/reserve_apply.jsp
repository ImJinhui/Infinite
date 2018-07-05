<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

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
</style>

  <!-- main -->
  <div class="main_body row">
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
	    <li>
	      <div class="collapsible-header"><i class="material-icons">computer</i>Computer</div>
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Computer 1</a>
	        <a href="#!" class="collection-item">Computer 2</a>
	        <a href="#!" class="collection-item">Computer 3</a>
	        <a href="#!" class="collection-item">Computer 4</a>
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
 	<div class="row" style="text-align: center;">
  	 
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
  	</div>
  	
  	
  	
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
  
  

