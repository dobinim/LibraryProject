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
<body>

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="myPage_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fas fa-clipboard-list"></i>&nbsp;<b>희망도서·예약</b></h3>
		<hr/>
		<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
			<span style="color:#527062;"><b>희망도서·예약</b></span><br/>
			<span style="font-size:14px;">
				신청하신 희망도서의 처리 현황 및 도서 예약 목록을 확인할 수 있습니다.
			</span>
		</p>
		<div id="applicationMain" class="mt-5">
			<h5 style="display:inline;"><b>희망도서신청현황</b></h5>&nbsp;&nbsp;<span style="color:grey;">* 최근 10권까지 표시됩니다.</span>
			<form action="appStateChange" method="post" id="appStateChange" name="appStateChange">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table table-bordered text-center table-hover mt-1" id="adminApplicationTable" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead style="background:#d7d8df;">
						<tr>
							<th style="width:25%;">제목</th>
							<th style="width:15%;">저자</th>
							<th style="width:15%;">출판사</th>
							<th style="width:15%;">장르</th>
							<th style="width:15%;">신청일</th>
							<th style="width:15%;">처리상태</th>
						</tr>
					</thead>
					<tbody class="text-secondary">
						<c:forEach items="${UserApplicationList}" var="list">
							<tr>
								<td>${list.appBookTitle}</td>
								<td>${list.appBookWriter}</td>
								<td>${list.appBookPub}</td>
								<td>${list.appBookGenre}</td>
								<td>${list.appDate}</td>
								<td style="color:#527062;"><b>${list.appState}</b></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br/>
		<div id="reservationMain" class="mt-5">
			<h5 style="display:inline;"><b>도서예약신청현황</b></h5>&nbsp;&nbsp;<span style="color:grey;">* 예약은 최대 5권까지 가능합니다.</span>
			<form action="appStateChange" method="post" id="appStateChange" name="appStateChange">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table table-bordered text-center table-hover mt-1" id="adminApplicationTable" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead style="background:#d7d8df;">
						<tr>
							<th style="width:25%;">제목</th>
							<th style="width:18%;">청구기호</th>
							<th style="width:25%;">신청일</th>
							<th style="width:15%;">대출상태</th>
							<th style="width:8.5%;">대출</th>
							<th style="width:8.5%;">취소</th>
						</tr>
					</thead>
					<tbody class="text-secondary">
						<c:forEach items="${UserReservationList}" var="rlist">
							<tr>
								<td>${rlist.reservationTitle}</td>
								<td>${rlist.callNum}</td>
								<td>${rlist.reservationDate}</td>
								<td style="color:#527062;"><b>${rlist.bookPossible}</b></td>
								<td>
									<c:set var="borrow" value="${rlist.bookPossible}"></c:set>
									<c:choose>
										<c:when test ="${borrow == '대출가능'}">
											<button class="btn btn-sm rBorrow" type="button" style="background:#527062; color:white;">대출<span class="d-none">${rlist.borrowId}</span><p class="d-none">${rlist.bookId}</p></button>		
										</c:when>
										<c:otherwise>
											<button class="btn btn-sm btn-dark" type="button">불가</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td><button class="btn btn-sm btn-danger rCancel" type="button">취소<span class="d-none">${rlist.borrowId}</span></button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$(".rCancel").click(function(event){
		event.preventDefault();
		if(confirm("예약을 취소하시겠습니까?") == true) {
			let target = $(event.target);
			let no = target.children("span").text();
			let cancel = {
				borrowId : no,
				${_csrf.parameterName} : "${_csrf.token}"
			}
			$.ajax({
				url : "userReservationCancel",
				type : "post",
				data : cancel,
				success : function(data){
					alert("예약이 정상적으로 취소되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("취소에 실패하였습니다. 다시 시도해주세요.");
				}
			});
		}
	});
	$(".rBorrow").click(function(event){
		event.preventDefault();
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
			console.log(no);
			console.log(book);
			
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
	});
});
</script>
</body>
</html>