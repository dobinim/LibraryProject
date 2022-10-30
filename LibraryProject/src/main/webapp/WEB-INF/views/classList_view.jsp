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

<title>강좌 목록 페이지</title>
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

#classcard {
	border : 1px solid #ececf0;
	height : 500px;
}

#cardimg {
	height : 300px;
	margin : 0px;
}

#cTitle {
	font-weight : bold;
	font-size : 20px;
	text-align : center;
	height : 50px;
}

#cPeriod, #cPeriod_en {
	font-size : 12px;
	margin : 0px;
}

#cTitle, #cPeriod, #cPeriod_en {
	margin : 0px;
} 

#writebtn {
	background-color : #527062;
	color : white;
	float : right;

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
}

#searchopt {
	height : 40px;
}

#searchform { 
	text-align : center;
	margin-top : 30px;
	margin-bottom : 30px;
}

</style>
</head>
<body>

<div class="container mt-3 mb-3 p-3" id = "maindiv">
	<div class="row mt-3">
		<div class="col-2 border">
			<jsp:include page="classboard_menu.jsp" flush="false"/>
		</div>
			<div class="col-10 mx-auto" id="submain">
				<h3 style="color:#527062;"><i class="fas fa-award"></i>&nbsp;<b>강좌 목록</b></h3>
				<hr/>
																				<!-- 검색창 -->
				<form action = "#" id = "searchform">
					<input type = "text" id = "searchbar" name = "keyword" value = "" placeholder = "검색어를 입력하세요.">
					<input type = "submit" id = "searchbtn" class = "btn text-center" value = "검색">
				</form>
			
																				<!-- 검색창 끝 -->
				<div id = "listmain">
					<div class = "row mb-3 mt-1 mx-auto" id = "listdiv">
						<c:forEach items = "${classList}" var = "dto">
							<div class = "col-md-4 mb-2" id = "classcard">
								<a href = "cContentView?cId=${dto.cId}" class = "pclick stretched-link" id = "cContentview">
									<img class = "card-img-top mt-1" src = "upclass/${dto.cPhoto}" id = "cardimg">
								</a>
								<div class = "card-body">
									<div id = "cTitle">
										${dto.cTitle}
									</div>
									<div id = "periods" class = "text-center mt-3">
										<p id = "cPeriod">● 강의 기간 : ${dto.cStart} ~ ${dto.cEnd}</p><br/>
										<p id = "cPeriod_en">● 접수 기간 : ${dto.cStartReg} ~ ${dto.cEndReg}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<sec:authorize access = "hasRole('ROLE_ADMIN')">
					<a class = "btn" href = "cWrite" id = "writebtn">강의 등록</a>
				</sec:authorize>
				<!-- 페이지 표시 -->
				<nav aria-label = "Page navigation" id = "pagnav">
					<ul class = "pagination justify-content-center mx-auto" id = "pagination"></ul>
				</nav>
			</div>
	</div>
</div>


<script>
$(document).ready(function(){
	$(".pclick").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success : function(data){
				console.log("제대로 불러왔습니다.");
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시물을 불러올 수 없습니다.");
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
				let curl;
				let pageA;
				let pageNo1;
				let pageNo2;
				
				if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
					curl = "cPlist?pageNo=" + pageNo;
				} else if (pageNo == "Next") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수 변환해줌
					pageNo2 = pageNo1 + 1;
					curl = "cPlist?pageNo=" + pageNo2;
				} else if (pageNo == "Previous") {
					pageA = $("li.active > a"); // li에 active 클래스가 있고, a에 page 번호가 있음 
					pageNo = pageA.text();		// 페이지 번호
					pageNo1 = parseInt(pageNo); // 페이지 번호를 1 빼야 하므로 정수 변환해줌
					pageNo2 = pageNo1 - 1;
					curl = "cPlist?pageNo=" + pageNo2;
				} else if (pageNo == "First") {
					curl = "cPlist?pageNo=" + 1;
				} else if (pageNo == "Last"){
					curl = "cPlist?pageNo=" + 30;
				} else {
					return;
				}
				$.ajax({
					url : curl,
					type : "get",
					data : "",
					success : function(data) {
						$("#listmain").html(data);
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
												// 검색 기능
	$("#searchform").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "searchClass",
			type : "get",
			data : $("#searchform").serialize(),
			success : function(result){
				$("#listdiv").empty();
				if(result.length >= 1) {
					result.forEach(function(item){
						console.log("검색완료");
						str = '<div class = "col-md-4 mb-2" id = "classcard">';
						str += '<a href = "cContentView?cId=' + item.cId + '" class = "pclick stretched-link" id = "cContentview">';
						str += '<img class = "card-img-top mt-1" src = "upclass/' + item.cPhoto + '" id = "cardimg"></a>';
						str += '<div class = "card-body">';
						str += '<div id = "cTitle">' + item.cTitle + '</div>';
						str += '<div id = "periods" class = "text-center mt-3">';
						str += '<p id = "cPeriod">● 강의 기간 : ' + item.cStart + '~' + item.cEnd + '</p></br>';
						str += '<p id = "cPeriod_en">● 접수 기간 : ' + item.cStartReg + '~' + item.cEndReg + '</p></div></div>';
						str += "</div>";
						$("#listdiv").append(str);
					});
				}
			},
			error : function(){
				alert("검색 실패. 다시 시도하세요.");
			}
		});
	});
});
</script>
</body>
</html>