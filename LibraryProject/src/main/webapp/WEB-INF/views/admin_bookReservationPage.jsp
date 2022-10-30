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
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>

<form action="reservationCancel" method="post" id="reservationCancel">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table class="table table-bordered text-center table-hover" id="adminReservationTable" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead style="background:#d7d8df;">
			<tr>
				<th>&nbsp;&nbsp;</th>
				<th>예약자</th>
				<th>제목</th>
				<th>청구기호</th>
				<th>대출상태</th>
				<th>신청일</th>
			</tr>
		</thead>
		<tbody class="text-secondary">
			<c:forEach items="${adminReservationList}" var="list">
				<tr>
					<td><input type="checkbox" name="borrowId" value="${list.borrowId}" class="cb"/></td>
					<td>${list.reservationUser}</td>
					<td>${list.reservationTitle}</td>
					<td>${list.callNum}</td>
					<td>${list.bookPossible}</td>
					<td>${list.reservationDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="right">
		<button id="reservationBtn" type="submit" class="btn" style="background:#527062; color:white;"><i class="fas fa-times"></i>&nbsp;예약취소</button>
	</div>
</form>

<script>
$(document).ready(function() {
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
	});
	
	$("#reservationBtn").click(function() {
		if(confirm("예약을 취소하시겠습니까?") == true) {
			$("#reservationCancel").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "reservationCancel",
					type : "POST",
					data : $("#reservationCancel").serialize(),
					success : function(data){
						alert("예약이 취소되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("도서를 선택해주세요.");
					}
				});
			});
		}
	});
});
</script>
</body>
</html>