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
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<div class="container mt-5 p-3 text-center">
	<h3><i class="fas fa-cog mr-2" style="color:#527062;"></i>관리페이지</h3>
	<hr/>
	<div class="row">
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:20px 40px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-user-alt mr-2"></i>회원관리</h4>
				<p>회원 정보 확인 및 관리자 권한 설정</p>
				<a href="admin_user" id="admin_user" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 40px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-calendar mr-2"></i>일정관리</h4>
				<p>도서관 휴무 및 행사 일정</p>
				<a href="admin_calendar" id="admin_calendar" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 20px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-book-reader mr-2"></i>희망도서관리</h4>
				<p>희망도서 신청 확인 및 절차 관리</p>
				<a href="admin_application" id="admin_application" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 20px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-book mr-2"></i>도서·대출·반납관리</h4>
				<p>도서 정보 수정 및 도서 대출·반납</p>
				<a href="admin_book" id="admin_book" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 40px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-pen-nib mr-2"></i>도서등록</h4>
				<p>자료 및 도서 등록</p>
				<a href="bookRegistration" id="admin_registration" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:20px 40px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fa fa-shopping-cart mr-2"></i>예약확인</h4>
				<p>도서 예약 확인</p>
				<a href="admin_bookReservation" id="admin_reservation" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
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
});
</script>
</body>
</html>