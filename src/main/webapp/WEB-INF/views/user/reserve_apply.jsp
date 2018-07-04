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
	height: 70px;
	background-color: #2ec5b6;
	
}


</style>

  <!-- main -->
  <div class="main_body row">
  <!-- 수정부분 -->
  <!-- left -->
  <div class="col s3">
	  <ul class="collapsible">
	    <li>
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
 	 <div class="row" style="text-align: center;">
  	 
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      <div class="col s2 card date_card btn">07/02</div>
      
  
  
  	</div>
  	
  	
  	
  	<div class="row">
  	<div class="card">
  	 <div class="collection">
        <a href="#!" class="collection-item">Alvin</a>
        <a href="#!" class="collection-item">Alvin</a>
        <a href="#!" class="collection-item">Alvin</a>
        <a href="#!" class="collection-item">Alvin</a>
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
  
  

