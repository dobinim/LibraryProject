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
<!-- jquery
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
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

<!-- 회원가입 본문 -->
<div class="container mt-5 p-3">
	<h2 class="mt-5 text-center" style="color:#527062;"><i class="far fa-address-card"></i>&nbsp;회원가입</h2>
	<br/>
	
	<!-- 이용약관 -->
	<span style="font-size: 150%;">도서관 이용약관 동의 </span><span class="text-success">(필수)</span>
	<br/>
	<div class="mb-2 border border-secondary" style="overflow:auto; width:100%; height:200px;">
		<jsp:include page="termsOfUse1.jsp" flush="false"/>
	</div>
	<input type="checkbox" id="useCheck1"><span>동의합니다.</span>

	<br/><br/>
	
	<span style="font-size: 150%;">개인정보 수집 및 이용에 관한 동의 </span><span class="text-success">(필수)</span>
	<br/>
	<div class="mb-2 border border-secondary" style="overflow:auto; width:100%; height:200px;">
		<jsp:include page="termsOfUse2.jsp" flush="false"/>
	</div>
	<input type="checkbox" id="useCheck2"><span>동의합니다.</span>
	
	<br/><br/><br/>
	
	<!-- 회원가입 폼 -->
	<p style="font-size: 150%;">기본정보 입력</p>
	<span>* 표시는 필수 입력 사항입니다.</span>
	<form action="join" method="post" id="join" name="join">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table" style="border-top: 2px solid black;border-bottom: 2px solid black;">
			<tr>
				<td id="l1">
					<label for="name">* 이름</label>
				</td>
				<td>
					<div class="col-5">
						<input id="name" type="text" name="pname" class="form-control"/>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l2">
					<label for="pid">* 아이디</label>
				</td>
				<td>
					<div class="form-inline">
						<div class="col-12">
							<input id="pid" type="text" name="pid" class="form-control" required maxlength="12"/>
							<button type="button" class="btn btn-primary" onclick="id_check()">중복확인</button>
							<span style="color:gray;">&nbsp;6~12자리의 영문 또는 숫자 혼용, 특수문자 제외</span>
							<br/>
							<span id="idc_ok" style="font-size:15px; color:green; display:none;">사용 가능한 아이디입니다.</span>
							<span id="idc_ng" style="font-size:15px; color:red; display:none;">사용할 수 없는 아이디입니다.</span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l3">
					<label for="pw1">* 비밀번호</label>
				</td>
				<td>
					<div class="form-inline">
						<div class="col-12">
							<input id="pw1" type="password" name="ppw" class="form-control" onchange="check_pw()" maxlength="16" min="6" required/>
							<span style="color:gray;">&nbsp;6~16자리의 영문 또는 숫자, "!, @, #, $, %" 혼용 </span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l4">
					<label for="pw2">* 비밀번호 확인</label>
				</td>
				<td>
					<div class="col-5">
						<input id="pw2" type="password" name="ppwcheck" class="form-control" onchange="check_pw()" maxlength="16" min="6" required/><br/>
						<span id="pwc" style="font-size: 15px;"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l5">* 생년월일</td>
				<td>
					<div class="form-inline">
						<div class="col-10">
							<input type="text" name="birth1" class="form-control" placeholder="4자리(2001)" required maxlength="4"/><span>년&nbsp;</span>
							<input type="text" name="birth2" class="form-control" placeholder="01"required maxlength="2"/><span>월&nbsp;</span>
							<input type="text" name="birth3" class="form-control" placeholder="01"required maxlength="2"/><span>일</span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l6">
					<label for="mail1">* 이메일</label>
				</td>
				<td>
					<div class="form-inline">
						<div class="col-10">
							<input id="mail1" type="text" name="pmail1" class="form-control" required/>
							<span>@</span>
							<select class="form-control" id="pmail2" name="pmail2">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l7">
					<label for="pn1">* 연락처</label>
				</td>
				<td>
					<div class="form-inline">
						<div class="col-10">
							<select class="form-control" id="ppn1" name="ppn1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="070">070</option>
							</select>
							<span>-</span>
							<input id="pn2" type="text" name="ppn2" class="form-control" maxlength="4" required/>
							<span>-</span>
							<input id="pn3" type="text" name="ppn3" class="form-control" maxlength="4" required/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td id="l8">* 주소</td>
				<td>
					<div class="col-10">
						<div class="form-inline">
							<input class="form-control mr-2" type="text" id="postcode" name="postcode" placeholder="우편번호" required>
							<button class="btn btn-primary" type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
						</div>
						<input class="form-control mt-2 col-10" type="text" id="address" name="address" placeholder="주소" required>
						<div class="form-inline mt-2">
							<input class="form-control mr-2 col-5" type="text" id="detailAddress" name="detailaddress" placeholder="상세주소" required>
							<input class="form-control col-5" type="text" id="extraAddress" name="extraaddress" placeholder="참고항목" required>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<div align="center">
			<button type="submit" id="joinBtn" class="btn mb-3" style="background:#527062; color:white;">
				회원가입
			</button>
			<button type="submit" class="d-none" id="joinBtn2">회원가입</button>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	$("#joinBtn").click(function(){
		if(confirm("가입하시겠습니까?") == true) {
			if($("#useCheck1").is(":checked") && $("#useCheck2").is(":checked")) {
				//$("#joinBtn2").trigger("click");
				$("#join").submit(function(event){
					event.preventDefault();
					$.ajax({
						url : $("#join").attr("action"),
						type : $("#join").attr("method"),
						data : $("#join").serialize(),
						success : function(data) {
							if(data.search("join_success") > -1) {
								alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
								location.href="login_view";
							}
							else {
								alert("회원가입 실패. 다시 시도해주세요.");
							}
						},
						error : function() {
							alert("서버 접속 실패. 다시 시도해주세요.");
						}
					});
				});
			}
			else {
				alert("이용약관에 동의해주세요.");
			}
		}
		else {
			return;
		}
	});
});

function id_check() {
	let pid = $("#pid").val();
	console.log(pid);
	$.ajax({
		url : "idCheck",
		type : "get",
		data : {pid : pid},
		success : function(cnt) {
			if(cnt == 0) {
				$("#idc_ok").css("display", "inline-block");
				$("#idc_ng").css("display", "none");
			}
			else {
				$("#idc_ng").css("display", "inline-block");
				$("#idc_ok").css("display", "none");
			}
		},
		error : function() {
			alert("서버 접속 실패. 다시 시도해주세요.")
		}
	});
}


function check_pw() {
	 
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
<script>
function execDaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
</body>
</html>