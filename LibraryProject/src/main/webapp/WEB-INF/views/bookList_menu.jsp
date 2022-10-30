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
<style>
#menu_search, #menu_newList, #menu_recList, #menu_bestsellerList {
	color : black;
	font-weight : bold;
	font-size : 15px;
	text-decoration : none;
}
</style>
</head>
<body>

<h4 style="text-align:center;font-weight:bold;" class="mt-3">도서 자료</h4>
<hr style="border:1px solid black;"/>
<table class="table table-borderless table-hover" id="left-menu">
	<tbody>
		<tr id="tr0">
			<td>
				<a href="search" id="menu_search">도서 검색<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr1">
			<td>
				<a href="newList" id="menu_newList">신간 도서<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr2">
			<td>
				<a href="recList" id="menu_recList">추천 도서<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
		<tr id="tr3">
			<td>
				<a href="bestsellerList" id="menu_bestsellerList">베스트셀러<i class="fas fa-angle-right" style="float:right;"></i></a>
			</td>
		</tr>
	</tbody>
</table>

<script>
$(document).ready(function(){
	$("#menu_search").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#menu_search").attr("href"),
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
	$("#menu_recList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#menu_recList").attr("href"),
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
	$("#menu_newList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#menu_newList").attr("href"),
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
	$("#menu_bestsellerList").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#menu_bestsellerList").attr("href"),
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
	$("#tr0").mouseover(function(){
		$("#menu_search").css("color", "#8dab9f");	
	});
	$("#tr0").mouseout(function(){
		$("#menu_search").css("color", "black");	
	});	
	$("#tr1").mouseover(function(){
		$("#menu_newList").css("color", "#8dab9f");	
	});
	$("#tr1").mouseout(function(){
		$("#menu_newList").css("color", "black");	
	});	
	$("#tr2").mouseover(function(){
		$("#menu_recList").css("color", "#8dab9f");	
	});
	$("#tr2").mouseout(function(){
		$("#menu_recList").css("color", "black");	
	});
	$("#tr3").mouseover(function(){
		$("#menu_bestsellerList").css("color", "#8dab9f");	
	});
	$("#tr3").mouseout(function(){
		$("#menu_bestsellerList").css("color", "black");	
	});
});
</script>
</body>
</html>