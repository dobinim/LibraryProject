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

<div class="container mt-5" id="book-main">
	<input value="${content_view.bookId}" type="hidden" name="bookId"/>
	<div class="row">
		<div class="col-2 border border-dark;">
			<jsp:include page="admin_menu.jsp" flush="false"/>
		</div>
		<div class="col-10" style="width:100%;">
			<h3 style="color:#527062;"><i class="fas fa-book-reader"></i>&nbsp;<b>소장등록 및 대출</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
				<span style="color:#527062;"><b>소장등록 및 대출</b></span><br/>
				<span style="font-size:14px;">
					해당 도서가 위치한 자료실 및 청구기호, 등록번호를 정확히 입력해 주십시오.
				</span>
			</p>
			<div class="card mt-5">
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
						</div>
					</div>
					
					<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;소장 위치</span>
					<form action="#" method="post" id="bookForm" name="bookForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input value="${content_view.bookId}" type="hidden" name="bookId"/>
						<input value="${content_view.bookTitle}" type="hidden" name="bookTitle"/>
						<input value="${content_view.writer}" type="hidden" name="writer"/>
						<table class="table table-hover mt-2" style="text-align:center; border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
							<thead style="background:#d7d8df;">
								<tr>
									<th>&nbsp;&nbsp;</th>
									<th>기관명</th>
									<th>자료실명</th>
									<th>청구기호</th>
									<th>등록번호</th>
									<th>도서상태</th>
									<th>대출예약</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bookBorrow_info}" var="dto">
									<tr>
										<td><input type="checkbox" name="borrowId" value="${dto.borrowId}" class="cb"/></td>
										<td>${dto.organName}</td>
										<td>${dto.referenceRoom}</td>
										<td>${dto.callNum}</td>
										<td>${dto.regiNum}</td>
										<td>${dto.bookPossible}</td>
										<td>${dto.booking}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="clearfix">
							<div class="mt-1 form-inline" style="float:right;">
								<input type="text" name="pid" class="form-control" placeholder="회원 아이디"/>&nbsp;&nbsp;
								<button id="bookBorrow" type="submit" class="btn" style="background-color:#527062; color:white;"><i class="fa fa-book"></i>&nbsp;대출</button>&nbsp;&nbsp;
							</div>
						</div>
					</form>
					
					<form action="plus_possession" method="post" id="plus_possession" name="plus_possession" onsubmit="return false">
						<div class="border border-secondary mt-5 p-3" style="border-radius:10px 10px;">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input value="${content_view.bookId}" type="hidden" name="bookId"/>
							<div class="row">
								<div class="form-group col-6" style="display:inline;">
									<label for="organName">소장기관: </label>
									<input class="form-control" id="organName" name="organName" type="text" value="화곡도서관"/>
								</div>
								<div class="form-group col-6" style="display:inline;">
									<label for="referenceRoom">소장위치: </label>
									<select class="form-control" id="referenceRoom" name="referenceRoom">
										<option value="1층자료실">1층 자료실</option>
										<option value="2층자료실">2층 자료실</option>
										<option value="3층자료실">3층 자료실</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-6" style="display:inline;">
									<label for="callNum">청구기호: </label>
									<input class="form-control" id="callNum" name="callNum" type="text" placeholder="833.6-ㅎ961ㄴ c.1"/>
								</div>
								<div class="form-group col-6" style="display:inline;">
									<label for="regiNum">등록번호: </label>
									<input class="form-control" id="regiNum" name="regiNum" type="text" placeholder="EMC000370039"/>
								</div>
							</div>
							<input  class="form-control" id="bookPossible" name="bookPossible" type="hidden" value="대출가능"/>
							<input  class="form-control" id="booking" name="booking" type="hidden" value="예약가능"/>
						</div>
						<div align="right" class="mt-1">
							<button id="poBtn" type="submit" class="btn" style="background-color:#527062; color:white;" onclick="plus()"><i class="fa fa-plus"></i>&nbsp;등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#bookBorrow").click(function() {
		if(confirm("책을 대출하시겠습니까?") == true) {
			$("#bookForm").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "bookBorrow",
					type : $("#bookForm").attr("method"),
					data : $("#bookForm").serialize(),
					success : function(data){
						alert("책이 대출 상태로 변경되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("도서를 선택해주세요.");
					}
				});
			});
		}
		else {
			return false;
		}
	});
	
	$(".cb").change(function() {
	    $(".cb").not(this).prop("checked", false);
	});
	
	/*
	$("#poBtn").click(function(event){
		plus();
	});*/
});
</script>
<script>
function plus() {
	if(confirm("소장 등록을 하시겠습니까?") == true) {
		$("#plus_possession").submit(function(event){
			event.preventDefault();
			$.ajax({
				url : "plus_possession",
				type : "post",
				data : $("#plus_possession").serialize(),
				success : function(data) {
					alert("등록이 완료되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function() {
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		});
	}
	else {
		return false;
	}
}
</script>
</body>
</html>