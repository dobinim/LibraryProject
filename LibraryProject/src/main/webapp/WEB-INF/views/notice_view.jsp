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

<title>공지사항</title>

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

<style>

html, body {
	height : 100%,
	margin : 0,
	padding : 0;
}

h3 {
	color : #3f3f48;
}

hr {
	border : 0;
	height : 2px;
	background : gray;
}

#header {
	width : 100%;
	height : 100px;
	background-color : #ececf0;
	padding : 20px;
	border-top : 1px solid #d7d8df;
	border-bottom : 1px solid #d7d8df;

}

#nTitle {
	height : 30px;
	font-size : 20px;
	font-weight : bold;
	margin-top : 0px;
	margin-bottom : 0px;
}

#nWriter {
	height : 30px;
	font-size : 15px;
	width : 70%;
	display : inline-block;
	margin-top : 10px;
	margin-bottom : 0px;
	margin-left : 10px;
}

#nDate {
	height : 30px;
	font-size : 15px;
	width : 20%;
	display : inline-block;
	text-align : right;
	margin-top : 10px;
	margin-bottom : 0px;
}

#nTitle2 {
	text-align : center;
	font-weight : bold;
	font-size : 20px;
	color : #3f3f48;
}

#nContent {
	font-size : 15px;
}

#noticebtn {
	background-color : #3f3f48;
	color : white;
}

#modifybtn {
	background-color : #527062;
	color : white;
}

.row div img {
	max-width : 800px;
}

.ck .ck-widget__resizer__handle {
	display : none;
}
</style>

</head>
<body>

	<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div id="Contentmain" class="container mt-5 mb-3">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="noticeboard_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<!-- 본문 -->
			<h3 id = "nhead" style="color:#527062;"><i class="fas fa-bullhorn"></i>&nbsp;<b>공지 사항</b></h3>
				<div id = "header" class = "container">
					<p id = "nTitle">${nContentView.nTitle}</p>
					<p id = "nWriter">작성자 : ${nContentView.nWriter}</p>
					<p id = "nDate">등록일 : ${nContentView.nDate}</p>
				</div>
				<div class = "container mt-3">
					<p id = "nTitle2">${nContentView.nTitle}</p>
					<p id = "nContent" style="white-space: pre-line;">${nContentView.nContent}</p>	
				</div>
				<hr/>
				<a href = "nList" class = "btn" id = "noticebtn">목록</a>&nbsp;&nbsp;
				<sec:authorize access = "hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGE')">
					<a href = "noticeModify?nId=${nContentView.nId}" class = "btn" id = "modifybtn">글 수정</a>&nbsp;&nbsp;
					<a href = "deleteN?nId=${nContentView.nId}" id = "contentDel" class = "btn btn-danger">삭제</a>
				</sec:authorize>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	let username = '<c:out value = "${user_id}"/>'; 
	let nwriter = '<c:out value = "${nContentView.nWriter}"/>';
	
	$("#modifybtn").click(function(event){
		event.preventDefault();
		if (username != nwriter) {
			alert("수정 권한이 없습니다");
			return false;
		} else {
			$.ajax({
				url : $("#modifybtn").attr("href"),
				type : "get",
				data : "",
				success : function(data){
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("글을 수정할 수 없습니다.");
				}
			});
		}	
	});
	$("#noticebtn").on("click", function(event){
		event.preventDefault();
		$.ajax({
			url : $("#noticebtn").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function() {
				alert("게시판으로 돌아갈 수 없습니다.");
			}
		});
	});
	
	$("#contentDel").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#contentDel").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("글을 삭제할 수 없습니다.");
			}
		});
	});
});
</script>
</body>
</html>