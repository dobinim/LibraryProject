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

<style>
#enrollbtn {
	float : right;
}
</style>
<title>공지사항 등록</title>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
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
#enrollbtn {
	background-color : #527062;
	color : white;
}
#noticelist {
	background-color : #3f3f48;
	color : white;
}
</style>

</head>
<body>

<sec:authorize access = "isAuthenticated()">
	<sec:authentication property = "principal.username" var = "user_id" />
</sec:authorize>

<div class = "container mb-3" id = "maindiv">
	<div class="container mt-3 p-3">
		<div class="row">
			<div class="col-2 border">
				<jsp:include page="noticeboard_menu.jsp" flush="false"/>
			</div>
			<div class="col-10">
				<div>
					<h4 style = "font-weight:bold;text-align:center;">공지사항 등록</h4>
					<br/>	
					<form action = "writeNotice" id = "fWrite" method = "post">
						<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
						<div class = "form-group">
							<label for = "writer">작성자</label>
							<input class = "form-control" type = "text" id = "writer" name = "nWriter" style = "width:100%;" value = "${user_id}" readonly>
						</div>
						<div class = "form-group">
							<label for = "title">제목</label>
							<input class="form-control" type="text" id="title" name="nTitle" placeholder="공지사항 제목" style="width:100%;">
						</div>
						<div class = "form-group d-none">
							<label for = "content">내용</label>
							<textarea class = "form-control ck-content" id = "content" name = "nContent"></textarea>
						</div>
						<input id = "editSub" type = "submit" value = "nCkedit" style = "visibility:hidden;">
					</form>
					<div id = "toolbar-container" style = "max-width:100%"></div>
					<div id = "ckeditor" class = "ck-content" style = "max-width:100%;min-height:400px;border:1px solid grey;line-height:0.8rem"></div>
					<br/><br/>
					<button onclick = "myFunction()" class = "btn f-right" id = "enrollbtn">전송</button>&nbsp;&nbsp;
					
<%-- 					<form action = "writeNotice?${_csrf.parameterName}=${_csrf.token}" method = "post" id="fWrite" enctype = "multipart/form-data">
						<div class="form-group">
							<label for="writer">작성자</label>
							<input class="form-control" type="text" id="writer" name="nWriter" style = "width:100%;" value = "${user_id}" readonly/>
						</div>
						<div class="form-group">
							<label for="title">제목</label>
							<input class="form-control" type="text" id="title" name="nTitle" placeholder="공지사항 제목" style="width:100%;"/>
						</div>
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" id="content" name="nContent" placeholder="이곳에 공지 내용을 입력하세요." rows="15" style="width:100%;"></textarea>
						</div>
						<div class = "form-group">
							<label for = "file">첨부파일</label>
							<input class = "form-control" type = "file" id = "file" name = "nFile" placeholder = "파일을 첨부하세요.">
						</div>
						<button type="submit" class="btn float-right" id = "enrollbtn">공지사항 등록</button>&nbsp;&nbsp;
						</form> --%>
					<a href = "nList" class = "btn" id = "noticelist">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<script>
$(document).ready(function(){
	$("#noticelist").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#noticelist").attr("href"),
			type : "get",
			data : "",
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("게시판으로 돌아갈 수 없습니다.");
			}
		});
	});
});
</script>
<!-- CK Editor의 decoupled editor를 사용하기 위한 script (classic/decoupled 두 가지 버전이 있음) -->
<script type="module">	
 DecoupledEditor
    .create( document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: {		// 이미지 처리 모듈
	   		uploadUrl: 'nCkedit' // 요청경로 : 이미지는 올라오자마자 바로 이 경로로 보내짐   		
	   	},
	   	toolbar: ['ckfinder', '|','imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','fontsize',
	   		'fontfamily','insertTable','alignment', '|', 'fontColor', 'fontBackgroundColor']			
    })       
    .then(function(editorD) {
    	//window.editorResize = editor;
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editorD.ui.view.toolbar.element );        
    });
</script>
<!-- 버튼 누를 때 작동되는 myFunction() 함수 -->
<script>
function myFunction(){
	// CKEditor 창에 작성된 내용을 html 형태로 textarea에 옮겨 서버로 보내준다 → 이미지는 이름, 경로를 문자열로 보냄
	$("#ckeditor svg").remove(); // CKEditor 창의 반환 시 검정 상각형을 제거 (svg때문에 생성되는 것)
	let content = $("#ckeditor").html();	// 편집창의 내용을 가져옴
	$("#content").html(content);		// textarea의 내용부에 작성
	setTimeout(function(){
		$("#editSub").trigger("click");
	}, 1000);
	$("#fWrite").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "writeNotice", // form의 action
			type : "post",
			data : $("#fWrite").serialize(),
			success : function(data){
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("공지사항 작성에 실패하였습니다.");
			}
		});
	});
}
</script>
</html>