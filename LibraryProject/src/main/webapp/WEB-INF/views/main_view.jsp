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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>화곡도서관</title>
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
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
<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<link rel="stylesheet" href="assets/content-styles.css" type="text/css">

<style>
* {
	font-family: 'Gowun Batang', serif;
}
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}
.row div img {
	margin-left :  auto;
	margin-right : auto;
	display : block;
}
#icon .row div span {
	text-align : center;
	display : block;
	font-weight : bold;
}
#search2, #class2, #qnaList1, #application1, #map1 {
	color : black;
	text-decoration : none;
}
#book a {
	color : black;
	text-decoration : none;
}
#book span {
	display:block;
	text-align:center;
}
#book img {
	height:300px;
}
#login a {
	color : white;
	float : right;
	padding-left : 10px;
	padding-top : 5px;
}
#top-menu li {
	color : white;
	font-weight : bold;
	display : inline-block;
	margin-left : 40px;
	margin-right : 40px;
}
#top-menu a {
	color : white;
	font-weight : bold;
}
#top-menu {
	position : -webkit-sticky;
 	position : sticky;
 	top : 0;
	z-index : 1050;
	margin : 0 auto;
	left : 0;
	right : 0;
}
#notice4list a{
	color : #527062;
}
</style>
</head>
<body id="body">

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<!-- top 메뉴 -->
<nav id="login" class="container-fluid" style="height:30px; background-color:#3f3f48;">
	<div class="container">
		<span class="ml-auto mb-auto mr-3">
			<sec:authorize access="isAnonymous()">
				<a href="login_view" id="login_view"><i class="fas fa-sign-in-alt"></i>&nbsp;로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="logout_view" id="logout_view"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</a>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<a href="join_view" id="join_view"><i class="fas fa-user-plus"></i>&nbsp;회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="update_view" id="update_view"><i class="fas fa-edit"></i>&nbsp;정보수정</a>
			</sec:authorize>
			<!-- 비밀번호 변경 페이지 이동 -->
			<sec:authorize access="isAuthenticated()">
				<a href="updatePw_view" id="updatePw_view"></a>
			</sec:authorize>
		</span>
	</div>
</nav>

<!-- 로고, 검색창 -->
<div class="container mt-3" id="top">
	<div class="row">
		<div class="col-3 d-flex">
			<div style="display:inline-block; text-align:left;" class="align-self-center">
				<a href="home" id="home_logo">
					<img src="media/도서관로고.png" alt="logo" style="width:100%;"/>
				</a>
			</div>
		</div>
		
		<div class="col-6 d-flex">	
			<div style="display:inline-block; text-align:center; width:100%; border:4px solid #527062;" class="align-self-center">
				<form action = "#" id = "mainsearch">
					<div class="input-group input-group-lg" style="width:100%;">
						<input type="text" class="form-control" id = "keyword" name = "mainkeyword" value = "" style="border:none" placeholder="검색"/>
						<div class="input-group-append">
							<button class="btn" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="col-3 d-flex">
			<div style="display:inline-block;" class="align-self-center">
				<div class="card" style="height:50%;">
					<div class="row">
						<div class="col-3">
							<sec:authorize access="isAnonymous()">
								<img src="media/usericon.png" class="rounded-circle mt-3 ml-3" style="width:150%;"/>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
								<img src="media/usericon.png" class="rounded-circle mt-4 ml-3" style="width:150%;"/>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<img src="media/adminicon.png" class="rounded-circle mt-4 ml-3" style="width:150%;"/>
							</sec:authorize>
						</div>
						<div class="col-9">
							<div class="card-body clearfix">
								<p class="card-text text-left">
									<sec:authorize access="isAnonymous()">
										로그인 후 이용 가능<br/>
										<a href="myInterest" id="myInterest1" class="badge badge-warning mt-2" style="color:white;float:right;font-size:14px;"><i class="fa fa-heart"></i>&nbsp;관심도서</a>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										${user_id}님 <br/>환영합니다.
										<sec:authorize access="hasRole('ROLE_USER')">
										<a href="myInterest" id="myInterest2" class="badge badge-warning mt-2" style="color:white;float:right;font-size:14px;"><i class="fa fa-heart"></i>&nbsp;관심도서</a>
										</sec:authorize>
									</sec:authorize>
									<br/>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<a id="admin_view" href="admin_view" class="badge badge-primary mt-2" style="color:white;float:right;font-size:14px;"><i class="fas fa-cog"></i>&nbsp;관리자 페이지</a>
									</sec:authorize>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 탑메뉴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef8ea6f0c9ca1723e5955147346c8a39"></script>
<nav id="top-menu" class="navbar navbar-expand-lg navbar-dark container mt-3" style="background-color:#527062;z-index:800; border-radius:10px 10px">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#t-toggle">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="justify-content-center collapse navbar-collapse" id="t-toggle">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link" data-toggle="dropdown" href="introduction" id="introduction1">도서관안내</a>
				<div class="nmenu dropdown-menu mt-0" id="introduction_menu">
					<a class="dropdown-item" style="color:#527062;" href="introduction" id="introduction2">도서관소개</a>
					<a class="dropdown-item" style="color:#527062;" href="map" id="map2">오시는길</a>
					<a class="dropdown-item" style="color:#527062;" href="libCalendar" id="libCalendar">도서관일정</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="search" id="search1">도서자료</a>
				<div class="nmenu dropdown-menu mt-0" id="search_menu">
					<a class="dropdown-item" style="color:#527062;" href="search" id="search3">도서검색</a>
					<a class="dropdown-item" style="color:#527062;" href="newList" id="newList1">신간도서</a>
					<a class="dropdown-item" style="color:#527062;" href="recList" id="recList1">추천도서</a>
					<a class="dropdown-item" style="color:#527062;" href="bestsellerList" id="bestsellerList1">베스트셀러</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="nList" id="notice1">열린공간</a>
				<div class="nmenu dropdown-menu mt-0" id="notice_menu">
					<a class="dropdown-item" style="color:#527062;" href="nList" id="notice2">공지사항</a>
					<a class="dropdown-item" style="color:#527062;" href="qnaList" id="qnaList2">QnA</a>
					<a class="dropdown-item" style="color:#527062;" href="application" id="application2">희망도서 신청</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="cList" id="class1">문화공간</a>
				<div class="nmenu dropdown-menu mt-0" id="class_menu">
					<a class="dropdown-item" style="color:#527062;" href="cList" id="class1-2">문화·강좌</a>
					<a class="dropdown-item" style="color:#527062;" href="eventList" id="class1-1">문화·행사</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="myPage" id="myPage">마이페이지</a>
				<div class="nmenu dropdown-menu mt-0" id="my_menu">
					<a class="dropdown-item" style="color:#527062;" href="borrowlist" id="borrowlist">대출·반납</a>
					<a class="dropdown-item" style="color:#527062;" href="applist" id="applist">희망도서·예약</a>
					<a class="dropdown-item" style="color:#527062;" href="update_view" id="update_view2">정보수정</a>
				</div>
			</li>
		</ul>
	</div>
</nav>

<div id="mainRegion" class="container mb-3">
	<!-- 상단배너 -->
	<div class="container mt-3" id="top-banner">
		<img src="media/도서관메인배너.png" style="width:100%;" class="rounded"/>
	</div>

	<!-- 메뉴 아이콘 -->
	<div class="container-xl mt-3 mb-3 pt-3 pb-3 rounded" id="icon" style="border-top:2px solid #dbcfc8; border-bottom:2px solid #dbcfc8;">
		<div class="row">
			<div class="col-1" style="background:#dbcfc8;border-radius:20px 40px;"></div>
			<div class="col-2">
				<img src="media/자료검색.png" alt="자료검색" style="width:70px; height:70px; text-align:center;"/>
				<span>
					<a href="search" id="search2" class="stretched-link">자료 검색</a>
				</span>
			</div>
			<div class="col-2">
				<img src="media/예약.png" alt="자료예약" style="width:70px; height:70px;"/>
				<span>
					<a href="eventList" id="class2" class="stretched-link">문화 행사</a>
				</span>
			</div>
			<div class="col-2">
				<img src="media/게시판.png" alt="문의사항" style="width:70px; height:70px;"/>
				<span>
					<a href="qnaList" id="qnaList1" class="stretched-link">문의사항</a>
				</span>
			</div>
			<div class="col-2">
				<img src="media/희망도서신청.png" alt="시설" style="width:70px; height:70px;"/>
				<span>
					<a href="application" id="application1" class="stretched-link">희망도서 신청</a>
				</span>
			</div>
			<div class="col-2">
				<img src="media/오시는길.png" alt="오시는길" style="width:70px; height:70px;"/>
				<span>
					<a href="map" id="map1" class="stretched-link">오시는길</a>
				</span>
			</div>
			<div class="col-1" style="background:#dbcfc8;border-radius:40px 20px;"></div>
		</div>
	</div>
	
	<!-- 책 추천 -->
	<div class="container mt-3 mb-3 p-2" id="book" style="height:500px;">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a href="#book1" class="nav-link active" data-toggle="tab">신간 도서</a>
			</li>
			<li class="nav-item">
				<a href="#book2" class="nav-link" data-toggle="tab">추천 도서</a>
			</li>
			<li class="nav-item">
				<a href="#book3" class="nav-link" data-toggle="tab">베스트셀러</a>
			</li>
		</ul>
	
		<!-- 책 -->
		<div class="tab-content">
		<!-- 신간도서 -->
			<div id="book1" class="container tab-pane active mt-5 mb-5">
				<div class="row">
					<c:forEach items="${bookList4}" var="dto">
						<div class="col-3">
							<img src="upimage/${dto.img}" style="text-align:center; width:80%;"/>
							<div class="text-center mt-2">
								<a href="content_view?bookId=${dto.bookId}" class="bclick2 stretched-link">${dto.bookTitle}</a>
							</div>
						</div>
					</c:forEach>	
				</div>
				<div align="right">
					<a href="newList" id="newList2"><i class="fa fa-plus" title="더보기"></i>&nbsp;더보기</a>
				</div>
			</div>
		<!-- 추천도서 -->
			<div id="book2" class="container tab-pane mt-5 mb-5">
				<div class="row">
					<c:forEach items="${recBookList4}" var="dto">
						<div class="col-3">
							<img src="upimage/${dto.img}" style="text-align:center; width:80%;"/>
							<div class="text-center mt-2">
								<a href="content_view?bookId=${dto.bookId}" class="bclick2 stretched-link">${dto.bookTitle}</a>
							</div>
						</div>
					</c:forEach>	
				</div>
				<div align="right">
					<a href="recList" id = "recList2"><i class="fa fa-plus" title="더보기"></i>&nbsp;더보기</a>
				</div>
			</div>
		<!-- 베스트셀러 -->
			<div id="book3" class="container tab-pane mt-5 mb-5">
				<div class="row">
					<c:forEach items="${bestBookList4}" var="dto">
						<div class="col-3">
							<img src="upimage/${dto.img}" style="text-align:center; width:80%;"/>
							<div class="text-center mt-2">
								<a href="content_view?bookId=${dto.bookId}" class="bclick2 stretched-link">${dto.bookTitle}</a>
							</div>
						</div>
					</c:forEach>	
				</div>
				<div align="right">
					<a href="bestsellerList" id = "bestsellerList2"><i class="fa fa-plus" title="더보기"></i>&nbsp;더보기</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 배너, 공지 -->
	<div class="container mt-3" id="event-banner">
		<div class="row">
			<div class="col-md-3" style="padding:0px 5px 0px 0px;">
				<div style="width:100%; height:154px; overflow:auto;">
					<h6 style="font-weight:bold; display:inline;">공지사항</h6>
					<a href="nList" id="notice3" style="color:black" class="text-decoration-none">
						<i style="float:right" class="fa fa-plus mr-3 mt-1" title="더보기"></i>
					</a>
					<hr/>
					<c:forEach items = "${noticeList4}" var = "dto">
						<div id = "notice4list">
							<a href = "nContentView?nId=${dto.nId}" class="n4">${dto.nTitle}</a>
						</div>
					</c:forEach>				
				</div>
			</div>
			<div class="col-md-9" style="padding:0px 0px 0px 5px;">
				<div class="carousel">
					<div id="event" class="carousel slide" data-ride="carousel">
						<ul class="carousel-indicators">
							<li data-target="#event" data-slide-to="0" class="active"></li>
							<li data-target="#event" data-slide-to="1"></li>
							<li data-target="#event" data-slide-to="2"></li>
						</ul>
						
						<div class="carousel-inner">
							<c:forEach items="${eventList3}" var="dto" varStatus="status">
								<c:if test="${status.count eq 1}">
									<div class="carousel-item active">
										<a href="eContentView?eId=${dto.eId}" id="eclick1">
											<img src="upclass/${dto.ePhoto}" class="w-100 h-100"/>
										</a>
									</div>	
								</c:if>
								<c:if test="${status.count eq 2}">
								<div class="carousel-item">
									<a href="eContentView?eId=${dto.eId}" id="eclick2">
										<img src="upclass/${dto.ePhoto}" class="w-100 h-100"/>
									</a>
								</div>	
								</c:if>
								<c:if test="${status.count eq 3}">
								<div class="carousel-item">
									<a href="eContentView?eId=${dto.eId}" id="eclick3">
										<img src="upclass/${dto.ePhoto}" class="w-100 h-100"/>
									</a>
								</div>	
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<footer class="container-fluid mt-5" style="height:200px; background-color:#d7d8df;">
	<div class="container pt-3" style="color:#3f3f48; background-color:#d7d8df;">
		<div class=row>
			<div class="col-3">
				<span>이용시간</span><br/>
				<hr style="background-color:#3f3f48;"/>
				<span>평일 9:00 ~ 20:00</span><br/>	
				<span>주말,공휴일 10:00 ~ 18:00</span>
			</div>
			<div class="col-9">
			
			</div>
		</div>	
	</div>
</footer>

<script>
$(document).ready(function(){
	let userId = '<c:out value="${user_id}"/>';
	
	$("#introduction1").on({
		mouseover: function() {
			$("#introduction_menu").css("display", "block");
		},
		mouseout: function() {
			$("#introduction_menu").css("display", "none");
		}
	});
	$("#introduction_menu").on({
		mouseover: function() {
			$("#introduction_menu").css("display", "block");
		},
		mouseout: function() {
			$("#introduction_menu").css("display", "none");
		}
	});
	
	$("#search1").on({
		mouseover: function() {
			$("#search_menu").css("display", "block");
		},
		mouseout: function() {
			$("#search_menu").css("display", "none");
		}
	});
	$("#search_menu").on({
		mouseover: function() {
			$("#search_menu").css("display", "block");
		},
		mouseout: function() {
			$("#search_menu").css("display", "none");
		}
	});
	
	$("#notice1").on({
		mouseover: function() {
			$("#notice_menu").css("display", "block");
		},
		mouseout: function() {
			$("#notice_menu").css("display", "none");
		}
	});
	$("#notice_menu").on({
		mouseover: function() {
			$("#notice_menu").css("display", "block");
		},
		mouseout: function() {
			$("#notice_menu").css("display", "none");
		}
	});	
	
	$("#class1").on({
		mouseover: function() {
			$("#class_menu").css("display", "block");
		},
		mouseout: function() {
			$("#class_menu").css("display", "none");
		}
	});
	$("#class_menu").on({
		mouseover: function() {
			$("#class_menu").css("display", "block");
		},
		mouseout: function() {
			$("#class_menu").css("display", "none");
		}
	});
	
	$("#myPage").on({
		mouseover: function() {
			$("#my_menu").css("display", "block");
		},
		mouseout: function() {
			$("#my_menu").css("display", "none");
		}
	});
	$("#my_menu").on({
		mouseover: function() {
			$("#my_menu").css("display", "block");
		},
		mouseout: function() {
			$("#my_menu").css("display", "none");
		}
	});
	
	$("#introduction1, #search1, #notice1, #class1, #myPage").mouseover(function(){
		$(this).css("color","#dbcfc8");
	});
	$("#introduction1, #search1, #notice1, #class1, #myPage").mouseout(function(){
		$(this).css("color","white");
	});
	$("#search2, #class2, #qnaList1, #application1, #map1").mouseover(function(){
		$(this).css("color","#527062");
	});
	$("#search2, #class2, #qnaList1, #application1, #map1").mouseout(function(){
		$(this).css("color","black");
	});
	$("#join_view").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#join_view").attr("href"),
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
	$("#update_view, #update_view2").click(function(event){
		event.preventDefault();
		if(userId != "") {
			$.ajax({
				url : $("#update_view").attr("href"),
				type : "GET",
				data : "",
				success : function(data){ 
					$("#mainRegion").html(data);
				},
				error : function(){ 
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
	$("#home_logo").click(function(event){
		event.preventDefault();
		$("#home_logo").click(function(event){
			event.preventDefault();
			$.ajax({
				url : $("#home_logo").attr("href"),
				type : "GET",
				data : "",
				success : function(data){ 
					location.href = "main";
				},
				error : function(){ 
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		});
	});
	$("#search1, #search2, #search3").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#search1").attr("href"),
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
	$("#introduction1,#introduction2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#introduction1").attr("href"),
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
	$("#application1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#application1").attr("href"),
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
	$("#application2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#application2").attr("href"),
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
	$("#qnaList1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#qnaList1").attr("href"),
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
	$("#qnaList2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#qnaList2").attr("href"),
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
	$("#notice1, #notice2, #notice3").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#notice1").attr("href"),
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
	$("#newList1, #newList2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#newList1").attr("href"),
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
	$("#class1, #class1-2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class1").attr("href"),
			type : "GET",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("강좌 목록을 불러올 수 없습니다.");
			}
		});
	}); 
	$("#class1-1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class1-1").attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("행사 목록을 불러올 수 없습니다.");
			}
		});
	});
	$("#myPage").click(function(event){
		event.preventDefault();
		if(userId != "") {
			$.ajax({
				url : $("#myPage").attr("href"),
				type : "GET",
				data : "",
				success : function(data){ 
					$("#mainRegion").html(data);
				},
				error : function(){ 
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
	$(".bclick2").click(function(event){
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
	$("#recList1, #recList2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#recList1").attr("href"),
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
	$("#admin_view").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_view").attr("href"),
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
	$("#map1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#map1").attr("href"),
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
	$("#map2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#map2").attr("href"),
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
	$("#bestsellerList1, #bestsellerList2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#bestsellerList1").attr("href"),
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
	$(".n4").click(function(event){
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
	$("#class2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class2").attr("href"),
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
	$("#myInterest1, #myInterest2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : "myInterest",
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
	$("#applist").click(function(event){
		event.preventDefault();
		if(userId != "") {
			$.ajax({
				url : $("#applist").attr("href"),
				type : "GET",
				data : "",
				success : function(data){
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
	$("#borrowlist").click(function(event){
		event.preventDefault();
		if(userId != "") {
			$.ajax({
				url : $("#borrowlist").attr("href"),
				type : "GET",
				data : "",
				success : function(data){
					$("#mainRegion").html(data);
				},
				error : function(){
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			alert("로그인 후 이용 가능합니다.");
		}
	});
	// 검색 메인 구현
	$("#mainsearch").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "searchtop",
			type : "get",
			data : $("#mainsearch").serialize(),
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("검색에 실패했습니다.");
			}
		});
	});
	//행사배너
	$("#eclick1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#eclick1").attr("href"),
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
	$("#eclick2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#eclick2").attr("href"),
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
	$("#eclick3").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#eclick3").attr("href"),
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