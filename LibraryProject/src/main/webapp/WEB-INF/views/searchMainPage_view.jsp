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

<title>메인검색페이징</title>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
<table class = "table table-hover" id = "booklist" style="border-top:2px solid black;border-bottom:2px solid black;">
	<thead id = "mythead">
		<tr>
			<th style="width:15%">분류</th>
			<th style="width:15%">표지</th>
			<th style="width:30%">제목</th>
			<th style="width:15%">저자</th>
			<th style="width:15%">출판사</th>
			<th style="width:10%">출판년도</th>
		</tr>
	</thead>
	<tbody id = "booklist_1">
		<c:forEach items = "${searchMain}" var = "dto">
			<tr>
				<td>${dto.genre}</td>
				<td>
					<img src="upimage/${dto.img}" style="width:50%;" class="border border-dark"/>
				</td>
				<td>
					<a href="content_view?bookId=${dto.bookId}" class="bclick" style="color:black;">${dto.bookTitle}</a>
				</td>
				<td>${dto.writer}</td>
				<td>${dto.publisher}</td>
				<td>${dto.year}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
$(document).on(".bclick", function(event){
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
</script>
</body>
</html>