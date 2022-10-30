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

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div class="container mt-5 p-3">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="noticeboard_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<div>
				<h4 class="font-weight:bold;"><i class="far fa-question-circle" style="color:#527062"></i>&nbsp;질문작성</h4>
				<br/>
				<form action="qnaModify" method="post" id="qnaModify" name="qnaModify">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" value="${qna_view.qnaNo}" name="qnaNo"/>
					<div class="form-group">
						<label for="writer">작성자</label>
						<input class="form-control" type="text" id="writer" name="qnaWriter" value="${user_id}" readonly/>
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input class="form-control" type="text" id="title" name="qnaTitle" value="${qna_view.qnaTitle}" style="width:100%;"/>
					</div>
					<div class="form-group">
						<label for="content">질문 내용</label>
						<textarea class="from-control" id="content" name="qnaContent" rows="15" style="width:100%;">${qna_view.qnaContent}</textarea>
					</div>
					<div align="left" style="display:inline-block;">
						<a href = "qnaList" class = "btn btn-dark" id = "qnaList"><i class="fas fa-backspace"></i>&nbsp;목록</a>&nbsp;&nbsp;
					</div>
					<div align="right" style="display:inline-block;">
						<button type="submit" class="btn" style="background-color:#527062; color:white;"><i class="fas fa-pen"></i>&nbsp;질문수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#qnaModify").submit(function(event){
		event.preventDefault();
		if(confirm("질문을 수정하시겠습니까?") == true) {
			$.ajax({
				url : $("#qnaModify").attr("action"),
				type : $("#qnaModify").attr("method"),
				data : $("#qnaModify").serialize(),
				success : function(data) {
					alert("질문 수정이 완료되었습니다. 페이지를 이동합니다.")
					$("#mainRegion").html(data);
				},
				error : function() {
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			location.href("qnaModify");
		}
	});
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
});
</script>
</body>
</html>