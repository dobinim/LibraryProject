<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="false" %>
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
<title>화곡도서관</title>
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
<style>
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}
#back {
	justify-content : center;
	align-items : center;
	display : flex;
}
</style>
<body>

<jsp:include page = "/resources/html/top.jsp" />

<!-- 로그인 본문 -->
<div id="mainRegion" class="container mb-3">
	<div class="container mt-5 p-3">
		<span id="linfo" class="text-center" style="display:none;"></span>
		<h3 class="text-center"><span style="color:#527062;" class="font-weight-bold">화곡 도서관</span> 방문을 환영합니다</h3>
		<div style="background:#ececf0;height:300px;" class="mt-5 p-3" id="back">
			<div class="row">
				<div class="col-6" style="display:flex; align-items:center;">
					<img id="logo" alt="화곡도서관" src="media/도서관로고.png" style="width:100%;">
				</div>
				<div class="col-6">
					<form action="login" method="post" id="frm1" name="frm1">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group">
							<input class="form-control" type="text" name="pid" placeholder="아이디">
							<input class="form-control" type="password" name="ppw" placeholder="비밀번호">
						</div>
						<div class="form-group form-check float-right">
							<input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me" checked/>
							<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">자동로그인</label>
						</div>
						<button type="submit" class="btn btn-primary" style="width:100%;">로그인</button>
						<br/>
					</form>
				</div>
			</div>
		</div>
		<br/><br/>
		<div class="text-center">
			회원이 아닌 경우 신규 가입하시기 바랍니다.&nbsp;&nbsp;
			<a class="btn btn-primary" href="#" id="join_view1">회원가입</a>
		</div>
	</div>
</div>

<jsp:include page = "/resources/html/footer.jsp" />

<script>
$(document).ready(function(){
	<c:choose>
	<c:when test="${not empty log}">
		$("#linfo").text("Welcome!");
	</c:when>
	<c:when test="${not empty logout}">
		$("#linfo").text("로그아웃 성공");
	</c:when>
	<c:when test="${not empty error}">
		$("#linfo").text("로그인 실패");
	</c:when>
	<c:otherwise>
		$("#linfo").text("Welcome!");
	</c:otherwise>
	</c:choose>
	
	$("#join_view").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#join_view").attr("href"),
			type : "GET",
			data : "",
			success : function(data){ //회원가입을 누르면 해당 위치에 html 형식으로 페이지 데이터를 뿌린다
				$("#mainRegion").html(data);
			},
			error : function(){ //에러일 경우 숨겨진 modal 버튼을 클릭
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	$("#join_view1").click(function(){
		event.preventDefault();
		$("#join_view").trigger("click");
	});
});
</script>
</body>
</html>