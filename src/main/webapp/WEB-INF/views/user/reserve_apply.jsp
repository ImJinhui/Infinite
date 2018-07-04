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
  <div class="main_body">
  <!-- 수정부분 -->
  <!-- left -->
  <div class="col s3">
	  <ul class="collapsible">
	    <li>
	      <div class="collapsible-header"><i class="material-icons">filter_drama</i>3D Printer</div>
	      
	      <div class="collapsible-body collection">
	        <a href="#!" class="collection-item">Printer 1</a>
	        <a href="#!" class="collection-item">Printer 2</a>
	        <a href="#!" class="collection-item">Printer 3</a>
	        <a href="#!" class="collection-item">Printer 4</a>
	      </div>
	      
	    </li>
	    <li>
	      <div class="collapsible-header"><i class="material-icons">place</i>Laser Cutter</div>
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
  <div class="col s6"></div>
  <!-- /center -->
  
  <!-- right -->
  <div class="col s3"></div>
  <!-- /right -->
  
  <!-- /수정부분 -->
  </div>
  <!-- /main -->
  
  

