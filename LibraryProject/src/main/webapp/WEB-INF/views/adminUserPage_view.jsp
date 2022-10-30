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
</head>
<body>

<form action="#" method="post" id="authForm" name="authForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table class="table table-bordered text-center table-hover" id="adminUserTable" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead style="background:#d7d8df;">
			<tr>
				<th>&nbsp;&nbsp;</th>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>가입날짜</th>
				<th>권한</th>
			</tr>
		</thead>
		<tbody class="text-secondary">
			<c:forEach items="${user_list}" var="user">
				<tr>
					<td><input type="checkbox" name="pid" value="${user.pid}" class="cb"/></td>
					<td>${user.pname}</td>
					<td><a class="uclick" href="userView?pid=${user.pid}">${user.pid}</a></td>
					<td>${user.pmail1}@${user.pmail2}</td>
					<td>${user.ppn1}-${user.ppn2}-${user.ppn3}</td>
					<td>${user.pdate}</td>
					<td>${user.auth}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="right">
		<button id="adminChange" type="submit" class="btn btn-primary" style="background:#527062;"><i class="fas fa-exchange-alt"></i>&nbsp;관리자</button>
		<button id="userChange" type="submit" class="btn btn-primary" style="background:#527062;"><i class="fas fa-exchange-alt"></i>&nbsp;일반회원</button>
	</div>
</form>

<script>
$(document).ready(function() {
	$("#adminChange").click(function() {
		if(confirm("관리자로 변경하시겠습니까?") == true) {
			$("#authForm").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "authorityChange",
					type : $("#authForm").attr("method"),
					data : $("#authForm").serialize(),
					success : function(data){
						alert("권한이 변경되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("회원을 선택해주세요.");
					}
				});
			});
		}
	});
	
	$("#userChange").click(function() {
		if(confirm("일반회원으로 변경하시겠습니까?") == true) {
			$("#authForm").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "authorityChange2",
					type : $("#authForm").attr("method"),
					data : $("#authForm").serialize(),
					success : function(data){
						alert("권한이 변경되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("회원을 선택해주세요.");
					}
				});
			});
		}
	});
	
	$(".cb").change(function() {
	    $(".cb").not(this).prop("checked", false);
	});
});
</script>
</body>
</html>