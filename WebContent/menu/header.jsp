<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>HOMEPAGE_HY</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<script type="text/javascript" src="./jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".menu button").click(function(){
		var submenu = $(this).next("div");
		
		if(submenu.is(":visible")){
			submenu.slideUp();
		}else {
			submenu.slideDown();
		}
	});
});
</script>
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-third img {
	margin-bottom: -6px;
	opacity: 0.8;
	cursor: pointer
}

.w3-third img:hover {
	opacity: 1
}
.menu a {
	cursor : pointer;
}

</style>
<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index: 3; width: 300px; font-weight: bold" id="mySidebar">
		<br>
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a> 
		<h3 class="w3-padding-64 w3-center">
			<b>SOME<br>NAME
			</b>
		</h3>
		<a href="./member/agreement.jsp" onclick="w3_close()" class="w3-bar-item w3-button" style="text-decoration: underline; width: 50%; display: inline;">회원가입</a>
		<a href="./member/login.jsp" onclick="w3_close()" class="w3-bar-item w3-button" style="text-decoration: underline; width: 50%; display: inline;">로그인</a> 
		<br><br>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">방명록</a>
		<!--slidedown-->
		<div class="w3-container menu">
			<div class="w3-dropdown-hover">
				<button class="w3-bar-item w3-button w3-white w3-text-grey hide">회원관리</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<a href="#" class="w3-bar-item w3-button w3-text-grey">회원수정</a> 
					<a href="#" class="w3-bar-item w3-button w3-text-grey">회원탈퇴</a> 
					<a href="#" class="w3-bar-item w3-button w3-text-grey">사진수정</a>
				</div>
			</div>
		</div>
		
		<div class="w3-container menu">
			<div class="w3-dropdown-hover">
				<button class="w3-bar-item w3-button w3-white w3-text-grey ">게시판</button>
				<div class="w3-dropdown-content w3-bar-block w3-border hide">
					<a href="#" class="w3-bar-item w3-button w3-text-grey">자유게시판</a> 
					<a href="#" class="w3-bar-item w3-button w3-text-grey">이미지게시판</a> 
					<a href="#" class="w3-bar-item w3-button w3-text-grey">Q&A</a>
				</div>
			</div>
		</div>
		<!--slidedown-->
	</nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
		<span class="w3-left w3-padding">SOME NAME</span> 
		<a href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="w3_open()">☰</a>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div class="w3-main" style="margin-left: 300px">