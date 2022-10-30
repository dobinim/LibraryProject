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
<style>
#userTable1 .col-3 {
	background-color : #ececf0;
	text-align : center;
}
#userTable2 .col-3 {
	background-color : #ececf0;
	text-align : center;
}
#userTable1, #userTable2 {
	vertical-align: center;
}
</style>
</head>
<body>

<input type="hidden" name="pid" value="${userDetail.pid}" id="pid"/>
<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="admin_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fa fa-address-book"></i>&nbsp;<b>회원 정보 조회</b></h3>
		<hr/>
		<h5>기본 정보</h5>
		<table class="table" style="border-top:2px solid black; border-bottom:2px solid black;" id="userTable1">
			<tr>
				<td class="col-3">이름</td>
				<td class="col-9">${userDetail.pname}</td>
			</tr>
			<tr>
				<td class="col-3">아이디</td>
				<td class="col-9">${userDetail.pid}</td>
			</tr>
			<tr>
				<td class="col-3">생년월일</td>
				<td class="col-9">${userDetail.birth1}년&nbsp;&nbsp;${userDetail.birth2}월&nbsp;&nbsp;${userDetail.birth3}일</td>
			</tr>
		</table>
		<br/>
		<h5>연락처 정보</h5>
		<table class="table" style="border-top:2px solid black; border-bottom:2px solid black;" id="userTable2">
			<tr>
				<td class="col-3">이메일</td>
				<td class="col-9">${userDetail.pmail1}@${userDetail.pmail2}</td>
			</tr>
			<tr>
				<td class="col-3">연락처</td>
				<td class="col-9">${userDetail.ppn1}-${userDetail.ppn2}-${userDetail.ppn3}</td>
			</tr>
			<tr>
				<td class="col-3">주소</td>
				<td class="col-9">
					<div class="m-2">
						${userDetail.postcode}<br/>
						${userDetail.address}<br/>
						${userDetail.detailaddress}&nbsp;&nbsp;
						${userDetail.extraaddress}
					</div>
				</td>
			</tr>
		</table>
		<hr/>
		<div align="right">
			<a class="userDel btn btn-danger" style="color:white;" href="AdminUserDelete" id="AdminUserDelete"><i class="fa fa-times"></i>&nbsp;회원탈퇴</a>
			<a class="btn" style="background:#3f3f48;color:white;" href="admin_user" id="userPage"><i class="fas fa-backspace"></i>&nbsp;목록</a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#userPage").click(function(event){
		event.preventDefault();
		$.ajax({
			url : "admin_user",
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
	$(".userDel").click(function(event){
		event.preventDefault();
		if(confirm("회원을 탈퇴시키겠습니까?") == true) {
			let id = $("#pid").attr("value"); 
			$.ajax({
				url : "adminUserDelete?pid=" + id,
				type : "GET",
				data : "",
				success : function(data){
					alert("회원탈퇴가 완료되었습니다. 페이지를 이동합니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});	
		}
	});
});
</script>
</body>
</html>