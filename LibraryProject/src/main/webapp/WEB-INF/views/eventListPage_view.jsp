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
hr {
	border : 0;
	height : 2px;
	background : gray;
}

#maindiv {
	margin-top : 20px;
	margin-right : auto;
	margin-left : auto;
}

#eventhead {
	background-color : #3f3f48;
	color:white;
	text-align : center;
}

#etbody {
	color : #3f3f48;
	text-align : center;
}

#th1 {
	width : 10%;
}

#th2, #th4 {
	width : 15%;
} 

table {
	border-bottom : 1px solid #3f3f48;
}

.bclick {
	color : #527062;
}

#writebtn {
	background-color : #527062;
	color : white;
	margin-left : 950px;
}

#pagination {
	text-align:center;
}

#searchbtn {
	background-color : #527062;
	color : white;
	border : 0;
	height : 40px;
	width : 80px;
}

#searchbar {
	width : 500px;
	height : 40px;
	border : 0px;
	border-bottom : 1px solid #3f3f48;
	
}

#searchbar:focus {
	outline : none;
}

#searchopt {
	height : 40px;
	border : 0px;
	border-bottom : 1px solid #3f3f48;
}

#searchopt:focus {
	outline : none;
}

#searchform { 
	text-align : center;
	margin-top : 30px;
	margin-bottom : 30px;
}


</style>

</head>
<body>
<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<table class = "table table-hover" id = "eventtable">
	<thead id = "eventhead">
		<tr>
			<th id = "th1">No.</th>
			<th id = "th2">작성분류</th>
			<th id = "th3">제목</th>
			<th id = "th4">작성일</th>
		</tr>
	</thead>
	<tbody id = "etbody">
		<c:forEach items = "${eventList}" var = "dto">
			<tr>
				<td>${dto.eId}</td>
				<td>${dto.eGroup}</td>							
				<td>	
					<a href = "eContentView?eId=${dto.eId}" class = "bclick">${dto.eTitle}</a>
				</td>
				<td>${dto.eWriteDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
$(document).ready(function(){
	$(".bclick").click(function(event){
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