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
#admin_user, #admin_calendar, #admin_book, #admin_registration, #admin_application, #admin_reservation {
	color : black;
	font-weight : bold;
	font-size : 15px;
	text-decoration : none;
}
</style>
</head>
<body>

<h4 style="text-align:center;font-weight:bold;" class="mt-3">관리페이지</h4>
<hr style="border:1px solid black;"/>
<table class="table table-borderless table-hover" id="left-menu">
	<tbody>
		<tr id="tr1">
			<td>
				<a href="admin_user" id="admin_user">회원관리<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr2">
			<td>
				<a href="admin_calendar" id="admin_calendar">일정관리<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr3">
			<td>
				<a href="admin_application" id="admin_application">희망도서관리<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr4">
			<td>
				<a href="admin_book" id="admin_book">도서·대출관리<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr5">
			<td>
				<a href="bookRegistration" id="admin_registration">도서등록<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr6">
			<td>
				<a href="admin_bookReservation" id="admin_reservation">예약확인<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
	</tbody>
</table>

<script>
$(document).ready(function(){
	$("#admin_user").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_user").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ 
				$("#mainRegion").html(data);
			},
			error : function(){ 
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#admin_book").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_book").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ 
				$("#mainRegion").html(data);
			},
			error : function(){ 
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#admin_registration").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_registration").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ 
				$("#mainRegion").html(data);
			},
			error : function(){ 
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#admin_application").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_application").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ 
				$("#mainRegion").html(data);
			},
			error : function(){ 
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#admin_reservation").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_reservation").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ 
				$("#mainRegion").html(data);
			},
			error : function(){ 
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#tr1").mouseover(function(){
		$("#admin_user").css("color", "#8dab9f");	
	});
	$("#tr1").mouseout(function(){
		$("#admin_user").css("color", "black");	
	});	
	$("#tr2").mouseover(function(){
		$("#admin_calendar").css("color", "#8dab9f");	
	});
	$("#tr2").mouseout(function(){
		$("#admin_calendar").css("color", "black");	
	});
	$("#tr3").mouseover(function(){
		$("#admin_application").css("color", "#8dab9f");	
	});
	$("#tr3").mouseout(function(){
		$("#admin_application").css("color", "black");	
	});
	$("#tr4").mouseover(function(){
		$("#admin_book").css("color", "#8dab9f");	
	});
	$("#tr4").mouseout(function(){
		$("#admin_book").css("color", "black");	
	});
	$("#tr5").mouseover(function(){
		$("#admin_registration").css("color", "#8dab9f");	
	});
	$("#tr5").mouseout(function(){
		$("#admin_registration").css("color", "black");	
	});
	$("#tr6").mouseover(function(){
		$("#admin_reservation").css("color", "#8dab9f");	
	});
	$("#tr6").mouseout(function(){
		$("#admin_reservation").css("color", "black");	
	});
});
</script>
</body>
</html>