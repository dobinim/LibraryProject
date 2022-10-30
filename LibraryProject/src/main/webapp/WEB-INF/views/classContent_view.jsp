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

<title>강좌 상세 페이지</title>

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
html, body {
	width : 100%;
}

#classTable {
	border-top : 1px solid #3f3f48;
	border-bottom : 1px solid #3f3f48;
	font-size : 13px;
}

#classTable tr {
	border-bottom : 1px solid #d7d8df;
	border-collapse : collapse;
}

#classTable th {
	background-color : #ececf0;
	width : 13%;
	font-weight : lighter;
}

#cTitle td {
	font-size : 20px;
	
}

#listbtn {
	background-color : #3f3f48;
	color : white;
}

#filelink {
	text-align : left;
	margin-left : 10px;
	width : 500px;
}

#modifybtn {
	background-color : #527062;
	color : white;
}


</style>
</head>
<body>

<div class="container mb-3" id = "maindiv">
	<div class="row mt-3">
		<div class="col-2 border">
			<jsp:include page="classboard_menu.jsp" flush="false"/>
		</div>
			<div class="col-10 mx-auto" id="submain">
				<h3 class = "text-center mt-3">강좌 목록</h3>
				<table class = "table text-center" id = "classTable">
					<tbody>
						<tr id = "cTitle">
							<th class = "align-middle">강좌명</th>
							<td style = "font-weight:bold;" colspan = "4">${cContentView.cTitle}</td>
						</tr>
						<tr id = "cGroup">
							<th>접수 기간</th>
							<td style = "width:40%">${cContentView.cStartReg} ~ ${cContentView.cEndReg}</td>
							<th>총 정원</th>
							<td style = "width:30%">${cContentView.cNumber} 명</td>
						</tr>
						<tr id = "cPeriod">
							<th>강좌 기간</th>
							<td style = "width:40%">${cContentView.cStart} ~ ${cContentView.cEnd}</td>
							<th>강좌 시간</th>
							<td style = "width:30%">${cContentView.cHour}</td>
						</tr>
						<tr id = "cPlace">
							<th>강좌 장소</th>
							<td>${cContentView.cPlace}</td>
							<th>강사명</th>
							<td>${cContentView.cName}</td>
						</tr>
						<tr id = "cContent">
							<th>강의 설명</th>
							<td colspan = "4">
								<img id="cImg" src="upclass/${cContentView.cPhoto}" style="max-width:700px;max-height:700px;" class="mb-5"/>
								<p style="white-space: pre-line;">${cContentView.cContent}</p>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>첨부 파일</th>
							<td id = "filelink" class = "col-4">
								<a href = "upclass/${cContentView.cPhoto}" download>${cContentView.cPhoto}</a>
							</td>
						</tr>
					</tfoot>
				</table>
				<a class = "btn f-left" href = "cList" id = "listbtn">목록</a>
				<sec:authorize access = "hasRole('ROLE_ADMIN')">
					<a class = "btn" href = "modifyClass?cId=${cContentView.cId}" id = "modifybtn">수정</a>
					<a class = "btn btn-danger" href = "deleteClass?cId=${cContentView.cId}" id = "deletebtn">삭제</a>
				</sec:authorize>
			</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#listbtn").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#listbtn").attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("목록을 불러올 수 없습니다.");
			}
		});
	});
	$("#modifybtn").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#modifybtn").attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시물을 수정할 수 없습니다.");
			}
		});
	});
	$("#deletebtn").click(function(event){
		event.preventDefault();
		if(confirm("정말로 삭제하시겠습니까?") == true) {
			$.ajax({
				url : $("#deletebtn").attr("href"),
				type : "get",
				data : "",
				success : function(data){
					alert("정상적으로 삭제되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("게시물을 삭제할 수 없습니다.");
				}
			});	
		}
	});
});
</script>
</body>
</html>