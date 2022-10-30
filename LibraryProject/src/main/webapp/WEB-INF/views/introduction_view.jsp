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
<style>
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

<div class="container mt-5">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="intro_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<h3 style="color:#527062;"><i class="fa fa-quote-left"></i>&nbsp;<b>인사말</b></h3>
			<hr/>
			<img src="media/도서관소개.png" alt="도서관소개배너" style="width:100%;"/>
			<h4 style="color:#527062;" class="mt-5"><b>화곡도서관에 오신 것을 환영합니다!</b></h4>
			<br/><br/>
			<p>
				화곡도서관은 1983년 개관한 서울특별시교육청 소속 공공도서관으로 지역주민들의 지식정보 및 문화활동과 평생학습 증진을 위해 최선의 노력을 기울이고 있습니다.
				<br/><br/>
				언제 어디서나 누구나 원하는 자료와 정보를 얻을 수 있도록 하며, 평생학습도시 강서구와 함께 다양한 강좌 및 전시회 등을 통하여 지역주민의 삶의 질 향상에 기여하고자 합니다.
				<br/><br/>
				우리도서관은 ‘창의적 민주시민을 기르는 혁신미래 교육’이라는 서울교육 방향에 발맞춰 도서관을 이용하시는 모든 분 들이 도서관을 통해 미래를 꿈꾸고 만들어 갈 수 있도록 지원하겠습니다.
				<br/><br/>
				지역사회를 아우르는 소통과 감동이 있는 화곡도서관이 될 수 있도록 최선을 다하겠습니다.
			</p>
		</div>
	</div>
</div>
</body>
</html>