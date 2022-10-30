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
<title>회원가입</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
#l1, #l2, #l3, #l4, #l5, #l6, #l7, #l8 {
	background-color : #ececf0;
	text-align : left;
}
</style>
<body>

<div class="row mt-5">
	<div class="col-2 border">
		<jsp:include page="myPage_menu.jsp" flush="false"/>
	</div>
	<div class="col-10">
		<!-- 회원정보 수정 본문 -->
		<div id="mainRegion" class="container">
			<h3 style="color:#527062;"><i class="far fa-address-card"></i>&nbsp;<b>회원정보 수정</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
				<span style="color:#527062;"><b>회원정보수정</b></span><br/>
				<span style="font-size:14px;">
					회원 정보에 변경 사항이 있는 경우 수정해주시기 바랍니다.
				</span>
			</p>
			<!-- 메뉴 -->
			<div class="mt-5 mb-3">
				<button class="btn" id="update_basicInfo" style="background-color:white;color:#527062;border-color:#527062;">기본정보 수정</button>
				<button class="btn" id="update_pw" style="background-color:#527062;color:white;">비밀번호 수정</button>
			</div>
			
			<!-- 회원정보 수정 폼 -->
			<form action="updatePw" method="post" id="frm1" name="frm1">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table" style="border-top: 2px solid black;border-bottom: 2px solid black;">
					<tr>
						<td id="l3">
							<label for="pw">* 현재 비밀번호</label>
						</td>
						<td>
							<div class="col-5">
								<input id="pw" type="password" name="ppw" class="form-control" onchange="check_pw()"/><br />
								<span id="pwc" style="font-size: 15px;"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td id="l3">
							<label for="npw1">* 새 비밀번호</label>
						</td>
						<td>
							<div class="col-5">
								<input id="npw1" type="password" name="pnpw" class="form-control" onchange="check_npw()"/>
							</div>
						</td>
					</tr>
					<tr>
						<td id="l4">
							<label for="npw2">* 비밀번호 확인</label>
						</td>
						<td>
							<div class="col-5">
								<input id="npw2" type="password" name="pnpwcheck" class="form-control" onchange="check_npw()"/><br/>
								<span id="npwc" style="font-size: 15px;"></span>
							</div>
						</td>
					</tr>
				</table>
				<div align="center">
					<button type="submit" id="sbm" class="btn mb-3" style="background:#527062; color:white;">
						비밀번호 수정
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#frm1").submit(function(event){
		event.preventDefault();
		if(confirm("비밀번호를 수정하시겠습니까?") == true) {
			$.ajax({
				url : $("#frm1").attr("action"),
				type : $("#frm1").attr("method"),
				data : $("#frm1").serialize(),
				success : function(data) {
					alert("비밀번호 수정이 완료되었습니다. 메인 페이지로 이동합니다.");
					location.href="home";
				},
				error : function() {
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
	});
	$("#update_basicInfo").click(function(event){
		event.preventDefault();
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
	});
	$("#update_pw").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#updatePw_view").attr("href"),
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
	$("#update_pw").click(function(){
		event.preventDefault();
		$("#updatePw_view").trigger("click");
	});
});

function check_pw() {
	let inputPw = $("#pw").val();
	
	$.ajax({
		url : "pwCheck",
		type : "get",
		data : {inputPw : inputPw},
		success : function(isPw) {
			if(isPw) {
				$("#pwc").html("비밀번호가 일치합니다.");
		    	$("#pwc").css("color","blue");
		    	$("#pw").css("border-color","blue");
			}
			else {
				$("#pwc").html("비밀번호가 일치하지 않습니다.");
		    	$("#pwc").css("color","red");
		    	$("#pw").css("border-color","red");
			}
		},
		error : function() {
			alert("서버 접속 실패. 다시 시도해주세요.")
		}
	});
}

function check_npw() {
	
    let npw = $("#npw1").val();
    let SC = ["!","@","#","$","%"];
    let check_SC = 0;

    
    
    if(npw.length < 6 || npw.length>16){
        window.alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
        $("#npw1").val("");
    }
    for(let i=0;i<SC.length;i++){
        if(npw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert("!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.");
        $("#npw1").val("");
    }
    if( $("#npw1").val() != "" &&  $("#npw2").val() !=""){
    	
    	
        if( $("#npw1").val() ==  $("#npw2").val()){
            $("#npwc").html("비밀번호가 일치합니다.");
            $("#npwc").css("color","blue");
        	$("#npw2").css("border-color","blue");
        }
        else{
        	$("#npwc").html("비밀번호가 일치하지 않습니다.");
        	$("#npwc").css("color","red");
        	$("#npw2").css("border-color","red");
        }
    }
}	
</script>
</body>
</html>