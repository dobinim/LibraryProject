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
<meta id="_csrf" name="csrf" content="${_csrf.token}"/> 
<title>희망도서 신청</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="noticeboard_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fas fa-box"></i>&nbsp;<b>희망도서 신청</b></h3>
		<hr/>
		<jsp:include page="application_notice.jsp" flush="false"/>
		
		
		<div align="center" class="mt-5">
			<a href="search" id="applicationSearch" class="btn" style="background-color:#527062; color:white;">희망도서 신청 전 소장 자료 검색</a>
			<sec:authorize access="isAnonymous()">
				<p class="mt-2">* 희망도서 신청은 로그인 후 이용 가능합니다.</p>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<button id="applicationBtn" class="btn" style="background-color:#527062; color:white;">희망도서 신청하기</button>
			</sec:authorize>
		</div>
		<div class="d-none" id="applicationForm">
			<form action="bookApplication" method="post" id="bookApplication">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="border border-secondary mt-5 p-3" style="border-radius:10px 10px;">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="appUser" value="${user_id}"/>
					<div class="row">
						<div class="form-group col-6" style="display:inline;">
							<label for="bookTitle">책 제목: </label>
							<input class="form-control" id="bookTitle" name="appBookTitle" type="text" placeholder="책 제목"/>
						</div>
						<div class="form-group col-6" style="display:inline;">
							<label for="writer">저자: </label>
							<input class="form-control" id="writer" name="appBookWriter" type="text" placeholder="저자"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-6" style="display:inline;">
							<label for="bookpub">출판사: </label>
							<input class="form-control" id="bookpub" name="appBookPub" type="text" placeholder="출판사"/>
						</div>
						<div class="form-group col-6" style="display:inline;">
							<label for="genre">장르: </label>
							<select class="form-control" id="genre" name="appBookGenre">
								<option value="경제/경영">경제/경영</option>
								<option value="문학">문학</option>
								<option value="정치/사회">정치/사회</option>
								<option value="역사/문화">역사/문화</option>
								<option value="예술/대중문화">예술/대중문화</option>
								<option value="과학">과학</option>
								<option value="자기계발">자기계발</option>
								<option value="컴퓨터/IT">컴퓨터/IT</option>
								<option value="요리">요리</option>
								<option value="청소년">청소년</option>
								<option value="유아/어린이">유아/어린이</option>
								<option value="만화">만화</option>
							</select>
						</div>
					</div>
					<input  class="form-control" id="state" name="appState" type="hidden" value="신청확인중"/>
				</div>
				<div align="right" class="mt-1">
					<button id="appBtn" type="submit" class="btn" style="background-color:#527062; color:white;"><i class="fa fa-plus"></i>&nbsp;신청</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#applicationSearch").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#applicationSearch").attr("href"),
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
	$("#applicationBtn").click(function() {
		$("#applicationForm").removeClass("d-none");
	});
	$("#appBtn").click(function(event){
		if(confirm("희망도서 신청을 하시겠습니까?") == true) {
			$("#bookApplication").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : $("#bookApplication").attr("action"),
					type : $("#bookApplication").attr("method"),
					data : $("#bookApplication").serialize(),
					success : function(data) {
						alert("희망도서 신청이 완료되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function() {
						alert("서버 접속 실패. 다시 시도해주세요.");
					}
				});
			});
		}
	});
});
</script>
</body>
</html>