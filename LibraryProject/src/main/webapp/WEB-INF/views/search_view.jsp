<!-- JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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

<title>소장자료검색</title>

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
#hr { 
	background-color : gray;
	height : 3px;
}
#searchfield1 {
	display : inline-block;
	height : 37px;
	align-items : center;
	text-align : start;
}
#searching1, #searching2, #searching3 {
	
	display : inline-block;
	width : 70%; 
	max-width : 700px;
}
div {
	text-align : center;
}
button {
	margin : 0px;
	padding : 0px;
}
input {
	vertical-align : middle;
}
select {
	vertical-align : middle;
}
#searching1:focus, #searching2:focus, #searching3:focus {
	outline : none;
}
#srch_btn {
	background-color : #527062;
	color : white;
	width : 20%;
	margin-top : 20px;
}
input.form-check-input {
	accent-color : #3f3f48;
}
</style>


</head>
<body>

<div class = "container mt-5" id = "main">
	<h1>소장 자료 검색</h1>
	<hr id="hr"/>
	<form action = "searchBook" id = "searchBookform">
		<div class = "form-group" id = "search_div1">
			<select id = "searchfield1" name = "srchtype1" class = "searchKey">
				<option value = "">전체</option>
				<option value = "booktitle">서명</option>
				<option value = "writer">저자</option>
				<option value = "publisher">출판사</option>
			</select>
			<input type = "search" class = "form-control" name = "srchkeyword1" value = "" id = "searching1">
		</div>
		<div class = "form-group" id = "search_div1">
			<select id = "searchfield1" name = "srchtype2" class = "searchKey">
				<option value = "">전체</option>
				<option value = "booktitle">서명</option>
				<option value = "writer">저자</option>
				<option value = "publisher">출판사</option>
			</select>
			<input type = "search" class = "form-control" name = "srchkeyword2" value = "" id = "searching2">
		</div>
		<div class = "form-group" id = "search_div1">
			<select id = "searchfield1" name = "srchtype3" class = "searchKey">
				<option value = "">전체</option>
				<option value = "booktitle">서명</option>
				<option value = "writer">저자</option>
				<option value = "publisher">출판사</option>
			</select>
			<input type = "search" class = "form-control" name = "srchkeyword3" value = "" id = "searching3">
		</div>
	
		<div class = "form-check-inline">
			<label for = "searchlimit1_1" class = "form-check-label"><b>장르</b> &nbsp;&nbsp;
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_1" name = "total"
						value = "" checked/>전체
			</label>		
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_2" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_2" name = "genre"
						value = "경제/경영">경제/경영
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_3" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_3" name = "genre"
						value = "문학">문학
			</label>
		</div>	
		<div class = "form-check-inline">
			<label for = "searchlimit1_4" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_4" name = "genre"
						value = "정치/사회">정치/사회
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_5" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_5" name = "genre"
						value = "역사/문화">역사/문화
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_6" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_6" name = "genre"
						value = "예술/대중문화">예술/대중문화
			</label>
		</div>
		<br>
		<div class = "form-check-inline">
			<label for = "searchlimit1_7" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_7" name = "genre"
						value = "과학">과학
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_8" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_8" name = "genre"
						value = "자기계발">자기계발
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_9" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_9" name = "genre"
						value = "컴퓨터/IT">컴퓨터/IT
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_10" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_10" name = "genre"
						value = "요리">요리
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_11" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_11" name = "genre"
						value = "청소년">청소년
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_12" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_12" name = "genre"
						value = "유아/어린이">유아/어린이
			</label>
		</div>
		<div class = "form-check-inline">
			<label for = "searchlimit1_13" class = "form-check-label">
				<input type = "checkbox" class = "form-check-input" id = "searchlimit1_13" name = "genre"
						value = "만화">만화
			</label>
		</div>
		
		<br/>
<!-- 		
		<div class = "form-check-inline">
		<label for = "searchlimit2_1" class = "form-check-label"><b>대여여부</b> &nbsp;&nbsp;
			<input type = "checkbox" class = "form-check-input" id = "searchlimit2_1" name = "total2"
					value = "" checked/>전체	
		</label>
		</div>
		<div class = "form-check-inline">
		<label for = "searchlimit2_2" class = "form-check-label">
			<input type = "checkbox" class = "form-check-input" id = "searchlimit2_2" name = "bookpossible"
					value = "rent">대출가능
		</label>
		</div>
		<div class = "form-check-inline">
		<label for = "searchlimit2_3" class = "form-check-label">
			<input type = "checkbox" class = "form-check-input" id = "searchlimit2_3" name = "bookpossible"
					value = "reserve">예약가능
		</label>
		</div>
		<div class = "form-check-inline">
		<label for = "searchlimit2_4" class = "form-check-label">
			<input type = "checkbox" class = "form-check-input" id = "searchlimit2_4" name = "bookpossible"
					value = "other">기타
		</label>
		</div>
		<br/> -->
		<button type = "submit" class = "btn" id = "srch_btn">
			<i class = "fa fa-search">  검색</i></button>
	</form>
	
	<br/><br/>
	
	<div id = "srchresult">
		<table class = "table table-hover" id = "booklist" style = "border-top:2px solid black; border-bottom:2px solid black">
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
			<tbody id = "srchbooklist">
				<c:forEach items="${bookList}" var="dto">
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




<script>
$(document).ready(function(){
	$("input[name = 'genre']").prop("checked", true);
/* 	$("input[name = 'bookpossible']").prop("checked", true); */
	
	// 전체 체크박스 클릭 (자료유형)
	$("#searchlimit1_1").click(function(){
		if($("#searchlimit1_1").prop("checked")) {
			$("input[name = 'genre']").prop("checked", true);
		} else {
			$("input[name = 'genre']").prop("checked", false);
		}
	});
	
	// 전체 체크박스 해제 (자료해제)
	$("input[name = 'genre']").click(function(){
		var all_sl1 = $("input[name = 'genre']").length;
		var checked_sl1 = $("input[name = 'genre']:checked").length;
		
		if (all_sl1 == 12) {
			$("#searchlimit1_1").prop("checked", false);
		} else {
			$("#searchlimit1_1").prop("checked", true);
		}
	});
	
/* 	
	// 전체 체크박스 클릭 (대여여부)
	$("#searchlimit2_1").click(function(){
		if($("#searchlimit2_1").prop("checked")) {
			$("input[name = 'bookpossible']").prop("checked", true);
		} else {
			$("input[name = 'bookpossible']").prop("checked", false);
		}
	});
	
	// 전체 체크박스 해제 (대여여부)
	$("input[name = 'bookpossible']").click(function(){
		var all_sl2 = $("input[name = 'bookpossible']").length;
		var checked_sl2 = $("input[name = 'bookpossible']:checked").length;
		
		if (all_sl2 == 3) {
			$("#searchlimit2_1").prop("checked", false);
		} else {
			$("#searchlimit2_1").prop("checked", true);
		}
	}); */
	
	// 우선 보이지 않게 만들자
	$("#srchresult").css("display", "none");
	
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
	
	

<!-- 검색 결과 -->
	$("#searchBookform").submit(function(event){
		event.preventDefault();
		var requestData = $("#searchBookform").serialize(); // Object인지 확인하기 위한 객체
/* 		console.log($("#searchBookform"));
		console.log("requestData가 Object형인지 확인 : " + typeof(requestData)); // ---> type은 String! 
		console.log("requestData : " + requestData); */
		$.ajax({
			url : "searchBook",
			type : "get",
			data : requestData,
			success : function(result){
				$("#srchbooklist").empty();
				console.log("결과를 성공적으로 읽어냈음.");
				if(result.length >= 1) {
					console.log("결과가 제대로 되었는가 : " + Array.isArray(result)); // 제대로 배열화 되어있는지 확인 
					$("#srchresult").css("display", "block");
					result.forEach(function(item){
						str = "<tr>";
						str += '<td>' + item.genre + '</td>';
						str += '<td><img src="upimage/' + item.img + '" style="width:50%;" class="border border-dark"/></td>';
						str += '<td><a href="content_view?bookId='+ item.bookId + '" class="bclick" style="color:black;">' + item.bookTitle + '</a></td>';
						str += '<td>' + item.writer + '</td>';
						str += '<td>' + item.publisher + '</td>';
						str += '<td>' + item.year + '</td>';
						str += "</tr>";
						$("#srchbooklist").append(str);
					});
				}
			},
			error : function(){
				alert("검색에 실패하였습니다.");
			}
		});
	});
});
</script>
</body>
</html>