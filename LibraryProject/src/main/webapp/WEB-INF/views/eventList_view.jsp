<!-- JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!-- Spring Security Tag Library -->
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>문화 행사 목록</title>
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--popper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- webapp/resources/js 아래 넣은 API를 사용하기 위해 입력 -->
<script src="js/jquery.twbsPagination.js"></script>

<style>
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}

h3 {
	text-align:center;
	color : #3f3f48;
}

#maindiv {
	margin-top : 20px;
	margin-right : auto;
	margin-left : auto;
}

#eventhead {
	background-color : #3f3f48;
	color:white;
	text-align : center;
}

#etbody {
	color : #3f3f48;
	text-align : center;
}

#th1 {
	width : 10%;
}

#th2, #th4 {
	width : 15%;
} 

#eventtable {
	border-bottom : 1px solid #3f3f48;
}

.bclick {
	color : #527062;
}

#writebtn {
	background-color : #527062;
	color : white;
	margin-left : 950px;
}

#pagination {
	text-align:center;
}

#searchbtn {
	background-color : #527062;
	color : white;
	border : 0;
	height : 40px;
	width : 80px;
}

#searchbar {
	width : 500px;
	height : 40px;
	border : 0px;
	border-bottom : 1px solid #3f3f48;
	
}

#searchbar:focus {
	outline : none;
}

#searchopt {
	height : 40px;
	border : 0px;
	border-bottom : 1px solid #3f3f48;
}

#searchopt:focus {
	outline : none;
}

#searchform { 
	text-align : center;
	margin-top : 30px;
	margin-bottom : 30px;
}


</style>
</head>
<body>

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div class="container mt-3 mb-3 p-3" id = "maindiv">
	<div class="row mt-3">
		<div class="col-2 border">
			<jsp:include page="classboard_menu.jsp" flush="false"/>
		</div>
			<div class="col-10 mx-auto" id="submain">
				<h3 style="color:#527062;"><i class="fas fa-camera"></i>&nbsp;<b>문화 행사</b></h3>
				<!-- 검색창 -->
				<form action = "#" id = "searchform"> 
					<select id = "searchopt" name = "eGroup">
						<option value = "" style = "display:none;" disabled selected>행사 분류</option>
						<option value = "누구나">누구나</option>
						<option value = "유아/아동">유아/아동</option>
						<option value = "청소년">청소년</option>
						<option value = "성인">성인</option>
						<option value = "어르신">어르신</option>
					</select>
					<input type = "text" id = "searchbar" name = "ekeyword" value = "" placeholder = "키워드를 입력하세요.">
					<input type = "submit" id = "searchbtn" class = "btn text-center" value = "검색">
				</form>
				<div id = "tablediv">
					<table class = "table table-hover" id = "eventtable">
					<thead id = "eventhead">
						<tr>
							<th id = "th1">No.</th>
							<th id = "th2">작성분류</th>
							<th id = "th3">제목</th>
							<th id = "th4">작성일</th>
						</tr>
					</thead>
					<tbody id = "etbody">
						<c:forEach items = "${eventList}" var = "dto">
							<tr>
								<td>${dto.eId}</td>
								<td>${dto.eGroup}</td>							
								<td>
								
									<a href = "eContentView?eId=${dto.eId}" class = "bclick">${dto.eTitle}</a>
								</td>
								<td>${dto.eWriteDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
							<!-- 페이지 표시 -->
			<nav aria-label = "Page navigation" id = "pagnav">
				<ul class = "pagination justify-content-center mx-auto" id = "pagination"></ul>
			</nav>
		</div>
		<sec:authorize access = "hasRole('ROLE_ADMIN')">
			<a class = "btn" href = "eventRegister" id = "writebtn">문화행사 등록</a>	
		</sec:authorize>
	</div>
</div>


<script>
$(document).ready(function(){
	$(".bclick").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시물을 불러올 수 없습니다.");
			}
		});
	});
	$("#writebtn").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#writebtn").attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시물 작성을 할 수 없습니다.");
			}
		});
	});
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 30, //총 페이지 수
		visiblePages: 7, //가시 페이지 수
		onPageClick : function(event, page) {
			console.info(page + ' (from options)');
			$(".page-link").on("click", function(event){ //클래스page-link는 BS4의 pagination의 링크 a
				event.preventDefault();
				let peo = $(event.target);
				let pageNo = peo.text();
				let eurl;
				let pageA;
				let pageNo1;
				let pageNo2;
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					eurl = "ePlist?pageNo=" + pageNo;
				} else if (pageNo == "Next") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수 변환해줌
					pageNo2 = pageNo1 + 1;
					eurl = "ePlist?pageNo=" + pageNo2;
				} else if (pageNo == "Previous") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1 빼야 하므로 정수 변환해줌
					pageNo2 = pageNo1 - 1;
					eurl = "ePlist?pageNo=" + pageNo2;
				} else if (pageNo == "First") {
					eurl = "ePlist?pageNo=" + 1;
				} else if (pageNo == "Last"){
					eurl = "ePlist?pageNo=" + 30;
				} else {
					return;
				}
				$.ajax({
					url : eurl,
					type : "get",
					data : "",
					success : function(data) {
						$("#tablediv").html(data);
						let parent = peo.parent(); //page-link의 부모인 page-item에 추가
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
					// 검색 기능 구현
	$("#searchform").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "searchEvent",
			type : "get",
			data : $("#searchform").serialize(),
			success : function(result){
				$("#eventtable tbody").empty();
				console.log(Array.isArray(result));		// 제대로 배열화 되어있음
				if(result.length >= 1) {
					console.log("우선 if문은 만족함.");
					result.forEach(function(item){
						console.log("함수도 잘됨.");
						str = "<tr>";
						str += '<td>' + item.eId + '</td>';
						str += '<td>' + item.eGroup + '</td>';							
						str += '<td><a href = "eContentView?eId=' + item.eId + '" class = "bclick">'
								+ item.eTitle + '</a></td>';
						str += '<td>' + item.eWriteDate + '</td>';
						str += "</tr>";
						$("#etbody").append(str);					
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