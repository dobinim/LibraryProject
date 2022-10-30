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

<title>강좌 목록 페이지</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
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
<!-- webapp/resources/js 아래 넣은 API를 사용하기 위해 입력 -->
<!-- <script src="js/jquery.twbsPagination.js"></script> -->
<style>
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}

h3 {
	text-align:center;
	color : #3f3f48;
}

#classcard {
	border : 1px solid #ececf0;
	height : 500px;
}

#cardimg {
	height : 300px;
	margin : 0px;
}

#cTitle {
	font-weight : bold;
	font-size : 20px;
	text-align : center;
	height : 50px;
}

#cPeriod, #cPeriod_en {
	font-size : 12px;
	margin : 0px;
}

#cTitle, #cPeriod, #cPeriod_en {
	margin : 0px;
} 

#writebtn {
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
<div class = "row mb-3 mt-1 mx-auto">
	<c:forEach items = "${classList}" var = "dto">
		<div class = "col-md-4 mb-2" id = "classcard">
			<a href = "cContentView?cId=${dto.cId}" class = "pclick stretched-link" id = "cContentview">
				<img class = "card-img-top mt-1" src = "upclass/${dto.cPhoto}" id = "cardimg">
			</a>
			<div class = "card-body">
				<div id = "cTitle">
					${dto.cTitle}
				</div>
				<div id = "periods" class = "text-center mt-3">
					<p id = "cPeriod">● 강의 기간 : ${dto.cStart} ~ ${dto.cEnd}</p><br/>
					<p id = "cPeriod_en">● 접수 기간 : ${dto.cStartReg} ~ ${dto.cEndReg}</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<script>
$(document).ready(function(){
	$(".pclick").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
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