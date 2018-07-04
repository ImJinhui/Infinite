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

  <!-- main -->
  <div class="main_body row">
  <!-- 수정부분 -->
  <!-- left -->
  <div class="col s3">
	  <ul class="collapsible">
	    <li>
	      <div class="collapsible-header">3D Printer</div>
	      
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Printer 1</a>
	        <a href="#!" class="collection-item">Printer 2</a>
	        <a href="#!" class="collection-item">Printer 3</a>
	        <a href="#!" class="collection-item">Printer 4</a>
	      </div>
	      
	    </li>
	    <li>
	      <div class="collapsible-header">Laser Cutter</div>
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Cutter 1</a>
	        <a href="#!" class="collection-item">Cutter 2</a>
	        <a href="#!" class="collection-item">Cutter 3</a>
	        <a href="#!" class="collection-item">Cutter 4</a>
	      </div>
	    </li>
	    <li>
	      <div class="collapsible-header"><i class="material-icons">whatshot</i>Computer</div>
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
  <table>
        <tbody>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
            <td>$3.76</td>
          </tr>
          
        </tbody>
      </table>
  
  </div>
  <!-- /center -->
  
  <!-- right -->
  <div class="col s3">
 	<ul class="collection with-header">
 	
      <li class="collection-header"><h5>선택목록</h5></li>
      
      <li class="card" style="width: 90%;">
        <div class="card-content">
          <p class="card-title">3D Printer</p>
          <p>2018년 7월 4일</p>
          <p>12:00 ~ 13:00</p>
        </div>
      </li>
      <li class="card" style="width: 90%;">
        <div class="card-content">
          <span class="card-title">3D Printer</span>
          <p>2018년 7월 4일</p>
          <p>13:00 ~ 14:00</p>
        </div>
      </li>
      <li class="card" style="width: 90%;">
        <div class="card-content">
          <span class="card-title">Laser Cutter</span>
          <p>2018년 7월 4일</p>
          <p>12:00 ~ 13:00</p>
        </div>
      </li>
    
  	</ul>
  </div>
  <!-- /right -->
  
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

