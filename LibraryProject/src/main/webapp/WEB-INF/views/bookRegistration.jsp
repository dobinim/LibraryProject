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
<title>도서등록</title>
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
		<div class="col-10">
			<h3 style="color:#527062;"><i class="fa fa-book"></i>&nbsp;<b>도서 등록</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5 mb-5">
				<span style="color:#527062;"><b>도서등록</b></span><br/>
				<span style="font-size:14px;">
					도서관 소장 목록에 갱신될 도서 등록 페이지입니다.<br/>
					누락 없이 정확하게 기입해 주십시오.
				</span>
			</p>
			<form action="bookRegistrationOK?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<div class="row">
							<div class="col-4">
								<div class="form-group border border-secondary p-3" style="height:300px;">
									<label for="img"><i class="far fa-bookmark"></i>&nbsp;책 이미지</label>
									<input type="file" class="form-control-file" id="img" name="img">
								</div>
							</div>
							<div class="col-8">
								<div class="form-group">
									<label for="bookTitle"><i class="far fa-bookmark"></i>&nbsp;책 이름</label>
									<input type="text" class="form-control col-10" placeholder="책 이름을 입력하세요" id="bookTitle" name="bookTitle">
								</div>
								<div class="form-group">
									<label for="bookOriTitle"><i class="far fa-bookmark"></i>&nbsp;원서명</label>
									<input type="text" class="form-control col-10" placeholder="원서 이름을 입력하세요" id="bookOriTitle" name="bookOriTitle">
								</div>
								<div class="form-group">
									<label for="writer"><i class="far fa-bookmark"></i>&nbsp;저자</label>
									<input type="text" class="form-control col-10" placeholder="저자를 입력하세요" id="writer" name="writer">
								</div>
								<div class="form-group">
									<label for="publisher"><i class="far fa-bookmark"></i>&nbsp;출판사</label>
									<input type="text" class="form-control col-10" placeholder="출판사를 입력하세요" id="publisher" name="publisher">
								</div>
								<div class="form-group">
									<label for="year"><i class="far fa-bookmark"></i>&nbsp;출판연도</label>
									<input type="text" class="form-control col-10" placeholder="출판연도를 입력하세요" id="year" name="year">
								</div>
								<div class="form-group">
									<label for="bookType"><i class="far fa-bookmark"></i>&nbsp;책 타입</label>
									<select class="form-control col-10" id="bookType" name="bookType">
										<option value="일반자료">일반자료</option>
										<option value="학술자료">학술자료</option>
									</select>
								</div>
								<div class="form-group">
									<label for="genre"><i class="far fa-bookmark"></i>&nbsp;장르</label>
									<select class="form-control col-10" id="genre" name="genre">
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
									<input type="text" class="form-control col-10" placeholder="ex)400p; 20cm" id="bookForm" name="form">
								</div>
								<div class="form-group">
									<label for="isbn"><i class="far fa-bookmark"></i>&nbsp;ISBN</label>
									<input type="text" class="form-control col-10" placeholder="ISBN을 입력하세요" id="isbn" name="isbn">
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
									<textarea style="width:100%;" class="form-control" rows="8" id="bookintro" placeholder="책소개를 입력하세요" name="bookContent"></textarea>
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
									<textarea style="width:100%;" class="form-control" rows="5" id="bookWriter" placeholder="저자와 역자를 입력하세요" name="bookWriter"></textarea>
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
									<textarea style="width:100%;" class="form-control" rows="8" id="bookindex" placeholder="목차를 입력하세요" name="bookIndex"></textarea>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="float:right;">
					<button id="RegiBtn" type="submit" class="btn btn-primary" style="background:#527062;"><i class="fas fa-pen"></i>&nbsp;도서 등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>