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

<title>공지사항 목록</title> 

<!-- 페이징의 문제로 jquery 사용 불가 -->

<!-- jquery 
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
<!-- webapp/resources/js 아래 넣은 API를 사용하기 위해 입력 -->
<script src="js/jquery.twbsPagination.js"></script>

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

#noticehead {
	background-color : #d7d8df;
	color:black;
	text-align : center;
}

#ntbody {
	color : #3f3f48;
	text-align : center;
}

#th1 {
	width : 10%;
}

#th3, #th4 {
	width : 15%;
} 

.bclick {
	color : #527062;
}

#write {
	background-color : #527062;
	color : white;
}

#pagination {
	text-align:center;
}



</style>
</head>
<body>
<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div class="container mt-5" id = "maindiv">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="noticeboard_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<div id="submain">
			<!-- 공지사항 -->
				<h3 id = "notice" style="color:#527062;"><i class="fas fa-bullhorn"></i>&nbsp;<b>공지 사항</b></h3>
				<hr/>
				<table class = "table table-hover" id = "noticetable" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead id = "noticehead">
						<tr>
							<th id = "th1">No.</th>
							<th id = "th2">제목</th>
							<th id = "th3">작성자</th>
							<th id = "th4">등록일</th>
						</tr>
					</thead>
					<tbody id = "ntbody">
						<c:forEach items = "${noticeList}" var = "dto">
							<tr>
								<td>${dto.nId}</td>
								<td>
									<c:forEach begin = "1" end = "${dto.nIndent}">-</c:forEach>
									<a href = "nContentView?nId=${dto.nId}" class = "bclick">${dto.nTitle}</a>
								</td>
								<td>${dto.nWriter}</td>
								<td>${dto.nDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div align="right">
				<sec:authorize access = "hasRole('ROLE_ADMIN')">
					<a class = "btn" href = "noticeRegister" id = "write">공지사항 등록</a>	
				</sec:authorize>
			</div>
			<br/>
			<!-- 페이지 표시 -->
			<nav aria-label = "Page navigation" id = "pagnav">
				<ul class = "pagination justify-content-center mx-auto" id = "pagination"></ul>
			</nav>
		</div>
	</div>
</div>



<script>
$(function(){
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 30, //총 페이지 수
		visiblePages: 7, //가시 페이지 수
		onPageClick : function(event, page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click", function(event){ //클래스page-link는 BS4의 pagination의 링크 a
				event.preventDefault();
				let peo = $(event.target);
				let pageNo = peo.text();
				let plink;
				let pageA;
				let pageNo1;
				let pageNo2;
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					plink = "nPlist?pageNo=" + pageNo;
				} else if (pageNo == "Next") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수 변환해줌
					pageNo2 = pageNo1 + 1;
					plink = "nPlist?pageNo=" + pageNo2;
				} else if (pageNo == "Previous") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1 빼야 하므로 정수 변환해줌
					pageNo2 = pageNo1 - 1;
					plink = "nPlist?pageNo=" + pageNo2;
				} else if (pageNo == "First") {
					plink = "nPlist?pageNo=" + 1;
				} else if (pageNo == "Last"){
					plink = "nPlist?pageNo=" + 30;
				} else {
					return;
				}
				$.ajax({
					url : plink,
					type : "get",
					data : "",
					success : function(data) {
						$("#submain").html(data);
						let parent = peo.parent(); //page-link의 부모인 page-item에 추가
						parent.addClass("active");
					},
					error : function() {
						alert("서버 접속 에러");
					}					
				}); //ajax
			}); //on-click
		} //onPageClick 
	}).on('page', function(event, page) {
		console.info(page + ' (from event listening)');
	}); 
	
	$("#write").click(function(event){
		event.preventDefault();
		$.ajax({
			url : "noticeRegister",
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시글을 작성할 수 없습니다.");
			}
		});
	}); 
	$(".bclick").click(function(event){
		event.preventDefault();
		let neo = $(event.target);
		$.ajax({
			url : neo.attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시글을 불러올 수 없습니다.");
			}
		});
	}); 
});
</script>
</body>
</html>