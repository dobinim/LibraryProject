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
<meta id="_csrf" name="_csrf" content="${_csrf.token }"/>
<title>도서 상세페이지</title>
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
<style>
#book-main .col-sm-8 {
	display : inline;
}
#book-main .col-4 {
	text-align:center;
}
</style>
</head>
<body>

<sec:authorize access = "isAuthenticated()">
	<sec:authentication property = "principal.username" var = "user_id" />
</sec:authorize>

<div class="container mt-5" id="book-main">
	<div class="row">
		<div class="col-2 border border-dark;">
			<jsp:include page="bookList_menu.jsp" flush="false"/>
		</div>
		<div class="col-10" style="width:100%;">
			<div class="card">
				<div class="card-header"></div>
				<div class="card-body">
					<div class="row">
						<div class="col-4">
							<img src="upimage/${content_view.img}" style="width:100%;" class="border border-dark"/>
						</div>
						<div class="col-8">
							<div class="form-group">
								<label class="col-sm-4">서명: </label>
								<div class="col-sm-8">${content_view.bookTitle}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">원서명: </label>
								<div class="col-sm-8">${content_view.bookOriTitle}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">저자: </label>
								<div class="col-sm-8">${content_view.writer}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">자료유형: </label>
								<div class="col-sm-8">${content_view.bookType}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">발행사항: </label>
								<div class="col-sm-8">${content_view.genre}, ${content_view.year}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">형태사항: </label>
								<div class="col-sm-8">${content_view.form}</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">ISBN: </label>
								<div class="col-sm-8">${content_view.isbn}</div>
							</div>
							<sec:authorize access="isAnonymous()">
								<button onclick="interBook()" class="btn btn-warning float-right" type="button" style="color:white;"><i class="fa fa-heart"></i>&nbsp;관심도서 등록</button>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<button onclick="interBook()" class="btn btn-warning float-right" type="button" style="color:white;"><i class="fa fa-heart"></i>&nbsp;관심도서 등록</button>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
			
			<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;소장 위치</span>
			<form action="book_reservation" id="book_reservation" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="reservationTitle" value="${content_view.bookTitle}"/>
				<input type="hidden" name="reservationUser" value="${user_id}"/>
				<input type="hidden" name="bookId" value="${content_view.bookId}"/>
				<table class="table table-hover mt-2" style="text-align:center; border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
					<thead style="background:#d7d8df;">
						<tr>
							<th>기관명</th>
							<th>자료실명</th>
							<th>청구기호</th>
							<th>등록번호</th>
							<th>도서상태</th>
							<th>대출예약</th>
							<th>예약</th>
							<th>대출</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookBorrow_info}" var="dto">
							<tr>
								<td>${dto.organName}</td>
								<td>${dto.referenceRoom}</td>
								<td>${dto.callNum}<input type="hidden" name="callNum" value="${dto.callNum}"/></td>
								<td>${dto.regiNum}</td>
								<td>${dto.bookPossible}<input type="hidden" name="bookPossible" value="${dto.bookPossible}"/></td>
								<td>${dto.booking}</td>
								<td>
									<c:set var="r" value="${dto.booking}"></c:set>
									<c:choose>
									<c:when test ="${r == '예약가능'}">
										<a class="rBtn btn btn-sm btn-outline-primary" href="${dto.borrowId}">도서예약</a>
									</c:when>
									<c:otherwise>
										<button class="btn btn-sm btn-outline-danger" type="button">도서예약 불가</button>
									</c:otherwise>
								</c:choose>
								</td>
								<td>
									<c:set var="b" value="${dto.bookPossible}"></c:set>
									<c:choose>
									<c:when test ="${b == '대출중'}">
										<button class="btn btn-sm btn-dark" type="button">대출중</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-sm bBtn" style="background:#527062;color:white;" type="button"><span class="d-none">${dto.borrowId}</span><p class="d-none">${dto.bookId}</p>대출</button>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			
			<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;책소개</span>
			<table class="table table-hover mt-2" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df; table-layout:fixed;">
				<tbody>
					<tr>
						<td>
							<p style="white-space:pre-line;">${content_view.bookContent}</p>
						</td>
					</tr>
				</tbody>
			</table>
			
			<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;저자 소개</span>
			<table class="table table-hover mt-2" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
				<tbody>
					<tr>
						<td>
							<p style="white-space:pre;">${content_view.bookWriter}</p>
						</td>
					</tr>
				</tbody>
			</table>
			
			<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;목차</span>
			<table class="table table-hover mt-2" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
				<tbody>
					<tr>
						<td>
							<p style="white-space:pre;">${content_view.bookIndex}</p>
						</td>
					</tr>
				</tbody>
			</table>
			
			<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-comments"></i>&nbsp;서평작성</span>
			<table class="table mt-2" style="text-align:center; border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
				<thead style="background:#d7d8df;">
					<tr>
						<th style="width:15%">작성자</th>
						<th style="width:50%">내용</th>
						<th style="width:30%">등록일자</th>
						<th style="width:5%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${book_comment}" var="dto">
						<tr>
							<td style="width:15%">${dto.commentWriter}</td>
							<td style="width:50%">${dto.commentContent}</td>
							<td style="width:30%">${dto.commentDate}</td>
							<td style="width:5%;">
								<c:set var="cname" value="${dto.commentWriter}"></c:set>
								<c:choose>
									<c:when test ="${user_id == cname}">
										<a class="commentDel" id="delBtn" href="${dto.commentNo}"><i class="fas fa-times" style="color:red;"></i></a>
									</c:when>
									<c:otherwise>
										<div></div>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<sec:authorize access="isAnonymous()">
				<textarea disabled placeholder="로그인 후 사용가능합니다." style="width:100%; height:70px;"></textarea>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<form action="bookComment" method="post" name="bookComment" id="bookComment">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="bookId" value="${content_view.bookId}" id="bookId"/>
					<input type="hidden" name="commentWriter" value="${user_id}" id="commentWriter"/>
					<textarea placeholder="한 줄 서평을 작성해주세요. (최대 140자)" style="width:100%; height:70px;" maxlength="140" name="commentContent" id="commentContent"></textarea>
					<button class="btn btn-primary float-right" type="submit" id="commentBtn" style="background-color:#527062; color:white;"><i class="fas fa-pen"></i>&nbsp;작성</button>
				</form>		
			</sec:authorize>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	let user = '<c:out value="${user_id}"/>';
	
	$("#commentBtn").click(function(){
		$("#bookComment").submit(function(event){
			event.preventDefault();
			if(confirm("서평을 작성하시겠습니까?") == true) {
				$.ajax({
					url : $("#bookComment").attr("action"),
					type : "POST",
					data : $("#bookComment").serialize(),
					success : function(data) {
						alert("서평이 작성되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function() {
						alert("글자수가 초과되었습니다. 다시 시도해주세요.");
					}
				});
			}
		});
	});
	
	$(".rBtn").click(function(event){	
		event.preventDefault();
		if(user != "") {
			if(confirm("도서를 예약하시겠습니까?") == true) {
				//예약 5개 확인
				let reservationUser = "<c:out value='${user_id}'/>"
				let No = $(this).attr("href");
				$.ajax({
					url : "reservation5Check",
					type : "GET",
					data : {reservationUser : reservationUser},
					success : function(result) {
						if(result == 5) {
							alert("도서 예약은 최대 5개까지 가능합니다.");
						}
						else {
							//예약 처리
							$.ajax({
								url : "bookReservationPage?No=" + No,
								type : "GET",
								data : {
									borrowId : No,
									bookId : ${content_view.bookId}
								},
								success : function(data) {
									alert("예약이 완료되었습니다. 예약 내역은 마이페이지에서 확인해주세요.");
									$("#mainRegion").html(data);
								},
								error : function() {
									alert("예약이 실패하였습니다. 다시 시도해주세요.");
								}
							});
						}
					},
					error : function() {
						alert("서버 접속 실패. 다시 시도해주세요.")
					}
				});
			}
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
	
	$(".commentDel").click(function(event){
		event.preventDefault();
		if(confirm("서평을 삭제하시겠습니까?") == true) {
			let No = $(this).attr("href"); 
			$.ajax({
				url : "commentDel?No=" + No,
				type : "GET",
				data : {
					commentNo : No,
					bookId : ${content_view.bookId}
				},
				success : function(data){
					alert("서평이 삭제되었습니다.")
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
	});
	
	$(".bBtn").click(function(event){	
		event.preventDefault();
		if(user != "") {
			if(confirm("도서를 대출하시겠습니까?") == true) {
				let target = $(event.target);
				let no = target.children("span").text();
				let book = target.children("p").text();
				let id = "${user_id}"
				let userBorrow = {
					borrowId : no,
					bookId : book,
					user_id : id,
					${_csrf.parameterName} : "${_csrf.token}"
				}
				
				$.ajax({
					url : "userBookBorrowPage",
					type : "post",
					data : userBorrow,
					success : function(data){
						alert("정상적으로 대출되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("대출에 실패하였습니다. 다시 시도해주세요.");
					}
				});
			}
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
});
</script>
<script>
function interBook() {
	console.log("관심도서");
	
	if(typeof(Storage) == "undefined") {
		return;
	}
		
	keyValue = "lib" + "${content_view.bookId}"
	
	let bookInfo = {
			img : "upimage/" + "${content_view.img}",
			bookId : "${content_view.bookId}",
			bookTitle : "${content_view.bookTitle}",
			writer : "${content_view.writer}",
			publisher : "${content_view.publisher}",
			genre : "${content_view.genre}",
			year : "${content_view.year}"
	}
	
	if(localStorage.getItem(keyValue) == null) {
		localStorage.setItem(keyValue, JSON.stringify(bookInfo));
		
		$.ajax({
			url : "interestBook",
			type : "GET",
			data : "",
			success : function(data) {
				alert("관심도서에 등록되었습니다.");
				$("#mainRegion").html(data);
			} ,
			error : function() {
				alert("서버 접속 실패");
			}
		});
	}
	else {
		alert("'${content_view.bookTitle}'은(는) 이미 관심도서에 등록되어있습니다.");
	}
	
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
	});
}
</script>
</body>
</html>