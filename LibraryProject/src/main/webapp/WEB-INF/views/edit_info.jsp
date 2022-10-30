<%@page import="org.springframework.security.core.userdetails.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<style>
div td {
	text-align : center;
}
</style>
<body>

<!-- 회원정보 수정 -->
<div class="container mt-3 p-3">
	<h2 class="mt-5 text-center" style="color:#527062;"><i class="far fa-address-card"></i>&nbsp;회원정보 수정</h2>
	<br/>
	<form action="join" method="post" id="frm1" name="frm1">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-bordered">
			<tr>
				<td>
					<label for="name">이름</label>
				</td>
				<td>
					<input id="name" type="text" name="pname" class="form-control" value=""/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="id">아이디</label>
				</td>
				<td>
					<input id="id" type="text" name="pid" class="form-control" value="${principal.user.username}" readonly/><br/>
					<span id="idc"></span>
				</td>
			</tr>
			<tr>
				<td>
					<label for="pw1">비밀번호</label>
				</td>
				<td>
					<input id="pw1" type="password" name="ppw" class="form-control" onchange="check_pw()"/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="pw2">비밀번호 확인</label>
				</td>
				<td>
					<input id="pw2" type="password" name="ppwcheck" class="form-control" onchange="check_pw()"/><br/>
					<span id="pwc" style="font-size: 15px; margin-top: 4px;"></span>
				</td>
			</tr>
			<tr>
				<td>
					<label for="mail">이메일</label>
				</td>
				<td>
					<input id="mail" type="email" name="pmail" class="form-control" required/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="pn">연락처</label>
				</td>
				<td>
					<input id="pn" type="text" placeholder="연락처" name="ppn" class="form-control"/>
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" id="sbm" class="btn btn-primary mb-3" style="width:100%;">
				회원가입
			</button>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#frm1").submit(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#frm1").attr("action"),
			type : $("#frm1").attr("method"),
			data : $("#frm1").serialize(), //폼으로 입력 받은 값을 직렬화
			success : function(data) {
				if(data.search("join_success") > -1) {
					alert("회원정보 수정이 완료되었습니다. 로그인 페이지로 이동합니다.");
					location.href="login_view";
				}
				else {
					alert("회원정보 수정 실패. 다시 시도해주세요.");
				}
			},
			error : function() {
				alert("서버 접속 실패. 다시 시도해주세요.");
			}
		});
	});
});
function check_pw(){
	 
    let pw = $("#pw1").val();
    let SC = ["!","@","#","$","%"];
    let check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
        $("#pw1").val("");
    }
    for(let i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert("!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.");
        $("#pw1").val("");
    }
    if( $("#pw1").val() != "" &&  $("#pw2").val() !=""){
        if( $("#pw1").val() ==  $("#pw2").val()){
            $("#pwc").html("비밀번호가 일치합니다.");
            $("#pwc").css("color","blue");
        }
        else{
        	$("#pwc").html("비밀번호가 일치하지 않습니다.");
        	$("#pwc").css("color","red");
        	$("#pw2").css("border-color","red");
        }
    }
}	
</script>
</body>
</html>