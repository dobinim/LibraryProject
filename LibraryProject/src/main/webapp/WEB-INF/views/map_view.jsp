<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" 
integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />

<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<style>
.bbus {
	color : #3F51B5;
}
.gbus {
	color : #64DD17;
}
.ygbus {
	color : #C6FF00;
}
.rbus {
	color : #D50000;
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
<body>

<div class="container mt-5">
	<div class="row">
		<div class="col-2 border">
			<jsp:include page="intro_menu.jsp" flush="false"/>
		</div>
		<div class="col-10">
			<h3 style="color:#527062;"><i class="fa fa-location-arrow"></i>&nbsp;<b>찾아오시는 길</b></h3>
			<hr/>
			<div id="map" style="width:600px; height:400px;">
				<!-- <img src="media/map.png" alt="지도"/> -->
			</div>
			<h5 class="mt-3"><b>주소</b></h5>
			<p>서울특별시 강서구 화곡로 149</p>
			
			<div class="row mt-4 mb-3">
				<div class="col-11">
					<img src="media/bus_subway.png" class="img-fluid"/>
				</div>
			</div>
			<div class="row col-12">
				<div class="col-6" style="border-right:1px solid lightgray">
					<img class="d-inline mb-1" src="media/line5.png" alt="5호선" width="20px">
					<span>&nbsp;화곡역 7번출구</span>
				</div>
				<div class="col-6">
					<div>
						&nbsp;<i class="fa-solid fa-bus bbus"></i>
						&nbsp;606 650 652 653 661 673 
					</div>	
					<div>
						&nbsp;<i class="fa-solid fa-bus gbus"></i>
						&nbsp;6627
					</div>	
					<div>
						&nbsp;<i class="fa-solid fa-bus ygbus"></i>
						&nbsp;23 59 59-1 60-1 70 70-2 70-3 77
					</div>	
					<div>
						&nbsp;<i class="fa-solid fa-bus rbus"></i>
						&nbsp;7700
					</div>	
						
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.54174, 126.84087), // 지도의 중심좌표
	        level: 4, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(37.54082725137825, 126.83648234737262), // 마커의 좌표
	    draggable : true, // 마커를 드래그 가능하도록 설정한다
	    map: map // 마커를 표시할 지도 객체
	});
</script>
</body> 
</html>