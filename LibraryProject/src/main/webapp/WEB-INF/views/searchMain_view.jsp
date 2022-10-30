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
html, body {
	height : 100%;
	margin : 0;
	padding : 0;
}

h3 {
	color : #3f3f48;
}

hr {
	border : 0;
	height : 2px;
	color : #d7d8df;
}

#mythead {
	background-color : #d7d8df;
	color : #3f3f48;
	text-align : center;
}

#booklist_1 {
	color : #3f3f48;
	text-align : center;
}
</style>
</head>
<body>

<div class = "row mt-5">
	<div class = "col-2 border">
		<jsp:include page = "bookList_menu.jsp" flush = "false"/>
	</div>
	<div class = "col-10">
		<!-- 검색게시판 -->
		<div id = "maindiv">
			<h3 id = "newbookh3" class = "mb-2"><i class = "fas fa-book" style = "color:#527062;"></i>&nbsp;소장자료 검색</h3>
			<hr/>
			<div id = "searchtablemain">
				<table class = "table table-hover" id = "booklist" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead id = "mythead">
						<tr>
							<th style="width:15%">분류</th>
							<th style="width:15%">표지</th>
							<th style="width:30%">제목</th>
							<th style="width:15%">저자</th>
							<th style="width:15%">출판사</th>
							<th style="width:10%">출판년도</th>
						</tr>
					</thead>
					<tbody id = "booklist_1">
						<c:forEach items = "${searchMain}" var = "dto">
							<tr>
								<td>${dto.genre}</td>
								<td>
									<img src="upimage/${dto.img}" style="width:50%;" class="border border-dark"/>
								</td>
								<td>
									<a href="content_view?bookId=${dto.bookId}" class="bclick" style="color:black;">${dto.bookTitle}</a>
								</td>
								<td>${dto.writer}</td>
								<td>${dto.publisher}</td>
								<td>${dto.year}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 페이지 표시 : API 사용 -->
		<nav aria-label="Page navigation"> 
			<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0"></ul>
		</nav>
	</div>
</div>
<script>
$(document).ready(function(){
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 30, //총 페이지 수
		visiblePages: 10, //가시 페이지 수
		onPageClick : function(event, page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click", function(event){ //클래스page-link는 BS4의 pagination의 링크 a
				event.preventDefault();
				let seo = $(event.target);
				let pageNo = seo.text();
				let surl;
				let pageA;
				let pageNo1;
				let pageNo2;
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					surl = "searchPage?pageNo=" + pageNo;
				} else if (pageNo == "Next") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수 변환해줌
					pageNo2 = pageNo1 + 1;
					surl = "searchPage?pageNo=" + pageNo2;
				} else if (pageNo == "Previous") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1 빼야 하므로 정수 변환해줌
					pageNo2 = pageNo1 - 1;
					surl = "searchPage?pageNo=" + pageNo2;
				} else if (pageNo == "First") {
					surl = "searchPage?pageNo=" + 1;
				} else if (pageNo == "Last"){
					surl = "searchPage?pageNo=" + 30;
				} else {
					return;
				}
				$.ajax({
					url : surl,
					type : "get",
					data : "",
					success : function(data) {
						$("#searchtablemain").html(data);
						let parent = seo.parent(); //page-link의 부모인 page-item에 추가
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
	
	// 상세정보 불러오기
	$(document).on('click', '.bclick', function(event){
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
});
</script>
</body>
</html>