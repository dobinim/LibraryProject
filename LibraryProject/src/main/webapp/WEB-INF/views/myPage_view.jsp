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
	<h3><i class="fas fa-user mr-2" style="color:#527062;"></i>마이페이지</h3>
	<hr/>
	<div class="row">
		<div class="col-md-2 p-3">
		</div>
		<div class="col-md-8 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 40px 20px 20px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="far fa-clock mr-2"></i>대출·반납</h4>
				<p>도서 대출·반납 내역</p>
				<a href="borrowlist" id="myPage_borrow" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-2 p-3">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 p-3">
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:20px 40px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="fas fa-clipboard-list mr-2"></i>희망도서·예약</h4>
				<p>희망도서·도서예약 신청 현황</p>
				<a href="applist" id="myPage_app" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="p-3" style="height:150px;width:100%;border-radius:40px 20px;background:#ececf0;">
				<h4 class="text-center mt-2"><i class="far fa-address-card mr-2"></i>정보수정</h4>
				<p>내 정보 수정</p>
				<a href="update_view" id="myPage_info" class="stretched-link mt-2" style="text-decoration:none;color:black;"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</div>
		<div class="col-md-2 p-3">
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#myPage_borrow").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#myPage_borrow").attr("href"),
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
	$("#myPage_app").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#myPage_app").attr("href"),
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
	$("#myPage_info").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#myPage_info").attr("href"),
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