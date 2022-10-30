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
<form action="bookRendre" method="post" id="bookRendre">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table class="table table-bordered text-center table-hover" id="adminBorrowTable" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead style="background:#d7d8df;">
			<tr>
				<th style="width:15%;">아이디</th>
				<th style="width:20%;">제목</th>
				<th style="width:15%;">저자</th>
				<th style="width:20%;">대출일</th>
				<th style="width:20%;">반납일</th>
				<th style="width:10%;">반납</th>
			</tr>
		</thead>
		<tbody class="text-secondary">
			<c:forEach items="${adminBorrowList}" var="dto">
				<tr>
					<td>${dto.pid}</td>
					<td>${dto.bookTitle}</td>
					<td>${dto.writer}</td>
					<td>${dto.borrowDate}</td>
					<td>${dto.dueDate}</td>
					<td>
						<c:set var="r" value="${dto.rendre}"></c:set>
							<c:choose>
							<c:when test ="${r == '미반납'}">
								<button class="btn btn-danger rendre" type="button" id="rendreBtn">반납<span class="d-none">${dto.borrowId}</span></button>
							</c:when>
							<c:otherwise>
								반납완료
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<script>
$(document).ready(function() {
	$(".rendre").click(function(event){
		event.preventDefault();
		if(confirm("책을 반납하시겠습니까?") == true) {
			let target = $(event.target);
			let no = target.children("span").text();
			let rendre = {
				borrowId : no,
				${_csrf.parameterName} : "${_csrf.token}"
			}
			$.ajax({
				url : "bookRendre",
				type : "post",
				data : rendre,
				success : function(data){
					alert("책이 대출가능 상태로 변경되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("도서를 선택해주세요.");
				}
			});
		}
	});
	
});
</script>
</body>
</html>