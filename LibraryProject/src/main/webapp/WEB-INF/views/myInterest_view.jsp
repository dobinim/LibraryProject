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

<div class="container mt-5">
	<h3><i class="fa fa-heart" style="color:#527062;"></i>&nbsp;관심도서</h3>
	<hr/>
	<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5 mb-5">
		<span style="color:#527062;"><b>관심도서</b></span><br/>
		<span style="font-size:14px;">
			관심도서로 등록한 도서 목록입니다.<br/>
			대출 또는 예약을 원하시면 로그인해 주십시오.
		</span>
	</p>
	<table id="interestTable" class="table" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead style="background-color:#d7d8df;color:#3f3f48;text-align:center;">
			<tr>
				<th style="width:5%">&nbsp;&nbsp;</th>
				<th style="width:15%">분류</th>
				<th style="width:15%">표지</th>
				<th style="width:25%">제목</th>
				<th style="width:15%">저자</th>
				<th style="width:15%">출판사</th>
				<th style="width:10%">출판년도</th>
			</tr>
		</thead>
		<tbody id="interestBody" class="text-center">
		
		</tbody>
	</table>
	<div align="right">
		<button type="button" id="interestDel" class="btn btn-danger mr-1" onclick="delSelect()">선택삭제</button>
		<button type="button" id="interestDelAll" class="btn btn-danger" onclick="delAll()">전체삭제</button>
	</div>
</div>

<script>
$(document).ready(function() {
	if(typeof(Storage) == "undefined") {
		return;
	}
	
	let i;
	let keyName;
	let interestItem;
	let interestTemObj;
	let img;
	let bookId;
	let bookTitle;
	let publisher;
	let writer;
	let genre;
	let year;
	
	let list = "";
	for(i=0; i < localStorage.length; i++) {
		keyName = localStorage.key(i);
		interestItem = localStorage.getItem(keyName);
		interestTemObj = JSON.parse(interestItem);
		img = interestTemObj.img;
		bookTitle = interestTemObj.bookTitle;
		bookId = interestTemObj.bookId;
		writer = interestTemObj.writer;
		publisher = interestTemObj.publisher;
		genre = interestTemObj.genre;
		year = interestTemObj.year;
		
		if(keyName.substr(0,3) == "lib") {
			list +=
				"<tr><td><input type='checkbox' name='bookId' value='" + bookId  + "' class='cb'/></td><td>" + genre + "</td><td><img style='width:30%;' src='" 
				+ img + "'/></td><td><a href='content_view?bookId=" + bookId + "' class='bclick' style='color:black;'>" + bookTitle + "</a></td><td>" + writer 
				+ "</td><td>" + publisher + "</td><td>" + year + "</td></tr>";
		}
	}
	
	$("#interestBody").html(list);
	
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

function delAll() {
	if(confirm("관심도서 목록을 초기화하시겠습니까?") == true) {
		localStorage.clear();
		
		$.ajax({
			url : "interestBook",
			type : "GET",
			data : "",
			success : function(data) {
				alert("관심도서가 초기화되었습니다.");
				$("#mainRegion").html(data);
			} ,
			error : function() {
				alert("서버 접속 실패");
			}
		});
	}
}

function delSelect() {
	if(confirm("선택한 관심도서를 목록에서 삭제하시겠습니까?") == true) {
		let arr = [];
		let id = document.getElementsByName("bookId");
	
		for (let i=0; i < id.length; i++) {
			if(id[i].checked == true) {
				arr.push(id[i]).value;
			}
		}
		
		for(let i=0; i < arr.length; i++) {
			console.log(arr[i].value);
			key = arr[i].value;
			console.log("키값" + key);
			localStorage.removeItem("lib" + key);
		}
		
		$.ajax({
			url : "interestBook",
			type : "GET",
			data : "",
			success : function(data) {
				alert("선택한 관심도서가 삭제되었습니다.");
				$("#mainRegion").html(data);
			} ,
			error : function() {
				alert("서버 접속 실패");
			}
		});
	}
}
</script>
</body>
</html>