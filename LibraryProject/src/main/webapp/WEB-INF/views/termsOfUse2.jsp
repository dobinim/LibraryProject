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
</head>
<body>

<p style="white-space:pre;">
<b>수집하는 개인정보의 항목</b>

1.화곡도서관은 회원가입, 원활한 고객상담, 각종 서비스 등 기본적인 서비스 제공을 위한 필수정보와 고객 맞춤 서비스 제공을 위한 선택정보로 구분하여 최초 회원가입 시 아래와 같은 최소한의 개인정보를 수집하고 있습니다.
-필수항목 : ID, 비밀번호, 성명, E-Mail, 연락처(또는 핸드폰), 생년월일, 주소, 법정대리인 성명(만14세 미만 회원의 경우)

2.맞춤형 서비스 및 도서관 통계 분석을 위해 아래와 같은 항목은 선택정보로 별도의 동의를 받아 수집합니다.
-선택항목 : 성별, SMS통보여부, 연락처 중 휴대전화번호, 소속기관, 이용목적, 관심분야, 메일링서비스 수신여부, 학교정보, 책바다 소속도서관, 소속도서관 이용증번호
*선택정보를 입력하지 않은 경우에도 서비스 이용제한은 없으며 민감한 개인정보(인종, 사상 및 신조, 범죄 및 의료기록 등)는 수집하지 않습니다.

3.서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
-IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록

<b>개인정보의 수집 및 이용 목적</b>
1.필수항목 수집 및 이용목적
가.서비스 제공에 관한 업무 이행
-홈페이지 회원에게 정보 서비스 제공
나.회원관리
-회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달

2.선택항목 수집 및 이용목적
가.성별 : 인구통계학적 통계
나.알림서비스 제공 : SMS 통보여부, 휴대전화번호
다.정책정보 서비스 제공 : 소속기관
라.이용 도서관 통계분석 및 맞춤형 서비스 제공 : 이용목적, 관심분야, 메일링서비스 수신여부
마.국립어린이청소년도서관 청소년프로그램 운영 : 학교정보
바.책바다 서비스 제공 : 휴대전화번호, 책바다 소속도서관, 소속도서관 이용증번호
개인정보의 보유 및 이용기간
회원 이용자의 개인정보는 개인정보보호법 및 공공기록물법에 따라 마지막 이용일(도서관 방문, 홈페이지 로그인)로부터 5년간 보관되며, 그 이후, 관계법령의 절차에 따라 파기합니다.
다만, 다음과 같은 경우에 개인정보의 처리 및 이용이 중지됩니다.
-휴면회원 전환(마지막 이용일로부터 2년간 사용이 없을 경우)시점부터 계정활성화 또는 파기시까지
-회원 탈퇴 요청 시점부터 개인정보 파기시까지
동의거부권 및 동의 거부에 따른 불이익
가입자는 개인정보 수집·이용에 대하여 거부할 수 있는 권리가 있습니다. 단, 이에 대한 동의를 거부할 경우에는 회원가입이 불가능합니다.
선택항목의 수집 동의를 거부하더라도 도서관 서비스를 이용할 수 있습니다. 단, 일부 서비스는 개인정보의 수집 및 이용 목적에 명시된 바에 따라, 해당 항목에 수집에 동의하여야 이용이 가능합니다.
</p>
</body>
</html>