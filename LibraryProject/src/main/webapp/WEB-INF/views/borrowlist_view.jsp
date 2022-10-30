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
<title>MAIN</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" 
integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<head>
<body>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="myPage_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<h3 style="color:#527062;"><i class="fas fa-clipboard-list"></i>&nbsp;<b>대출·반납</b></h3>
		<hr/>
		<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
			<span style="color:#527062;"><b>대출·반납</b></span><br/>
			<span style="font-size:14px;">
				회원님의 대출 내역입니다.
			</span>
		</p>
		<span style="color:grey;" class="mt-5">* 반납하신 도서는 표시되지 않습니다.</span>
		<table class="table table-bordered text-center table-hover" id="adminApplicationTable" style="border-top:2px solid black;border-bottom:2px solid black;">
			<thead style="background:#d7d8df;">
				<tr>
					<th>제목</th>
					<th>저자</th>
					<th>대출일</th>
					<th>반납기한</th>
					<th>반납</th>
				</tr>
			</thead>
			<tbody class="text-secondary">
				<c:forEach items="${userBList}" var="dto">
					<tr>
						<td>${dto.bookTitle}</td>
						<td>${dto.writer}</td>
						<td>${dto.borrowDate}</td>
						<td>${dto.dueDate}</td>
						<td>
							<button class="btn btn-sm btn-dark bReturn" type="button">반납<span class="d-none">${dto.borrowId}</span></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
$(document).ready(function() {
	$(".bReturn").click(function(event){
		event.preventDefault();
		if(confirm("도서를 반납하시겠습니까?") == true) {
			let target = $(event.target);
			let no = target.children("span").text();
			let bReturn = {
				borrowId : no,
				${_csrf.parameterName} : "${_csrf.token}"
			}
			$.ajax({
				url : "bookReturn",
				type : "post",
				data : bReturn,
				success : function(data){
					alert("정상적으로 반납되었습니다.");
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("반납이 실패하였습니다. 다시 시도해주세요.");
				}
			});
		}
	});
});
</script>
</body>
</html>