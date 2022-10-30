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

<div class="container mt-5" id="book-main">
	<div class="row">
		<div class="col-2 border border-dark;">
			<jsp:include page="admin_menu.jsp" flush="false"/>
		</div>
		<div class="col-10" style="width:100%;">
			<h3 style="color:#527062;"><i class="fa fa-book"></i>&nbsp;<b>도서정보수정</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
				<span style="color:#527062;"><b>도서정보수정 및 소장등록</b></span><br/>
				<span style="font-size:14px;">
					기존에 등록한 도서의 정보를 수정하시려면 해당 내용을 변경 후 하단의 정보 수정 버튼을 클릭하여 주십시오.<br/>
					해당 도서가 추가될 경우 소장 등록을 해주십시오. 
				</span>
			</p>
			<div align="right" class="mt-5">
				<a class="btn mb-2" href="possession?bookId=${content_view.bookId}" id="possession" style="display:inline-block; background-color:#527062; color:white;">
					<i class="fas fa-book-reader"></i>&nbsp;소장등록 및 대출·반납
				</a>
			</div>
			<input type="hidden" id="recCheck" value="${content_view.recommend}"/>
			<input type="hidden" id="bestCheck" value="${content_view.bestseller}"/>
			<form action="bookModifyOK" method="post" id="bookModifyOK" name="bookModifyOK">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input value="${content_view.bookId}" type="hidden" name="bookId"/>
				<input value="${content_view.img}" type="hidden" name="img"/>
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<div class="row mt-3">
							<div class="col-4">
								<div class="form-group">
									<label for="img"><i class="far fa-bookmark"></i>&nbsp;책 이미지</label>
									<img src="upimage/${content_view.img}" style="width:100%;" class="border border-dark"/>
								</div>
								<br/>
								<label for="img"><i class="far fa-bookmark"></i>&nbsp;도서 분류</label>
								<div class="border border-secondary">
									<p class="text-justify p-3" style="background:#d7d8df;">해당 도서를 추천도서 또는 베스트셀러로 등록하는 경우 아래의 항목에서 선택 후 수정하십시오.</p>
									<div class="form-group ml-3">
										<label class="form-check-inline" for="recommend">
											<input type="checkbox" class="cb1 form-check-input" id="recommend" name="recommend" value="1"/>추천도서
										</label>
									</div>
									<div class="form-group ml-3 d-none">
										<label class="form-check-inline" for="recommend1">
											<input type="checkbox" class="cb1 form-check-input" id="recommend1" name="recommend" value="0"/>추천도서
										</label>
									</div>
									<div class="form-group ml-3">
										<label class="form-check-inline" for="bestseller">
											<input type="checkbox" class="cb2 form-check-input" id="bestseller" name="bestseller" value="1"/>베스트셀러
										</label>
									</div>
									<div class="form-group ml-3 d-none">
										<label class="form-check-inline" for="bestseller1">
											<input type="checkbox" class="cb2 form-check-input" id="bestseller1" name="bestseller" value="0"/>베스트셀러
										</label>
									</div>
								</div>
							</div>
							<div class="col-8">
								<div class="form-group">
									<label for="bookTitle"><i class="far fa-bookmark"></i>&nbsp;책 이름</label>
									<input type="text" class="form-control" value="${content_view.bookTitle}" id="bookTitle" name="bookTitle">
								</div>
								<div class="form-group">
									<label for="bookOriTitle"><i class="far fa-bookmark"></i>&nbsp;원서명</label>
									<input type="text" class="form-control" value="${content_view.bookOriTitle}" id="bookOriTitle" name="bookOriTitle">
								</div>
								<div class="form-group">
									<label for="writer"><i class="far fa-bookmark"></i>&nbsp;저자</label>
									<input type="text" class="form-control" value="${content_view.writer}" id="writer" name="writer">
								</div>
								<div class="form-group">
									<label for="publisher"><i class="far fa-bookmark"></i>&nbsp;출판사</label>
									<input type="text" class="form-control" value="${content_view.publisher}" id="publisher" name="publisher">
								</div>
								<div class="form-group">
									<label for="year"><i class="far fa-bookmark"></i>&nbsp;출판연도</label>
									<input type="text" class="form-control" value="${content_view.year}" id="year" name="year">
								</div>
								<div class="form-group">
									<label for="bookType"><i class="far fa-bookmark"></i>&nbsp;책 타입</label>
									<select class="form-control" id="bookType" name="bookType">
										<option value="일반자료">일반자료</option>
										<option value="학술자료">학술자료</option>
									</select>
								</div>
								<div class="form-group">
									<label for="genre"><i class="far fa-bookmark"></i>&nbsp;장르</label>
									<select class="form-control" id="genre" name="genre">
										<option value="경제/경영">경제/경영</option>
										<option value="문학">문학</option>
										<option value="정치/사회">정치/사회</option>
										<option value="역사/문화">역사/문화</option>
										<option value="예술/대중문화">예술/대중문화</option>
										<option value="과학">과학</option>
										<option value="자기계발">자기계발</option>
										<option value="컴퓨터/IT">컴퓨터/IT</option>
										<option value="요리">요리</option>
										<option value="청소년">청소년</option>
										<option value="유아/어린이">유아/어린이</option>
										<option value="만화">만화</option>
									</select>
								</div>
								<div class="form-group">
									<label for="bookForm"><i class="far fa-bookmark"></i>&nbsp;책 형태</label>
									<input type="text" class="form-control" value="${content_view.form}" id="bookForm" name="form">
								</div>
								<div class="form-group">
									<label for="isbn"><i class="far fa-bookmark"></i>&nbsp;ISBN</label>
									<input type="text" class="form-control" value="${content_view.isbn}" id="isbn" name="isbn">
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;책소개</span>
				<table class="table" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df; table-layout:fixed;">
					<tbody>
						<tr>
							<td>
								<p style="white-space:pre-line;">
									<textarea style="width:100%;" class="form-control" rows="8" id="bookintro" name="bookContent">${content_view.bookContent}</textarea>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				
				<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;저자 소개</span>
				<table class="table" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
					<tbody>
						<tr>
							<td>
								<p style="white-space:pre;">
									<textarea style="width:100%;" class="form-control" rows="5" id="bookWriter" name="bookWriter">${content_view.bookWriter}</textarea>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				
				<span style="display:block; color:#527062; font-weight:bold;" class="mt-5"><i class="fa fa-bookmark"></i>&nbsp;목차</span>
				<table class="table" style="border-top:1px solid #d7d8df; border-bottom:1px solid #d7d8df;">
					<tbody>
						<tr>
							<td>
								<p style="white-space:pre;">
									<textarea style="width:100%;" class="form-control" rows="8" id="bookindex" name="bookIndex">${content_view.bookIndex}</textarea>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="float:right;">
					<button id="modiOK" type="submit" class="btn btn-primary" style="background-color:#527062; color:white;"><i class="fas fa-pen"></i>&nbsp;정보 수정</button>
					<a class="btn btn-danger" style="color:white;" href="admin_book" id="admin_book1"><i class="fas fa-backspace"></i>&nbsp;취소</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#modiOK").click(function(event){
		if(confirm("도서 정보를 수정하시겠습니까?") == true) {
			console.log("수정");
			$("#bookModifyOK").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "bookModifyOK",
					type : $("#bookModifyOK").attr("method"),
					data : $("#bookModifyOK").serialize(),
					success : function(data) {
						alert("도서 정보 수정이 완료되었습니다. 페이지를 이동합니다.");
						$("#mainRegion").html(data);
					},
					error : function() {
						alert("서버 접속 실패. 다시 시도해주세요.");
					}
				});
			});
		}
	});
	$("#admin_book1").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#admin_book1").attr("href"),
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
	$("#possession").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#possession").attr("href"),
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
	
	if($("#recCheck").attr("value") == 1) {
		$("#recommend").attr("checked", true);
	}
	else {
		$("#recommend1").attr("checked", true);
	}
	
	if($("#bestCheck").attr("value") == 1) {
		$("#bestseller").attr("checked", true);
	}
	else {
		$("#bestseller1").attr("checked", true);
	}
	
	$("#recommend").change(function(){
        if($("#recommend").is(":checked")) {
        	$(".cb1").not(this).prop("checked", false);
        }
        else {
        	$(".cb1").not(this).prop("checked", true);
        }
    });
	
	$("#bestseller").change(function(){
        if($("#bestseller").is(":checked")) {
        	$(".cb2").not(this).prop("checked", false);
        }
        else {
        	$(".cb2").not(this).prop("checked", true);
        }
    });
	
});
</script>
</body>
</html>