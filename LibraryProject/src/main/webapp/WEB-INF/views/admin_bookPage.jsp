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

<form action="bookDel" method="post" id="bookDel" class="bookDel">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-bordered text-center table-hover" id="adminBookTable" style="border-top:2px solid black;border-bottom:2px solid black;">
			<thead style="background:#d7d8df;">
				<tr>
					<th style="width:10%;"></th>
					<th style="width:10%;">No.</th>
					<th style="width:15%;">표지</th>
					<th style="width:40%;">제목</th>
					<th style="width:25%;">저자</th>
				</tr>
			</thead>
			<tbody class="text-secondary">
				<c:forEach items="${bookList}" var="dto">
					<tr>
						<td><input type="checkbox" name="bookId" value="${dto.bookId}" class="cb"/></td>
						<td>${dto.bookId}</td>
						<td><img src="upimage/${dto.img}" style="width:50%;" class="border border-dark"/></td>
						<td><a class="bclick" href="bookModiView?bookId=${dto.bookId}" style="color:black;">${dto.bookTitle}</a></td>
						<td>${dto.writer}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<button type="submit" class="btn btn-danger" style="float:right;"><i class="fas fa-trash"></i>&nbsp;삭제</button>
</form>	

<script>
$(document).ready(function() {
	$(document).on('click', '.bclick', function(event){
		event.preventDefault();
		let evo = $(event.target); 
		let url = evo.attr("href");
		$.ajax({
			url : url,
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
	$("#bookDel").submit(function(event){
		event.preventDefault();
		if(confirm("해당 도서를 삭제하시겠습니까?") == true) {
			$.ajax({
				url : $("#bookDel").attr("action"),
				type : $("#bookDel").attr("method"),
				data : $("#bookDel").serialize(),
				success : function(data){
					alert("해당 도서가 삭제되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("도서를 선택해주세요.");
				}
			});
		}
		else {
			location.href("admin_book");
		}
	});
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
	});
});
</script>
</body>
</html>