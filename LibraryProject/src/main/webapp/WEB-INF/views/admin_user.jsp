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
		<h3 style="color:#527062;"><i class="fa fa-user"></i>&nbsp;<b>회원 관리</b></h3>
		<hr/>
		<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
			<span style="color:#527062;"><b>회원관리</b></span><br/>
			<span style="font-size:14px;">
				도서관에 회원가입한 회원 목록입니다.
			</span>
		</p>
		<div align="right" class="mb-1 mt-5">
			<form action="adminUserSearch" method="post" id="adminUserSearch">
				<select name="type">
					<option value="name">성함</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" name="keyword" value="" placeholder="회원 검색"/>
				<input type="submit" id="adminUserSearchBtn" value="검색">
			</form>
		</div>
		<div id="userMain">
			<form action="#" method="post" id="authForm" name="authForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table table-bordered text-center table-hover" id="adminUserTable" style="border-top:2px solid black;border-bottom:2px solid black;">
					<thead style="background:#d7d8df;">
						<tr>
							<th>&nbsp;&nbsp;</th>
							<th>이름</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>가입날짜</th>
							<th>권한</th>
						</tr>
					</thead>
					<tbody class="text-secondary">
						<c:forEach items="${user_list}" var="user">
							<tr>
								<td><input type="checkbox" name="pid" value="${user.pid}" class="cb"/></td>
								<td>${user.pname}</td>
								<td><a class="uclick" href="userView?pid=${user.pid}">${user.pid}</a></td>
								<td>${user.pmail1}@${user.pmail2}</td>
								<td>${user.ppn1}-${user.ppn2}-${user.ppn3}</td>
								<td>${user.pdate}</td>
								<td>${user.auth}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="right">
					<button id="adminChange" type="submit" class="btn btn-primary" style="background:#527062;"><i class="fas fa-exchange-alt"></i>&nbsp;관리자</button>
					<button id="userChange" type="submit" class="btn btn-primary" style="background:#527062;"><i class="fas fa-exchange-alt"></i>&nbsp;일반회원</button>
				</div>
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
$(document).ready(function(){
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 35,
		visiblePages: 10,
		onPageClick : function(event,page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click",function(event){ 
				event.preventDefault();
				let peo = $(event.target);
				let pageNo = peo.text();
				let userPList;
				let pageA;
				let pageNo1;
				let pageNo2;
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					userPList = "userPList?pageNo=" + pageNo;
				}
				else if(pageNo == "Next") {
					pageA = $("li.active > a"); 
					pageNo = pageA.text(); 
					pageNo1 = parseInt(pageNo); 
					pageNo2 = pageNo1 + 1;
					userPList = "userPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "Previous") {
					pageA = $("li.active > a");  
					pageNo = pageA.text(); 
					pageNo1 = parseInt(pageNo);
					pageNo2 = pageNo1 - 1;
					userPList = "userPList?pageNo=" + pageNo2; 
				}
				else if(pageNo == "First") {
					userPList = "userPList?pageNo=" + 1; 
				}
				else if(pageNo == "Last") {
					userPList = "userPList?pageNo=" + 35; 
				}
				else {
					return;
				}
				$.ajax({
					url : userPList,
					type : "GET",
					data : "",
					success : function(data) {
						$("#userMain").html(data);
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
	
	$("#adminChange").click(function() {
		if(confirm("관리자로 변경하시겠습니까?") == true) {
			$("#authForm").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "authorityChange",
					type : $("#authForm").attr("method"),
					data : $("#authForm").serialize(),
					success : function(data){
						alert("권한이 변경되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("회원을 선택해주세요.");
					}
				});
			});
		}
	});
	
	$("#userChange").click(function() {
		if(confirm("일반회원으로 변경하시겠습니까?") == true) {
			$("#authForm").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "authorityChange2",
					type : $("#authForm").attr("method"),
					data : $("#authForm").serialize(),
					success : function(data){
						alert("권한이 변경되었습니다.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("회원을 선택해주세요.");
					}
				});
			});
		}
	});
	
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
	});
	
	$("#adminUserSearch").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "adminUserSearch",
			type : "GET",
			data : $("#adminUserSearch").serialize(),
			success : function(result){
				$("#adminUserTable> tbody").empty();
				if(result.length >= 1) {
					result.forEach(function(item){
						let timestamp = item.pdate;
						let date = new Date(timestamp);
						let year = date.getFullYear().toString();
						let month = ("0" + (date.getMonth() + 1)).slice(-2); 
						let day = ("0" + date.getDate()).slice(-2);
						let hour = ("0" + date.getHours()).slice(-2);
						let minute = ("0" + date.getMinutes()).slice(-2); 
						let second = ("0" + date.getSeconds()).slice(-2);
						let TDate = year + "-" + month + "-" + day + "&nbsp;" + hour + ":" + minute + ":" + second + ".0";
						str = "<tr>";
						str += '<td><input type="checkbox" name="pid" value="' + item.pid + '" class="cb"/></td>';
						str += '<td>' + item.pname + '</td>';
						str += '<td><a class="uclick" href="userView?pid=' + item.pid + '">'+ item.pid + '</a></td>';
						str += '<td>' + item.pmail1 + '@' + item.pmail2 + '</td>';
						str += '<td>' + item.ppn1 + '-' + item.ppn2 + '-' + item.ppn3 +'</td>';
						str += '<td>' + TDate + '</td>';
						str += '<td>' + item.auth + '</td>';
						str += "</tr>";
						$("#adminUserTable").append(str);
					});
				}
			},
			error : function(){
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
	
	$(document).on('click', '.uclick', function(event){
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