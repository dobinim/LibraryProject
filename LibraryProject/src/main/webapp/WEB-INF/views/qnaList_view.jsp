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
<title>문의사항</title>
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
<script src="js/jquery.twbsPagination.js"></script>
<style>
#titleLink {
	color : black;
	text-decoration : none;
}
h3 {
	color : #3f3f48;
}

hr {
	border : 0;
	height : 2px;
	color : #d7d8df;
}
</style>
</head>
<body>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="noticeboard_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fas fa-question"></i>&nbsp;<b>문의사항</b></h3>
		<hr/>
		<br/>
		<jsp:include page="bestQnA.jsp" flush="false"/>
		
		<br/><br/>
		
		<h5><b><i class="far fa-question-circle" style="color:#527062"></i>&nbsp;문의 게시판</b></h5>
		<div align="right" class="mb-1">
			<form action="qnaSearch" method="post" id="qnaSearch">
				<select name="type">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="keyword" value="" placeholder="키워드 검색"/>
				<input type="submit" id="qnaSearchBtn" value="검색">
			</form>
		</div>	
		<div id="qnaMain">
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
					<c:forEach items="${qna_List}" var="qna">
						<tr>
							<td class="text-center">No.&nbsp;${qna.qnaNo}</td>
							<td class="text-center">&nbsp;&nbsp;&nbsp;<a href="qna_view?qnaNo=${qna.qnaNo}" id="qna_view" class="qnaclick" style="color:black;">${qna.qnaTitle}</a></td>
							<td class="text-center">${qna.qnaWriter}</td>
							<td class="text-center">${qna.qnaDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<sec:authorize access="isAuthenticated()">
			<div align="right">
				<a href="writeQnA" id="writeQnA" class="btn" style="background-color:#527062; color:white;"><i class="fas fa-pen"></i>&nbsp;질문 작성</a>
			</div>
		</sec:authorize>
		<!-- 페이지 표시 : API 사용 -->
		<nav aria-label="Page navigation"> 
			<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0"></ul>
		</nav>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '.qnaclick', function(event){
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
	$("#writeQnA").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#writeQnA").attr("href"),
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
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 35,
		visiblePages: 10,
		onPageClick : function(event,page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){ 
				event.preventDefault();
				let peo = $(event.target);
				let pageNo = peo.text();
				let purl;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					purl = "plist?pageNo=" + pageNo;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a");
					pageNo = pageA.text();
					pageNo1 = parseInt(pageNo);
					pageNo2 = pageNo1 + 1;
					purl = "plist?pageNo=" + pageNo2; 
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");  
					pageNo = pageA.text(); 
					pageNo1 = parseInt(pageNo);
					pageNo2 = pageNo1 - 1;
					purl = "plist?pageNo=" + pageNo2; 
				}
				else if(pageNo == "First") {
					purl = "plist?pageNo=" + 1; 
				}
				else if(pageNo == "Last") {
					purl = "plist?pageNo=" + 35; 
				}
				else {
					return;
				}
				$.ajax({
					url : purl,
					type : "GET",
					data : "",
					success : function(data) {
						$("#qnaMain").html(data);
						let parent = $(peo).parent(); 
						parent.addClass("active");
					},
					error : function() {
						alert("서버 접속 에러");
					}					
				}); //ajax
			}); //on-click
		} //onPageClick 
	})//window.pagObj
	.on('page', function(event, page){  
		console.info(page + ' (from event listening)');
	});
	
	$("#qnaSearch").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "qnaSearch",
			type : "GET",
			data : $("#qnaSearch").serialize(),
			success : function(result){
				$("#qnaTable > tbody").empty();
				if(result.length >= 1) {
					result.forEach(function(item){
						let timestamp = item.qnaDate;
						let date = new Date(timestamp);
						let year = date.getFullYear().toString();
						let month = ("0" + (date.getMonth() + 1)).slice(-2); 
						let day = ("0" + date.getDate()).slice(-2);
						let hour = ("0" + date.getHours()).slice(-2);
						let minute = ("0" + date.getMinutes()).slice(-2); 
						let second = ("0" + date.getSeconds()).slice(-2);
						let TDate = year + "-" + month + "-" + day + "&nbsp;" + hour + ":" + minute + ":" + second + ".0";
						str = "<tr>";
						str += "<td class='text-center'>No. " + item.qnaNo + "</td>";
						str += "<td class='text-center'>" + "&nbsp;&nbsp;&nbsp;<a href='qna_view?qnaNo=" + item.qnaNo + "' id='qna_view' class='qnaclick' style='color:black;'>" + item.qnaTitle + "</td>";
						str += "<td class='text-center'>" + item.qnaWriter + "</td>";
						str += "<td class='text-center'>" + TDate + "</td>";
						str += "</tr>";
						$("#qnaTable").append(str);
					});
				}
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