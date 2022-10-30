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
			<jsp:include page="admin_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<h3 style="color:#527062;"><i class="far fa-calendar-check"></i>&nbsp;<b>도서관 일정관리</b></h3>
			<hr/>
			<p style="font-size:18px; background:#ececf0;border-radius:20px 40px;" class="p-5 mb-5">
				<span style="color:#527062;"><b>도서관 일정관리</b></span><br/>
				<span style="font-size:14px;">
					도서관 휴무일 및 행사일 등을 입력해 주십시오.<br/>
					일정은 '도서관 소개'의 '도서관 일정' 페이지에 노출됩니다.
				</span>
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
					right : "dayGridMonth,timeGridWeek,timeGridDay,listWeek"
				},
				navLinks : true,
				editable : true,
				selectable : true,
				droppable : true,
				
				eventDrop : function(info) {
					let obj = new Object();
					if(confirm("'" + info.event.title + "'의 일정을 수정하시겠습니까?")) {
						obj.cTitle = info.event._def.title;
	    				obj.cStart = info.event._instance.range.start;
	               		obj.cEnd = info.event._instance.range.end;
	               		obj.cAllDay = info.event._instance.range.allDay;
	               		obj.cNo = info.event.extendedProps.cNo; 
	               		obj.cId = user_id;
	               		obj.oldTitle = info.oldEvent._def.title;
	               		obj.oldStart = info.oldEvent._instance.range.start;
	               		obj.oldEnd = info.oldEvent._instance.range.end;
	               		obj.oldAllDay = info.oldEvent._instance.range.allDay;
	               		console.log(obj);
						$(function modifyData(){
							$.ajax({
								url : "calendarUpdate",
								method : "POST",
								dataType : "json",
								data : JSON.stringify(obj),
								contentType : "application/json",
								beforeSend : function(xhr) { 
									xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
								}
							});
						});
					}
					else {
						info.revert(); 
					}
					calendar.unselect();
					location.reload(); 
				},
				
				eventResize : function(info) { //drag기능(수정)
					console.log(info);
					var obj = new Object();
					if(confirm("'" + info.event.title + "' 의 일정을 수정하시겠습니까?")) {
						obj.cTitle = info.event._def.title;
	    				obj.cStart = info.event._instance.range.start;
	               		obj.cEnd = info.event._instance.range.end;
	               		obj.cAllDay = info.event._instance.range.allDay;
	               		obj.cNo = info.event.extendedProps.cNo; 
	               		obj.cId = user_id; 
	               		obj.oldTitle = info.oldEvent._def.title;
	               		obj.oldStart = info.oldEvent._instance.range.start;
	               		obj.oldEnd = info.oldEvent._instance.range.end;
	               		obj.oldAllDay = info.oldEvent._instance.range.allDay;
	               		console.log(obj);
						$(function modifyData(){
							$.ajax({
								url : "calendarUpdate",
								type : "post",
								dataType : "json",
								data : JSON.stringify(obj),
								contentType : "application/json",
								beforeSend : function(xhr) {
									xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
								}
							});
						});
					}
					else {
						info.revert();
					}
					calendar.unselect();
					location.reload();
				},
				
				select : function(arg) { //insert기능(작성)
					var title = prompt('일정명을 기록하고 일정을 선택하세요.');
					if(title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay 
						});
						console.log(arg);
						var obj = new Object();
						obj.cNo = 100; 
						obj.cId = user_id;
						obj.cTitle = title;
						obj.cStart = arg.start;
						obj.cEnd = arg.end;
						if(arg.allDay == true) {
							obj.cAllDay = "true";
						}
						else {
							obj.cAllDay = "false";
						}
						console.log(obj);
						$(function saveData() {
							$.ajax({
								url : "calendarInsert",
								type : "POST",
								dataType : "json",
								data : JSON.stringify(obj),
								contentType : "application/json",
								beforeSend : function(xhr) {
									xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
								}
							});
						});
					}
					else {
						info.revert();
					}
					calendar.unselect();
					location.reload();
				},
				
				eventClick : function(info) { 
					if(confirm("'" + info.event.title + "' 의 일정을 삭제하시겠습니까?")) {
						info.event.remove();
						console.log(info.event);
						var obj = new Object();
						obj.cTitle = info.event._def.title;
						obj.cStart = info.event._instance.range.start;
	               		obj.cEnd = info.event._instance.range.end;
	               		obj.cId = user_id;
	               		obj.cNo = info.event.extendedProps.cNo;
	               		console.log(obj);
	               		$(function deleteData(){
	               			$.ajax({
	               				url : "calendarDelete",
	               				type : "post",
	               				dataType : "json",
								data : JSON.stringify(obj),
								contentType : "application/json",
								beforeSend : function(xhr) {
									xhr.setRequestHeader('X-CSRF-Token', $('input[name="${_csrf.parameterName}"]').val());
								}
	               			});
	               		});
					}
					else {
						location.reload();
					}
				},
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