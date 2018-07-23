<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>
.card .card-image img {
	height: 230px;
}
</style>
<script>
$(document).ready(function(){
    $('.slider').slider();
  });

</script>

<style>
#index-banner {
	background-image:
		url("<c:url value='/resources/images/infinite_main2.jpg'/>");
	height: 23rem;
}
</style>


<!-- main -->

<div class="slider">
	<ul class="slides">
		<li><img
			src="<c:url value='/resources/images/infinite_main1.jpg'/>"></li>
		<li><img
			src="<c:url value='/resources/images/infinite_main2.jpg'/>"></li>
		<li><img
			src="<c:url value='/resources/images/infinite_main3.jpg'/>"></li>
	</ul>
</div>


<!-- <div class="section no-pad-bot" id="index-banner">

  </div> -->


<div class="container">
	<div class="section">

		<!--   Icon Section   -->
		<div class="row">
			<div class="row">
				<h2 class="center light-blue-text">
					<i class="material-icons">settings</i>
				</h2>
				<h5 class="center">최다 예약 장비</h5>
			</div>
			<c:forEach items="${resultList}" var="resultData" varStatus="loop">
				<div class="col s12 m4">
					<div class="icon-block">
						<div class="card hoverable">
							<div class="card-image waves-effect waves-block waves-light">
								<%-- <img class="activator"
									src="<c:url value='/resources/images/lasercutter.PNG'/>"> --%>
								<img class="activator"
									src="<c:url value='/resources/uploads/${resultData.PHYSICALFILE_NAME}'/>">
							</div>
							<div class="card-content">
								<span class="activator grey-text text-darken-4">${resultData.EQUIP_SEQ}
								</span> <a class="right"
									href="<c:url value='/admin/equip/equip_edit?EQUIP_SEQ=${resultData.EQUIP_SEQ}'/>">예약하기</a>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>



		<!--      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
            <h5 class="center">Speeds up development</h5>

            <p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
            <h5 class="center">User Experience Focused</h5>

            <p class="light">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
            <h5 class="center">Easy to work with</h5>

            <p class="light">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>
          </div>
        </div>
      </div> -->

	</div>
	<br>
	<br>
</div>
<!-- main -->

