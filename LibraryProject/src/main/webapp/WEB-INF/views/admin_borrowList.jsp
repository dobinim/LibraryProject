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
</head>
<body>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="admin_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fa fa-book"></i>&nbsp;<b>전체 대출 목록</b></h3>
		<hr/>
		<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
			<span style="color:#527062;"><b>전체대출목록</b></span><br/>
			<span style="font-size:14px;">
				도서관 회원이 대출한 내역입니다.
			</span>
		</p>
		<div align="right" class="mb-1 mt-5">
			<div class="mb-2">
				<a id="bookList" href="admin_book" class="btn" style="background:#527062;color:white;">도서목록</a>
				<a id="borrowList" href="admin_borrowList" class="btn" style="background:#527062;color:white;" class="ml-1">전체대출목록</a>
			</div>
			<form action="adminBorrowSearch" method="post" id="adminBorrowSearch">
				<select name="type">
					<option value="title">제목</option>
					<option value="user">아이디</option>
				</select>
				<input type="text" name="keyword" value="" placeholder="키워드 검색"/>
				<input type="submit" id="adminBookSearchBtn" value="검색">
			</form>
		</div>
		<div id="adminBorrowMain">
			<form action="bookRendre" method="post" id="bookRendre">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table table-bordered text-center table-hover" id="adminBorrowTable" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead style="background:#d7d8df;">
						<tr>
							<th style="width:15%;">아이디</th>
							<th style="width:20%;">제목</th>
							<th style="width:15%;">저자</th>
							<th style="width:20%;">대출일</th>
							<th style="width:20%;">반납일</th>
							<th style="width:10%;">반납</th>
						</tr>
					</thead>
					<tbody class="text-secondary">
						<c:forEach items="${adminBorrowList}" var="dto">
							<tr>
								<td>${dto.pid}</td>
								<td>${dto.bookTitle}</td>
								<td>${dto.writer}</td>
								<td>${dto.borrowDate}</td>
								<td>${dto.dueDate}</td>
								<td>
									<c:set var="r" value="${dto.rendre}"/>
									<c:set var="r2" value="미반납"/>
									<c:choose>
										<c:when test ="${r == r2}">
											<button class="btn btn-danger rendre" type="button" id="rendreBtn">반납<span class="d-none">${dto.borrowId}</span></button>
										</c:when>
										<c:otherwise>
											반납완료
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br/>
		
		<!-- 페이지 표시 : API 사용 -->
		<nav aria-label="Page navigation"> 
			<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0"></ul>
		</nav>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#bookList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#bookList").attr("href"),
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
	
	$("#borrowList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#borrowList").attr("href"),
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
	
	$(".rendre").click(function(event){
		event.preventDefault();
		if(confirm("도서를 반납하시겠습니까?") == true) {
			let target = $(event.target);
			let no = target.children("span").text();
			let rendre = {
				borrowId : no,
				${_csrf.parameterName} : "${_csrf.token}"
			}
			$.ajax({
				url : "bookRendre",
				type : "post",
				data : rendre,
				success : function(data){
					alert("도서가 대출가능 상태로 변경되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("도서를 선택해주세요.");
				}
			});
		}
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
				let aBorrowPList;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					aBorrowPList = "aBorrowPList?pageNo=" + pageNo;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a"); //li의 active클래스가 있고 a에 페이지 번호가 있음 
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야하므로 정수로 변환
					pageNo2 = pageNo1 + 1;
					aBorrowPList = "aBorrowPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");  
					pageNo = pageA.text(); 
					pageNo1 = parseInt(pageNo);
					pageNo2 = pageNo1 - 1;
					aBorrowPList = "aBorrowPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "First") {
					aBorrowPList = "aBorrowPList?pageNo=" + 1; 
				}
				else if(pageNo == "Last") {
					aBorrowPList = "aBorrowPList?pageNo=" + 35; 
				}
				else {
					return;
				}
				$.ajax({
					url : aBorrowPList,
					type : "GET",
					data : "",
					success : function(data) {
						$("#adminBorrowMain").html(data);
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
	
	$("#adminBorrowSearch").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "adminBorrowSearch",
			type : "GET",
			data : $("#adminBorrowSearch").serialize(),
			success : function(result){
				$("#adminBorrowTable> tbody").empty();
				if(result.length >= 1) {
					result.forEach(function(item){
						let timestamp = item.borrowDate;
						let timestamp2 = item.dueDate;
						let date = new Date(timestamp);
						let date2 = new Date(timestamp2);
						
						let year = date.getFullYear().toString();
						let month = ("0" + (date.getMonth() + 1)).slice(-2); 
						let day = ("0" + date.getDate()).slice(-2);
						let hour = ("0" + date.getHours()).slice(-2);
						let minute = ("0" + date.getMinutes()).slice(-2); 
						let second = ("0" + date.getSeconds()).slice(-2);
						let TDate = year + "-" + month + "-" + day + "&nbsp;" + hour + ":" + minute + ":" + second + ".0";
						
						let year2 = date2.getFullYear().toString();
						let month2 = ("0" + (date2.getMonth() + 1)).slice(-2); 
						let day2 = ("0" + date2.getDate()).slice(-2);
						let hour2 = ("0" + date2.getHours()).slice(-2);
						let minute2 = ("0" + date2.getMinutes()).slice(-2); 
						let second2 = ("0" + date2.getSeconds()).slice(-2);
						let TDate2 = year2 + "-" + month2 + "-" + day2 + "&nbsp;" + hour2 + ":" + minute2 + ":" + second2 + ".0";
						
						let r = item.rendre;
						let r2 = '미반납';
						var line = "";
						
						if(r == r2) {
							line = '<button class="btn btn-danger rendre" type="button" id="rendreBtn">반납<span class="d-none">${dto.borrowId}</span></button>' 
						}
						else {
							line = "반납완료";
						}
						
						
						str = "<tr>";
						str += '<td>' + item.pid + '</td>';
						str += '<td>' + item.bookTitle + '</td>';
						str += '<td>' + item.writer + '</td>';
						str += '<td>' + TDate + '</td>';
						str += '<td>' + TDate2 + '</td>';
						str += '<td>' + line + '</td>';
						str += "</tr>";
						$("#adminBorrowTable").append(str);
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