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

<sec:authorize access = "isAuthenticated()">
	<sec:authentication property = "principal.username" var = "user_id" />
</sec:authorize>

<div class="d-none">
	<form action="book_reservation" id="book_reservation" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="reservationTitle" value="${content_view.bookTitle}"/>
		<input type="hidden" name="reservationUser" value="${user_id}"/>
		<input type="hidden" name="bookId" value="${content_view.bookId}"/>
		<input type="hidden" name="writer" value="${content_view.writer}"/>
		<input name="borrowId" value="${bookReservationPage.borrowId}" type="text"/>
		<input name="callNum" value="${bookReservationPage.callNum}" type="text"/>
		<input name="bookPossible" value="${bookReservationPage.bookPossible}" type="text"/>
		
		<button id="fBtn" type="submit" class="btn btn-primary">등록</button>
	</form>
</div>

<script>
$(document).ready(function() {
	$("#fBtn").click(function(event){	
		event.preventDefault();
		$.ajax({
			url : $("#book_reservation").attr("action"),
			type : "POST",
			data : $("#book_reservation").serialize(),
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function() {
				alert("예약이 실패하였습니다. 다시 시도해주세요.");
			}
		});
	});
	$("#fBtn").trigger("click");
});

</script>
</body>
</html>