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
<meta id="_csrf" name="_csrf" content="${_csrf.token }"/>
<title>문의</title>
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

#nTitle, #answerTitle {
	height : 30px;
	font-size : 20px;
	font-weight : bold;
	margin-top : 0px;
	margin-bottom : 0px;
}

#nWriter {
	height : 30px;
	font-size : 15px;
	width : 60%;
	display : inline-block;
	margin-top : 10px;
	margin-bottom : 0px;
	
}

#nDate {
	height : 30px;
	font-size : 15px;
	width : 30%;
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

#qnaList {
	background-color : #3f3f48;
	color : white;
}

#qnaModifyPage {
	background-color : #527062;
	color : white;
}

</style>
</head>
<body>

<sec:authorize access = "isAuthenticated()">
	<sec:authentication property = "principal.username" var = "user_id" />
</sec:authorize>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="noticeboard_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<!-- 본문 -->
		<div class = "container" id = "maindiv">
			<h3 id = "nhead" style="color:#527062"><i class="far fa-question-circle"></i>&nbsp;<b>문의사항</b></h3>
			<div id = "header" class = "container mt-1">
				<input type="hidden" value="${qna_view.qnaNo}" id="qnaNo"/>
				<p id = "nTitle">${qna_view.qnaTitle}</p>
				<p id = "nWriter">작성자 : ${qna_view.qnaWriter}</p>
				<p id = "nDate">등록일 : ${qna_view.qnaDate}</p>
			</div>
			<div class = "container mt-3">
				<p id = "nTitle2">${qna_view.qnaTitle}</p>
				<p id = "nContent" style = "height:500px;white-space:pre-line;">${qna_view.qnaContent}</p>	
			</div>
			
			<hr/>
			
			<div>
				<p id="answerTitle" class="text-center mb-2">답변</p>
				<p style="height:200px;white-space:pre-line;">${qna_answer.answerContent}</p>	
			</div>
			
			<hr/>
			
			<a href = "qnaList" class = "btn" id = "qnaList"><i class="fas fa-backspace"></i>&nbsp;목록</a>&nbsp;&nbsp;
			<div id="qnaUtil" style="display:inline-block">
				<a href = "qnaModifyPage" class = "qnaModi btn" id = "qnaModifyPage"><i class="fas fa-pen"></i>&nbsp;글 수정</a>&nbsp;&nbsp;
				<a href = "qnaDelete" id = "qnaDel" class = "qnaDel btn btn-danger"><i class="fas fa-trash"></i>&nbsp;삭제</a>&nbsp;&nbsp;
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div style="display:inline-block; float:right;">
					<a href = "qnaAnswer" id = "qnaAns" class = "qnaAns btn" style="background:#527062;color:white;"><i class="fas fa-envelope"></i>&nbsp;답변하기</a>
				</div>
			</sec:authorize>
		</div>
	</div>
</div>

<!-- 페이지 돌아가기 트리거 링크 -->
<a class="d-none" href="qnaList" id="qnaList"></a>

<script>
$(document).ready(function(){
	let username = '<c:out value="${user_id}"/>';
	let bname = '<c:out value="${qna_view.qnaWriter}"/>';
	
	if(bname != username) {
		document.getElementById("qnaUtil").style.visibility = "hidden";
	}
	else {
		document.getElementById("qnaUtil").style.visibility = "visible";
	}
	$("#qnaList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#qnaList").attr("href"),
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
	$(".qnaModi").click(function(event){
		event.preventDefault();
		if(confirm("질문을 수정하시겠습니까?") == true) {
			let no = $("#qnaNo").attr("value"); 
			$.ajax({
				url : "qnaModifyPage?qnaNo=" + no,
				type : "GET",
				data : "",
				success : function(data){
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			location.href("qna_view");
		}
	});
	$(".qnaDel").click(function(event){
		event.preventDefault();
		if(confirm("질문을 수정하시겠습니까?") == true) {
			let no = $("#qnaNo").attr("value"); 
			$.ajax({
				url : "qnaDelete?qnaNo=" + no,
				type : "GET",
				data : "",
				success : function(data){
					alert("질문이 삭제되었습니다. 페이지를 이동합니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});	
		}
		else {
			location.href("qna_view");
		}
	});
	$(".qnaAns").click(function(event){
		event.preventDefault();
		if(confirm("질문에 답변하시겠습니까?") == true) {
			let no = $("#qnaNo").attr("value"); 
			$.ajax({
				url : "qnaAnswer?qnaNo=" + no,
				type : "GET",
				data : "",
				success : function(data){
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			location.href("qna_view");
		}
	});
});
</script>
</body>
</html>