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
span {
	display : block;
	font-size : 16px;
}
</style>
</head>
<body id="b">

<h5><b><i class="fa fa-bell" style="color:#527062"></i>&nbsp;희망도서신청안내</b></h5>
<p style="white-space:pre;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;신청방법 : 희망하시는 도서가 소장된 자료인지 확인하시고 없을 경우 홈페이지내 희망도서 신청화면에서
	   	      도서정보 및 신상정보를 정확히 기재하고 신청해주시기 바랍니다.</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;처리주기 : 매주 화요일에 도서 주문 (신청기간이 지난주 월요일 ~ 이번주 일요일인 도서)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;신청권수 : 1회 1인 1권 가능, 초과 신청분은 취소 처리</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;신청결과 안내 : 홈페이지 '마이페이지 - 희망도서·예약' 에서 확인</span>
</p>
<br/><br/>
<h5><b><i class="fa fa-bell" style="color:#527062"></i>&nbsp;희망도서 선정 제외 기준</b></h5>
<p style="white-space:pre;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;소장도서 및 중복신청도서, 구입예정도서, 도서관에 입고되어 정리중인 도서, 미 출간도서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;서지사항이 불분명한 도서 (서명, 저자명, 출판사명 등)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;품절 및 절판된 도서, 예약판매(미출간)도서, 신판이 출판된 구판도서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;당해 연도를 기준으로 출판된 지 5년 이상 경과한 도서 등 최신성이 떨어지는 도서(2018년 이후 출간자료만 가능)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;3권을 초과하는 시리즈물, 세트 전집류</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;고가 도서 (정가 기준 5만원 초과), 독자층이 한정된 고가의 전문서적</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;서양서, 비도서, 연속간행물 등</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;문제집, 참고서, 교재 등 시험 및 자격증 취득을 위한 수험서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;워크북, 스프링북, 라이팅북, 컬러링북 등 개인학습용 도서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;POD도서, 팝업북, 규격외 판형자료(소책자 등)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;연감, 백서, 통계, 편람 및 각종 화집, 악보, 단순 전시도록 등</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;판타지소설, 로맨스소설, 무협지, 인터넷소설, 라이트노벨 등</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;만화(웹툰, 카툰, 그래픽노블 등)류의 자료(어린이 학습만화 제외)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;영리 또는 정치 목적의 신청도서(출판사 관련자 신청도서 또는 꾸준히 신청하면서 장기간 미대출시 영리목적으로 간주)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;선정적·폭력적 내용의 어린이 정서에 유해한 자료 및 청소년 유해도서(19세 이상)</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;희귀도서(주요 대형 서점에서 판매하지 않는 도서), 간증, 영성, 전도, 설교 등 개인적 성향이 강한 종교 관련 도서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;서울특별시교육청 산하 타도서관 및 평생학습관에 중복으로 신청한 도서</span>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right"></i>&nbsp;기타 자료선정위원회에서 적합하지 않다고 판단된 자료</span>
</p>
</body>
</html>