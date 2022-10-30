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
<title>정보수정</title>
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
				<button class="btn" id="update_basicInfo" style="background-color:#527062;color:white;">기본정보 수정</button>
				<button class="btn" id="update_pw" style="background-color:white;color:#527062;border-color:#527062;">비밀번호 수정</button>
			</div>
			
			<!-- 회원정보 수정 폼 -->
			<span>* 표시는 필수 입력 사항입니다.</span>
			<form action="update" method="post" id="frm1" name="frm1">
			<c:forEach items="${LibUserDto}" var="dto">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="table" style="border-top: 2px solid black;border-bottom: 2px solid black;">
					<tr>
						<td id="l1">
							<label for="name">* 이름</label>
						</td>
						<td>
							<div class="col-5">
								<input id="name" type="text" name="pname" class="form-control" value="${dto.pname}"/>
							</div>
						</td>
					</tr>
					<tr>
						<td id="l2">
							<label for="pid">* 아이디</label>
						</td>
						<td>
							<div class="form-inline">
								<div class="col-10">
									<input id="pid" type="text" name="pid" class="form-control" value="${dto.pid}" required readonly/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td id="l5">* 생년월일</td>
						<td>
							<div class="form-inline">
								<div class="col-12">
									<input type="text" name="birth1" class="form-control" placeholder="4자리(2001)" value="${dto.birth1}" required/><span>년&nbsp;</span>
									<input type="text" name="birth2" class="form-control" placeholder="01" value="${dto.birth2}" required/><span>월&nbsp;</span>
									<input type="text" name="birth3" class="form-control" placeholder="01" value="${dto.birth3}" required/><span>일</span>
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
									<input id="mail1" type="text" name="pmail1" class="form-control" value="${dto.pmail1}" required/>
									<span>@</span>
									<select class="form-control" id="pmail2" name="pmail2">
										<option value="${dto.pmail2}" selected>${dto.pmail2}</option>
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
										<option value="${dto.ppn1}" selected>${dto.ppn1}</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="070">070</option>
									</select>
									<span>-</span>
									<input id="pn2" type="text" name="ppn2" class="form-control" value="${dto.ppn2}"/>
									<span>-</span>
									<input id="pn3" type="text" name="ppn3" class="form-control" value="${dto.ppn3}"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td id="l8">* 주소</td>
						<td>
							<div class="col-10">
								<div class="form-inline">
									<input class="form-control mr-2" type="text" id="postcode" name="postcode" placeholder="우편번호" value="${dto.postcode}">
									<button class="btn btn-primary" type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
								</div>
								<input class="form-control mt-2 col-10" type="text" id="address" name="address" placeholder="주소" value="${dto.address}">
								<div class="form-inline mt-2">
									<input class="form-control mr-2 col-5" type="text" id="detailAddress" name="detailaddress" placeholder="상세주소" value="${dto.detailaddress}">
									<input class="form-control col-5" type="text" id="extraAddress" name="extraaddress" placeholder="참고항목" value="${dto.extraaddress}">
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div align="center">
					<button type="submit" id="sbm" class="btn mb-3" style="background:#527062; color:white;">
						회원정보 수정
					</button>
				</div>
			</c:forEach>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
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
	
	$("#frm1").submit(function(event){
		event.preventDefault();
		if(confirm("회원정보를 수정하시겠습니까?") == true) {
			$.ajax({
				url : $("#frm1").attr("action"),
				type : $("#frm1").attr("method"),
				data : $("#frm1").serialize(),
				success : function(data) {
					alert("회원정보 수정이 완료되었습니다. 메인 페이지로 이동합니다.");
					location.href="home";
				},
				error : function() {
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
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