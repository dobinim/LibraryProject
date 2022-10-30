<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
#best a {
	color : black;
	text-decoration : none;
}
</style>
</head>
<body>

<h5><b><i class="far fa-question-circle" style="color:#527062"></i>&nbsp;자주하는 질문 <span style="color:#527062;">BEST 5</span></b></h5>
<div id="best" class="mt-2">
	<div class="card">
		<div class="card-body" id="q1">
			<a href="#a1" class="card-link">
				<b style="color:#527062;">Q.</b>&nbsp;&nbsp; <b>도서관을 처음 이용하려고 합니다. 어떤 절차로 이용하여야 합니까?</b>
			</a>
		</div>
		<div id="a1" class="collapse" data-parent="#best">
			<div class="card-body" style="background:#ececf0;">
				<p class="p-3">
					신분증을 지참하고 1층 이용증 발급실에서 이용자 등록(이용자 등록은 인터넷으로도 하실 수 있습니다.) 및 이용증을 발급받으신 후, 
					필기도구 이외의 개인 소지품은 1층 물품보관실에 보관하시고 이용하시면 됩니다.
					<br/><br/>
					또한 도서관 소장 자료는 도서관 내에서만 이용하실 수 있으며, 개인 책을 가지고 공부할 수 있는 일반열람실은 운영하지 않습니다.
				</p>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body" id="q2">
			<a href="#a2" class="card-link">
				<b style="color:#527062;">Q.</b>&nbsp;&nbsp; <b>비치희망 신청은 어떻게 해야 하나요?</b>
			</a>
		</div>
		<div id="a2" class="collapse" data-parent="#best">
			<div class="card-body" style="background:#ececf0;">
				<p class="p-3">
					자료검색에서 찾고자 하는 자료가 검색결과에 없을 경우 "희망도서신청" 클릭을 통해 신청하실 수 있습니다.<br/>
					로그인 후 신청하시고자 하는 자료명, 저자명, 출판사 등을 입력하시면 됩니다.
				</p>
			</div>
		</div>
	</div>
</div>			

<script>
	$(document).ready(function(){
		$("#q1").css("cursor","pointer").click(function(event){
			event.preventDefault();
			var submenu = $(this).next("#a1")
			
			if(submenu.is(":visible")){
				submenu.slideUp();
			}
			else {
				submenu.slideDown();
			}
		});
		$("#q2").css("cursor","pointer").click(function(event){
			event.preventDefault();
			var submenu = $(this).next("#a2")
			
			if(submenu.is(":visible")){
				submenu.slideUp();
			}
			else {
				submenu.slideDown();
			}
		});
	});
</script>	
</body>
</html>