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
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery.twbsPagination.js"></script>
</head>
<body>

<form action="appStateChange" method="post" id="appStateChange" name="appStateChange">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table class="table table-bordered text-center table-hover" id="adminApplicationTable" style="border-top:2px solid black;border-bottom:2px solid black;">
		<thead style="background:#d7d8df;">
			<tr>
				<th>&nbsp;&nbsp;</th>
				<th>?????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>?????????</th>
				<th>????????????</th>
			</tr>
		</thead>
		<tbody class="text-secondary">
			<c:forEach items="${adminApplicationList}" var="list">
				<tr>
					<td><input type="checkbox" name="appNo" value="${list.appNo}" class="cb"/></td>
					<td>${list.appUser}</td>
					<td>${list.appBookTitle}</td>
					<td>${list.appBookWriter}</td>
					<td>${list.appBookPub}</td>
					<td>${list.appBookGenre}</td>
					<td>${list.appDate}</td>
					<td style="color:#527062;"><b>${list.appState}</b></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="right">
		<div class="form-inline" style="display:inline;">
			<select name="appState" class="form-control mr-1">
				<option value="????????????">????????????</option>
				<option value="???????????????">???????????????</option>
				<option value="????????????">????????????</option>
			</select>
			<button id="stateChange" type="submit" class="btn" style="background:#527062; color:white;"><i class="fas fa-exchange-alt"></i>&nbsp;???????????? ??????</button>
		</div>
	</div>
</form>

<script>
$(document).ready(function() {
	$(document).on('change', '.cb', function() {
	    $(".cb").not(this).prop("checked", false);
	});
	
	$("#stateChange").click(function() {
		if(confirm("??????????????? ?????????????????????????") == true) {
			$("#appStateChange").submit(function(event){
				event.preventDefault();
				$.ajax({
					url : "appStateChange",
					type : $("#appStateChange").attr("method"),
					data : $("#appStateChange").serialize(),
					success : function(data){
						alert("??????????????? ?????????????????????.");
						$("#mainRegion").html(data);
					},
					error : function(){
						alert("????????? ??????????????????.");
					}
				});
			});
		}
	});
});
</script>
</body>
</html>