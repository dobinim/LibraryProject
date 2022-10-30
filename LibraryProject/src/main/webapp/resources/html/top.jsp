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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>JSP</title>
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
#search2, #link2, #qnaList1, #application1, #map1 {
	color : black;
	text-decoration : none;
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
				<a href="update_view" id="update_view1"><i class="fas fa-edit"></i>&nbsp;정보수정</a>
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
				<form action="#" id = "mainsearch">
					<div class="input-group input-group-lg" style="width:100%;">
						<input type="text" class="form-control" name = "mainkeyword" style="border:none" placeholder="검색"/>
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
				<div class="nmenu dropdown-menu" id="introduction_menu">
					<a class="dropdown-item" style="color:#527062;" href="introduction" id="introduction2">도서관소개</a>
					<a class="dropdown-item" style="color:#527062;" href="map" id="map2">오시는길</a>
					<a class="dropdown-item" style="color:#527062;" href="libCalendar" id="libCalendar">도서관일정</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="search" id="search1">도서자료</a>
				<div class="nmenu dropdown-menu" id="search_menu">
					<a class="dropdown-item" style="color:#527062;" href="search" id="search3">도서검색</a>
					<a class="dropdown-item" style="color:#527062;" href="newList" id="newList1">신간도서</a>
					<a class="dropdown-item" style="color:#527062;" href="recList" id="recList1">추천도서</a>
					<a class="dropdown-item" style="color:#527062;" href="bestsellerList" id="bestsellerList1">베스트셀러</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="nList" id="notice1">열린공간</a>
				<div class="nmenu dropdown-menu" id="notice_menu">
					<a class="dropdown-item" style="color:#527062;" href="nList" id="notice2">공지사항</a>
					<a class="dropdown-item" style="color:#527062;" href="qnaList" id="qnaList2">QnA</a>
					<a class="dropdown-item" style="color:#527062;" href="application" id="application2">희망도서 신청</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="cList" id="class1">문화공간</a>
				<div class="nmenu dropdown-menu" id="class_menu">
					<a class="dropdown-item" style="color:#527062;" href="cList" id="class1-2">문화·강좌</a>
					<a class="dropdown-item" style="color:#527062;" href="eventList" id="class1-1">문화·행사</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="myPage" id="myPage">마이페이지</a>
				<div class="nmenu dropdown-menu" id="my_menu">
					<a class="dropdown-item" style="color:#527062;" href="borrowlist" id="borrowlist">대출·반납</a>
					<a class="dropdown-item" style="color:#527062;" href="applist" id="applist">희망도서·예약</a>
					<a class="dropdown-item" style="color:#527062;" href="update_view" id="update_view2">정보수정</a>
				</div>
			</li>
		</ul>
	</div>
</nav>

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
	$("#search2, #link2, #qnaList1, #application1, #map1").mouseover(function(){
		$(this).css("color","#527062");
	});
	$("#search2, #link2, #qnaList1, #application1, #map1").mouseout(function(){
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
	$("#edit_info").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#edit_info").attr("href"),
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
	$("#home_logo").click(function(event){
		event.preventDefault();
		$("#home_logo").click(function(event){
			event.preventDefault();
			$.ajax({
				url : $("#home_logo").attr("href"),
				type : "GET",
				data : "",
				success : function(data){ 
					location.href="home";
				},
				error : function(){ 
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		});
	});
	$("#search1, #search3").click(function(event){
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
	$("#notice1, #notice2").click(function(event){
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
	$("#newList1").click(function(event){
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
	$("#class1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class1").attr("href"),
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
	$("#class1-1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class1-1").attr("href"),
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
	$("#class1-2").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#class1-2").attr("href"),
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
	$("#recList1").click(function(event){
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
	$("#bestsellerList1").click(function(event){
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
	$("#update_view1, #update_view2").click(function(event){
		event.preventDefault();
		if(userId != "") {
			$.ajax({
				url : $("#update_view1").attr("href"),
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
});
</script>
</body>
</html>