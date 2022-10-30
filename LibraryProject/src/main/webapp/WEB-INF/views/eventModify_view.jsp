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

<title>행사 수정 페이지</title>
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
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
html, body {
	width : 100%;
}

#Groupdiv {
	display : inline-block;
	width : 100px;
}

#titlediv {
	display : inline-block;
	width : 750px;
	margin-left : 30px;
}

#Period1, #Period2 {
	width : 400px;
	display : inline-block;

}

#rPeriod1, #rPeriod2, #namediv, #hourdiv, #placediv {
	width : 400px;
	display : inline-block;
}

#hourdiv {
	margin-left : 30px;
}

#groupl, #titlel, #periodl, #rperiodl, #contentl, #placel, #hourl {
	font-size : 15px;
	font-weight : bold;
}

select {
	height : 38px;
}

textarea {
	width : 100%;
	white-space : pre-line;
}

#modifybtn {
	float : right;
	background-color : #527062;
	color : white;
}

#listbtn {
	background-color : #3f3f48;
	color : white;
}

</style>
</head>
<body>


<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="container mb-3" id = "maindiv">
	<div class="row mt-3">
		<div class="col-2 border">
			<jsp:include page="classboard_menu.jsp" flush="false"/>
		</div>
			<div class="col-10 mx-auto" id="submain">
				<h3 class = "text-center mt-3">행사 등록</h3>
				<hr/>
								<!-- 본문 내용 넣기 -->
				<div class = "mb-3 mt-1 mx-auto">
				<!-- multipart/form-data 사용 시 input type = hidden을 이용한 csrf 넣기는 안됨. 무조건 이렇게 action에서 처리 :) -->
					<form action = "eventModify?${_csrf.parameterName}=${_csrf.token}" method = "post" enctype = "multipart/form-data" id = "eventform">						
						<div class = "form-group" id = "Groupdiv">												<!-- 행사 분류 -->
							<label for = "group" id = "groupl">행사 분류</label><br/>
							<select id = "grouplist" name = "eGroup" class = "searchKey" required>
								<option value = "${eContentView.eGroup}" style = "display:none;" selected>${eContentView.eGroup}</option>
								<option value = "누구나">누구나</option>
								<option value = "유아/아동">유아/아동</option>
								<option value = "청소년">청소년</option>
								<option value = "성인">성인</option>
								<option value = "어르신">어르신</option>	
							</select>
						</div>
						<div class = "form-group" id = "titlediv">
							<input type = "hidden" value = "${eContentView.eId}" name = "eId" readonly>															<!-- 행사명 -->						
							<label for = "Title" id = "titlel">행사 이름</label>
							<input type = "text" class = "form-control" id = "Title" name = "eTitle" value = "${eContentView.eTitle}" required />
						</div>
						<div class = "form-group">													<!-- 접수 기간 -->
							<label for = "rPeriod" id = "rperiodl">접수 기간</label><br/>
							<input type = "date" class = "form-control" id = "rPeriod1" name = "eStartReg" value = "${eContentView.eStartReg}" required /> &nbsp;&nbsp; - &nbsp;&nbsp;
							<input type = "date" class = "form-control" id = "rPeriod2" name = "eEndReg" value = "${eContentView.eEndReg}" required />
						</div>	
						<div class = "form-group">													<!-- 행사 기간 -->
							<label for = "Period" id = "periodl">행사 기간</label><br/>
							<input type = "date" class = "form-control" id = "Period1" name = "eStart" value = "${eContentView.eStart}" required /> &nbsp;&nbsp; - &nbsp;&nbsp;
							<input type = "date" class = "form-control" id = "Period2" name = "eEnd" value = "${eContentView.eEnd}" required />
						</div>
						<div class = "form-group" id = "placediv">									<!-- 행사 장소 -->
							<label for = "place" id = "placel">행사 장소</label>
							<input type = "text" class = "form-control" id = "place" name = "ePlace" value = "${eContentView.ePlace}" placeholder = "장소 입력"/>	
						</div>
						<div class = "form-group" id = "hourdiv">
							<label for = "hour" id = "hourl">행사 시간</label>
							<input type = "text" class = "form-control" id = "hour" name = "eHour" value = "${eContentView.eHour}" placeholder = "요일 및 시간" />
						</div>
						
						<div class = "form-group">													<!-- 행사 설명 -->
							<label for = "Content" id = "contentl">행사 설명</label><br/>
							<textarea id = "Content" name = "eContent" rows = "15">${eContentView.eContent}</textarea>
						</div>
							
						<div class = "form-group">													<!-- 첨부 파일 -->
							<label for = "File">첨부 파일</label>&nbsp;&nbsp;
							<input type = "text" id = "File" name = "ePhoto" value = "${eContentView.ePhoto}" readonly>
						</div>
						<button class = "btn" id = "modifybtn" type = "submit">행사 수정</button>
					</form>
						<a class = "btn f-left" href = "eventList" id = "listbtn">목록</a>
				</div>
			</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#eventform").submit(function(event){
		event.preventDefault();
		if(confirm("정말로 수정하시겠습니까?") == true) {
			$.ajax({
				url : $("#eventform").attr("action"),
				type : $("#eventform").attr("method"),
				data : $("#eventform").serialize(),
				success : function(data) {
					alert("수정이 완료되었습니다. 페이지를 이동합니다.")
					$("#mainRegion").html(data);
				},
				error : function() {
					alert("서버 접속 실패. 다시 시도해주세요.");
				}
			});
		}
		else {
			location.href("eventModify_view");
		}
	});
	$("#listbtn").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#listbtn").attr("href"),
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
});
</script>
</body>
</html>