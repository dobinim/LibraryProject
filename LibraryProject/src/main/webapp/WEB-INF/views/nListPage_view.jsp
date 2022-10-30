<!-- JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!-- Spring Security Tag Library -->
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>nListPage_view</title>

<!-- jQuery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--popper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}

h3 {
	color : #3f3f48;
}

hr {
	border : 0;
	height : 2px;
	color : #d7d8df;
}

#maindiv {
	margin-top : 20px;
	margin-right : auto;
	margin-left : auto;
}

#noticehead {
	background-color : #d7d8df;
	color:black;
	text-align : center;
}

#ntbody {
	color : #3f3f48;
	text-align : center;
}

#th1, #th5 {
	width : 10%;
}

#th3, #th4 {
	width : 15%;
} 

.contentView {
	color : #527062;
}

#write {
	background-color : #527062;
	color : white;
	float : right;
}

</style>
</head>
<body>
<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<h3 id = "notice"><i class="fas fa-bullhorn" style="color:#527062;"></i>&nbsp;공지 사항</h3>
<hr/>
<table class = "table table-hover" id = "noticetable" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead id = "noticehead">
			<tr>
				<th id = "th1">No.</th>
				<th id = "th2">제목</th>
				<th id = "th3">작성자</th>
				<th id = "th4">등록일</th>
				<th id = "th5">첨부파일</th>
			</tr>
		</thead>
		<tbody id = "ntbody">
			<c:forEach items = "${noticeList}" var = "dto">
				<tr>
					<td>${dto.nId}</td>
					<td>
						<c:forEach begin = "1" end = "${dto.nIndent}">-</c:forEach>
						<a href = "nContentView?nId=${dto.nId}" class = "contentView">${dto.nTitle}</a>
					</td>
					<td>${dto.nWriter}</td>
					<td>${dto.nDate}</td>
					<td>									
						<c:if test="${!empty dto.nFile}">
							<i class="fas fa-paperclip"></i>
						</c:if>
					</td>
				</tr>
			</c:forEach>
	</tbody>
</table>

<script>
$(document).ready(function(){
	$(".contentView").click(function(event){
		event.preventDefault();
		let peo = $(event.target);
		$.ajax({
			url : peo.attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시물을 불러올 수 없습니다.");
			}
		});
	});
});
</script>
</body>
</html>