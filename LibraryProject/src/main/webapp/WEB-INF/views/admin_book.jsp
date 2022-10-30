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
		<h3 style="color:#527062;"><i class="fa fa-book"></i>&nbsp;<b>도서 및 대출 관리</b></h3>
		<hr/>
		<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
			<span style="color:#527062;"><b>소장 도서 목록 확인 및 정보 수정, 대출 관리</b></span><br/>
			<span style="font-size:14px;">
				도서 정보 수정 및 소장 등록을 하려면 각 도서 페이지로 이동해 주십시오.
				도서 대출은 소장 등록 페이지에서 확인하십시오.
			</span>
		</p>
		<div align="right" class="mb-1 mt-5">
			<div class="mb-2">
				<a id="bookList" href="admin_book" class="btn" style="background:#527062;color:white;">도서목록</a>
				<a id="borrowList" href="admin_borrowList" class="btn" style="background:#527062;color:white;" class="ml-1">전체대출목록</a>
			</div>
			<form action="adminBookSearch" method="post" id="adminBookSearch">
				<select name="type">
					<option value="title">제목</option>
					<option value="writer">저자</option>
					<option value="isbn">ISBN</option>
				</select>
				<input type="text" name="keyword" value="" placeholder="키워드 검색"/>
				<input type="submit" id="adminBookSearchBtn" value="검색">
			</form>
		</div>
		<div id="adminBookMain">
			<form action="bookDel" method="post" id="bookDel" class="bookDel">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<table class="table table-bordered text-center table-hover" id="adminBookTable" style="border-top:2px solid black;border-bottom:2px solid black;">
						<thead style="background:#d7d8df;">
							<tr>
								<th style="width:10%;"></th>
								<th style="width:10%;">No.</th>
								<th style="width:15%;">표지</th>
								<th style="width:40%;">제목</th>
								<th style="width:25%;">저자</th>
							</tr>
						</thead>
						<tbody class="text-secondary">
							<c:forEach items="${bookList}" var="dto">
								<tr>
									<td><input type="checkbox" name="bookId" value="${dto.bookId}" class="cb"/></td>
									<td>${dto.bookId}</td>
									<td><img src="upimage/${dto.img}" style="width:50%;" class="border border-dark"/></td>
									<td><a class="bclick" href="bookModiView?bookId=${dto.bookId}" style="color:black;">${dto.bookTitle}</a></td>
									<td>${dto.writer}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<button type="submit" class="btn btn-danger" style="float:right;"><i class="fas fa-trash"></i>&nbsp;삭제</button>
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
	$("#bookDel").submit(function(event){
		event.preventDefault();
		if(confirm("해당 도서를 삭제하시겠습니까?") == true) {
			$.ajax({
				url : $("#bookDel").attr("action"),
				type : $("#bookDel").attr("method"),
				data : $("#bookDel").serialize(),
				success : function(data){
					alert("해당 도서가 삭제되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("도서를 선택해주세요.");
				}
			});
		}
		else {
			location.href("admin_book");
		}
	});
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
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
				let aBookPList;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					aBookPList = "aBookPList?pageNo=" + pageNo;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a"); //li의 active클래스가 있고 a에 페이지 번호가 있음 
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야하므로 정수로 변환
					pageNo2 = pageNo1 + 1;
					aBookPList = "aBookPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");  
					pageNo = pageA.text(); 
					pageNo1 = parseInt(pageNo);
					pageNo2 = pageNo1 - 1;
					aBookPList = "aBookPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "First") {
					aBookPList = "aBookPList?pageNo=" + 1; 
				}
				else if(pageNo == "Last") {
					aBookPList = "aBookPList?pageNo=" + 35; 
				}
				else {
					return;
				}
				$.ajax({
					url : aBookPList,
					type : "GET",
					data : "",
					success : function(data) {
						$("#adminBookMain").html(data);
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
	
	$("#adminBookSearch").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "adminBookSearch",
			type : "GET",
			data : $("#adminBookSearch").serialize(),
			success : function(result){
				$("#adminBookTable > tbody").empty();
				if(result.length >= 1) {
					result.forEach(function(item){
						str = "<tr>";
						str += "<td><input type='checkbox' name='bookId' value='" + item.bookId + "' class='cb'/></td>";
						str += "<td>" + item.bookId + "</td>";
						str += "<td><img src='upimage/" + item.img + "' style='width:50%;' class='border border-dark'/></td>";
						str += "<td><a class='bclick' href='bookModiView?bookId=" + item.bookId + "' style='color:black;'>" + item.bookTitle + "</a></td>";
						str += "<td>" + item.writer + "</td>";
						str += "</tr>";
						$("#adminBookTable").append(str);
					});
				}
			},
			error : function(){
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	
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
});
</script>
</body>
</html>