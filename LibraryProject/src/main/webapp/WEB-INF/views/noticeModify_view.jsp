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
<%@ taglib prefix = "sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>NotifeModify_view</title>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
#modifybtn {
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

<div class="container mt-3 p-3">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="noticeboard_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<div class = "mt-2">
				<h4 style = "font-weight:bold;text-align:center;">???????????? ??????</h4>
				<br/>
				<form action = "modifyN" method = "post" id="fModi">
					<input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type = "hidden" value = "${nContentView.nId}" name = "nId">
					<div class="form-group">
						<label for="writer">?????????</label>
						<input class="form-control" type="text" id="writer" name="nWriter" style = "width:100%;" value = "${nContentView.nWriter}" readonly/>
					</div>
					<div class="form-group">
						<label for="title">??????</label>
						<input class="form-control" type="text" id="title" name="nTitle" value ="${nContentView.nTitle}" style="width:100%;"/>
					</div>
					<div class="form-group d-none">
						<label for="content">??????</label>
						<textarea class="form-control ck-content" id="content" name="nContent" rows="15" style="width:100%;"></textarea>
					</div>
					<input id = "editSub" type = "submit" value = "nCkedit" style = "visibility:hidden;">
				</form>
				<div id="toolbar-container" style="max-width:100%"></div>
				<div id="ckeditor" class="ck-content" style="max-width:100%;min-height:400px;border:1px solid grey;line-height:0.8rem"></div>
				<button onclick = "myFunction2()" id="modifybtn" class="btn">??????</button> 
				<a href = "nList" class = "btn" id = "noticelist">??????</a>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#ckeditor").html('${nContentView.nContent}');
	$("#noticelist").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#noticelist").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("???????????? ????????? ??? ????????????.");
			}
		});
	});
});
</script>
<!-- CK Editor??? decoupled editor??? ???????????? ?????? script (classic/decoupled ??? ?????? ????????? ??????) -->
<script type="module">	
 DecoupledEditor
    .create( document.querySelector('#ckeditor'),{    	    	
    	language: 'ko',	       	    	
    	ckfinder: {		// ????????? ?????? ??????
	   		uploadUrl: 'nCkedit' // ???????????? : ???????????? ?????????????????? ?????? ??? ????????? ?????????   		
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
<script>
function myFunction2(){
	$("#ckeditor svg").remove();
	let content = $("#ckeditor").html();
	$("#content").html(content);		// textarea??? ???????????? ??????
	setTimeout(function(){
		$("#editSub").trigger("click");
	}, 1000);
	$("#fModi").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : "modifyN",
			type :"post",
			data : $("#fModi").serialize(),
			success : function(data){
				alert("??????????????? ??????????????? ?????????????????????.");
				$("#mainRegion").html(data);
			},
			error : function(){
				alert("???????????? ????????? ?????????????????????.");
			}
		});
	});
}
</script>
</body>
</html>