<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!-- 페이지 이름 -->
<nav class="teal">
	<div class="nav-wrapper">
		<div class="bread_div">
			<a href="#!" class="breadcrumb">로그인</a>
		</div>
	</div>
</nav>
<!-- /페이지 이름 -->

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#loginbtn")
								.click(
										function() {
											if ($("#id").val() == "") {
												alert("아이디를 입력해주세요");
												$("#id").focus();
											} else if ($("#password").val() == "") {
												alert("비밀번호를 입력해주세요");
												$("#password").focus();
											} else {
												$("#loginform")
														.attr("action",
																"<c:url value='/j_spring_security_check'/>");
												$("#loginform").submit();

											}
										})
					});
</script>

<!-- main -->
<div class="main_body" style="width: 50%;">
	<!-- 수정부분 -->
	<div class="row box">
		<form class="col s12" role="form" method="POST" id="loginform"
			name="loginform" action="">
			<div class="row">






				<div class="input-field col s12">
					<input name="id" id="id" type="text" class="validate"> <label
						for="id">아이디</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input name="password" id="password" type="password"
						class="validate"> <label for="password">비밀번호</label>


					<c:if test="${not empty param.fail}">
						<font color="red">
							<p>아이디와 비밀번호가 일치하지 않습니다.</p>
							<p>Reason:${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						</font>
						<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />
					</c:if>




				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<button class="waves-effect waves-light btn-large" id="loginbtn"
						style="width: 100%; margin: 0 auto;" type="submit" name="action">로그인
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div style="border-top: 1px solid #EAEAEA; padding-top: 2%;">
						<a href="<c:url value='/common/signup'/>"
							style="text-decoration: none; color: #ABABAB;">회원가입</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /수정부분 -->
</div>
<!-- /main -->



