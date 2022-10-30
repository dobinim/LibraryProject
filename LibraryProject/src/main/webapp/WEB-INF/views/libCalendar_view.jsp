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
<title>화곡도서관</title>
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
<!-- full calendar api 라이브러리 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css' rel='stylesheet'/>
<style>
html,body {
	height : 100%;
	margin : 0px;
	padding : 0px;
}
h3 {
	color : #3f3f48;
}

hr {
	border : 0;
	height : 2px;
	color : #d7d8df;
}
</style>
</head>
<body>

<!-- 로그인 id 반환 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

<jsp:include page = "/resources/html/top.jsp" />

<div class="container mt-5" id="mainRegion">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="intro_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<h3 class="mb-2" style="color:#527062;"><i class="far fa-calendar-check"></i>&nbsp;<b>도서관 일정</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5">
				매월 둘째, 넷째 월요일은 도서관 정기 휴관일입니다.<br/>
				<span style="color:#527062;"><b>도서관 개관 시간은 9:00 ~ 20:00</b></span> 입니다.
			</p>
			<div id="calendarRegion" class="container mt-5">
				<div id="calendar"></div>
			</div>
		</div>
	</div>
</div>

<jsp:include page = "/resources/html/footer.jsp" />

<script>
let calendar = null;
let user_id = '<c:out value="${user_id}"></c:out>';

$(document).ready(function(){
	$(function(){ 
		let request = $.ajax({ 
			url : "calendar?cId=admin", //총괄 관리자 계정
			type : "GET",
			dataType : "json"
		});
		request.done(function(data){ 
			console.log(data);
			let calendarEl = document.getElementById("calendar"); 
			calendar = new FullCalendar.Calendar(calendarEl,{
				timeZone : "Asia/Seoul",
				headerToolbar : {
					left : "prev,next today",
					center : "title",
					right : "dayGridMonth,timeGridWeek,timeGridDay"
				},
				navLinks : false,
				editable : false,
				selectable : false,
				droppable : false,
				locale : "ko",
				events : data 
			});
			calendar.render();
		});
	});
});
</script>
</body>
</html>