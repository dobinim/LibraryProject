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

<table class="table table-hover" id="qnaTable" style="border-top:2px solid black;border-bottom:2px solid black;">
	<thead class="text-center" style="background:#ececf0; color:black;">
		<tr>
			<th style="width:10%">No.</th>
			<th style="width:50%">제목</th>
			<th style="width:10%">작성자</th>
			<th style="width:30%">등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${qnaList}" var="qna">
			<tr>
				<td class="text-center">No.&nbsp;${qna.qnaNo}</td>
				<td class="text-center">&nbsp;&nbsp;&nbsp;<a href="qna_view?qnaNo=${qna.qnaNo}" id="qna_view" class="qnaclick" style="color:black;">${qna.qnaTitle}</a></td>
				<td class="text-center">${qna.qnaWriter}</td>
				<td class="text-center">${qna.qnaDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
$(document).ready(function() {
	$(".qnaclick").click(function(event){
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
});
</script>
</body>
</html>