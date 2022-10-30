package com.team.lib.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.lib.dto.BookApplicationDto;
import com.team.lib.dto.BookBorrowInfoDto;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.dto.BookCommentDto;
import com.team.lib.dto.BookListDto;
import com.team.lib.dto.BookReservationDto;
import com.team.lib.dto.ClassDto;
import com.team.lib.dto.EventDto;
import com.team.lib.dto.LibCalendarDto;
import com.team.lib.dto.LibUserDto;
import com.team.lib.dto.QnAAnswerDto;
import com.team.lib.dto.QnADto;
import com.team.lib.dto.nDto;

public class LibDao implements ILibDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	@Override
	public String join(LibUserDto dto) {
		String result = null;
		try {
			int res = sqlSession.insert("join", dto);
			System.out.println("회원가입 res: " + res);
			
			if(res > 0) {
				result = "success";
			}
			else {
				result = "failed";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		return result;
	}
	
	//아이디 중복체크
	@Override
	public int idCheck(String pid) {
		int cnt = sqlSession.selectOne("idCheck", pid);
		System.out.println("result : " + cnt);
		return cnt;
	}
	
	//로그인
	@Override
	public LibUserDto login(String pid) {
		System.out.println(pid);
		LibUserDto result = sqlSession.selectOne("login", pid);
		
		return result;
	}
	
	//회원정보 불러오기
	@Override
	public ArrayList<LibUserDto> LibUserInfo(String pid) {
		System.out.println("LibUserInfo");
		ArrayList<LibUserDto> dtos = (ArrayList)sqlSession.selectList("login", pid);
		return dtos;
	}
	
	//회원정보 수정
	@Override
	public void update(LibUserDto dto) {
		sqlSession.update("update_info", dto);
	}
	
	//비밀번호 확인
	@Override
	public String pwCheck(String pid) {
		return sqlSession.selectOne("pwCheck", pid);
	}
	
	//비밀번호 수정
	@Override
	public void update_pw(LibUserDto dto) {
		sqlSession.update("update_pw", dto);
	}
	
																			/* Q & A */
	//qna 목록 불러오기
	@Override
	public ArrayList<QnADto> qnaList() {
		System.out.println("qnaList");
		ArrayList<QnADto> dtos = (ArrayList)sqlSession.selectList("qnaList");
		
		return dtos;
	}
	
	//qna 등록
	@Override
	public String writeQnAOK(QnADto dto) {
		System.out.println("writeQnAOK");
		String result;
		
		int res = sqlSession.insert("writeQnAOK", dto);
		
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		
		return result;
	}
	
	//qna 상세보기
	@Override
	public QnADto qna_view(int qnaNo) {
		System.out.println("qna_view");
		QnADto dto = sqlSession.selectOne("qna_view", qnaNo);
		
		return dto;
	}
	
	//qna 페이징
	@Override
	public ArrayList<QnADto> qna_pageList(String pageNo) {
		
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<QnADto> result = (ArrayList)sqlSession.selectList("qna_pageList", startNo); 
		
		return result;
	}
	
	//qna 수정
	@Override
	public void qnaModify(QnADto dto) {
		sqlSession.update("qnaModify", dto);
	}
	
	//qna 삭제
	@Override
	public void qnaDelete(int qnaNo) {
		int res = sqlSession.delete("qnaDelete", qnaNo);
	}
	
	//qna 답변 등록
	@Override
	public void qnaAnswerOK(String answerWriter, String answerContent, int qnaNo) {
		QnAAnswerDto dto = new QnAAnswerDto(answerWriter, answerContent, qnaNo);
		int res = sqlSession.insert("qnaAnswerOK", dto);
	}
	
	//qna 답변 보기
	@Override
	public QnAAnswerDto qna_answer(int qnaNo) {
		QnAAnswerDto dto = sqlSession.selectOne("qna_answer", qnaNo);
		return dto;
	}
	
	//qna 검색
	@Override
	public ArrayList<QnADto> qnaSearch(QnADto dto) {
		ArrayList<QnADto> result = (ArrayList)sqlSession.selectList("qnaSearch", dto);
		return result;
	}
	
																			/* 도서 관련 */
	//신간도서 리스트 불러오기
	@Override
	public ArrayList<BookListDto> bookNewList() {
		System.out.println("bookNewList");
		ArrayList<BookListDto> dtos = (ArrayList)sqlSession.selectList("bookNewList");
		
		return dtos;
	}
	
	// 신간도서 검색
	@Override
	public ArrayList<BookListDto> newListSearch(BookListDto dto) {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("newListSearch", dto);
		return result;
	}
	
	//신간 4개
	@Override
	public ArrayList<BookListDto> bookList4() {
		System.out.println("bookList4");
		ArrayList<BookListDto> dtos = (ArrayList)sqlSession.selectList("bookList4");
		
		return dtos;
	}
	
	//신간도서 페이징
	@Override
	public ArrayList<BookListDto> newList_page(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("newList_page", startNo); 
		
		return result;
	}
	
	// 도서 등록
	@Override
	public String bookRegistration(BookListDto dto) {
		System.out.println("bookRegistration");
		String result;
		int res = sqlSession.insert("bookRegistration", dto);
		
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}
	
	// 도서 상세보기
	@Override
	public BookListDto content_view(int bookId) {
		System.out.println("content_view");
		BookListDto dto = sqlSession.selectOne("content_view", bookId);
		
		return dto;
	}
	
	// 도서 서평 등록
	@Override
	public void bookComment(String commentWriter, String commentContent, int bookId) {
		BookCommentDto dto = new BookCommentDto(commentWriter, commentContent, bookId);
		int res = sqlSession.insert("bookComment", dto);
	}
	
	// 도서 서평 보기
	@Override
	public ArrayList<BookCommentDto> book_comment(int bookId) {
		ArrayList<BookCommentDto> dto = (ArrayList)sqlSession.selectList("book_comment", bookId);
		return dto;
	}

	// 서평 삭제
	@Override
	public void commentDel(BookCommentDto dto) {
		int res = sqlSession.delete("commentDel", dto);
	}
	
	// 도서 소장 현황
	@Override
	public ArrayList<BookBorrowInfoDto> bookBorrowInfo(int bookId) {
		ArrayList<BookBorrowInfoDto> dto = (ArrayList)sqlSession.selectList("bookBorrow_info", bookId);
		return dto;
	}
	
	//도서 소장 등록
	@Override
	public void plus_possession(String organName, String referenceRoom, String callNum, String regiNum, String bookPossible, String booking, int bookId) {
		BookBorrowInfoDto dto = new BookBorrowInfoDto(organName, referenceRoom, callNum, regiNum, bookPossible, booking, bookId);
		sqlSession.insert("plus_possession", dto);
	}
	
	//도서 대출
	@Override
	public void adminBookBorrow(BookBorrowListDto dto) {
		sqlSession.insert("adminBookBorrow", dto);
	}
	
	//도서 대출 상태 변경
	@Override
	public void bookBorrow(BookBorrowInfoDto dto) {
		sqlSession.update("bookBorrow", dto);
	}
	
	//도서 반납 > 대출상태 변경
	@Override
	public void bookReturn(BookBorrowInfoDto dto) {
		sqlSession.update("bookReturn", dto);
	}
	
	//도서 반납
	@Override
	public void adminBookRendre(BookBorrowListDto dto) {
		sqlSession.update("adminBookRendre", dto);
	}
	
	//도서 대출시 예약 페이지의 대출상태 변경
	@Override
	public void bookReservationState(BookReservationDto dto) {
		sqlSession.update("bookReservationState", dto);
	}
	
	//도서 반납시 예약 페이지의 대출상태 변경
	@Override
	public void bookReservationState2(BookReservationDto dto) {
		sqlSession.update("bookReservationState2", dto);
	}
	
	// 추천 도서 보기
	@Override
	public ArrayList<BookListDto> recList() {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("recList");
		return result;
	}
	
	// 추천 도서 검색
	@Override
	public ArrayList<BookListDto> recListSearch(BookListDto dto) {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("recListSearch", dto);
		return result;
	}
	
	// 추천도서 4개
	@Override
	public ArrayList<BookListDto> recBookList4() {
		System.out.println("recBookList4");
		ArrayList<BookListDto> dtos = (ArrayList)sqlSession.selectList("recBookList4");
		
		return dtos;
	}
	
	// 추천 도서 페이징
	@Override
	public ArrayList<BookListDto> recList_page(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("recList_page", startNo); 
		
		return result;
	}
	
	// 베스트셀러 보기
	@Override
	public ArrayList<BookListDto> bookBestList() {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("bookBestList");
		return result;
	}
	
	// 베스트셀러 검색
	@Override
	public ArrayList<BookListDto> bestSellerSearch(BookListDto dto) {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("bestSellerSearch", dto);
		return result;
	}
	
	// 베스트셀러 4개
	@Override
	public ArrayList<BookListDto> bestBookList4() {
		System.out.println("bestBookList4");
		ArrayList<BookListDto> dtos = (ArrayList)sqlSession.selectList("bestBookList4");
		
		return dtos;
	}
	
	// 베스트셀러 페이징
	@Override
	public ArrayList<BookListDto> bestList_page(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("bestList_page", startNo); 
		
		return result;
	}	
	
																			/* 공지 사항 */
	// 공지 사항 목록 불러오기
	@Override
	public ArrayList<nDto> nList() {
		ArrayList<nDto> result = (ArrayList)sqlSession.selectList("nList");
		return result;
	}
	
	// 공지 사항 상세 보기
	@Override
	public nDto nContentView(int nId) {
		nDto result = sqlSession.selectOne("nContentView", nId);
		return result;
	}
	
	// 공지 사항 밑에 페이지 넘기기
	@Override
	public ArrayList<nDto> nPageList(String pageNo) {
		System.out.println("nPageList 메서드 실행");
		int page = Integer.parseInt(pageNo);
		int startNo = (page-1)*7 + 1;
		System.out.println("startNo : " + startNo);
		ArrayList<nDto> result = (ArrayList)sqlSession.selectList("nPageList", startNo);
		return result;
	}
	
	// 공지 사항 작성
	@Override
	public void writeNotice(nDto ndto) {
		System.out.println("writeNotice 처리");
		int res = sqlSession.insert("writeNotice", ndto);
	}
	
	
	// 공지 사항 수정 페이지 이동 (기존의 수정할 글 불러오기)
	@Override
	public nDto noticeModify(String nId) {
		nDto result = sqlSession.selectOne("noticeModify", Integer.parseInt(nId));
		return result;
	}
	
	// 공지 사항 수정 (업뎃)
	@Override
	public void modifyN(nDto ndto) {
		sqlSession.update("modifyN", ndto);
		
	}
	
	// 공지 사항 삭제
	@Override
	public void deleteN(int nId) {
		int res = sqlSession.delete("deleteN", nId);
	}
	
	// 공지 사항 4개
	public ArrayList<nDto> noticeList4() {
		ArrayList<nDto> dtos = (ArrayList)sqlSession.selectList("noticeList4");
		return dtos;
	}
	
																	/* 문화 강좌 */
	// 강좌 목록																		
	@Override
	public ArrayList<ClassDto> cList() {
		ArrayList<ClassDto> result = (ArrayList)sqlSession.selectList("cList");
		return result;
	}
	
	// 강좌 페이징
	public ArrayList<ClassDto> cPageList(String pageNo) {
		System.out.println("강좌 페이징 실행");
		int page = Integer.parseInt(pageNo);
		int startNo = (page-1)*7 + 1;
		System.out.println("startNo : " + startNo);
		ArrayList<ClassDto> result = (ArrayList)sqlSession.selectList("cPageList", startNo);
		return result;
	}
	
	// 강좌 상세 보기
	@Override
	public ClassDto cContentView(int cId) {
		ClassDto result = sqlSession.selectOne("cContentView", cId);
		return result;
	}

	// 강좌 등록
	@Override
	public String writeClass(ClassDto cdto) {
		String result;
		int res = sqlSession.insert("writeClass", cdto);
		
		if(res == 1) {
			result = "success";
		} else {
			result = "failed";
		}
		return result;
	}	

	// 강좌 삭제
	@Override
	public void deleteClass(int cId) {
		int res = sqlSession.delete("deleteClass", cId);
	}

	// 강좌 수정
	@Override
	public void modifyClass(ClassDto cdto) {
		int res = sqlSession.update("modifyClass", cdto);
	}
	
	// 강좌 검색
	@Override
	public ArrayList<ClassDto> searchClass(ClassDto cdto) {
		ArrayList<ClassDto> result = (ArrayList)sqlSession.selectList("searchClass", cdto);
		return result;
	}
	
	
																			/* 문화 행사 */
	// 행사 목록
	@Override
	public ArrayList<EventDto> eventList() {
		ArrayList<EventDto> result = (ArrayList)sqlSession.selectList("eventList");
		return result;
	}
	
	// 행사 상세 보기
	@Override
	public EventDto eContentView(int eId) {
		EventDto result = sqlSession.selectOne("eContentView", eId);
		return result;
	}
	
	// 행사 등록
	@Override
	public String writeEvent(EventDto edto) {
		String result;
		int res = sqlSession.insert("writeEvent", edto);
		
		if (res == 1) {
			result = "success";
		} else {
			result = "failed";
		}
		return result;
	}
	
	// 행사 삭제
	@Override
	public void deleteEvent(int eId) {
		int res = sqlSession.delete("deleteEvent", eId);
	}
	
	// 행사 수정
	@Override
	public void modifyEvent(EventDto edto) {
		int res = sqlSession.update("modifyEvent", edto);
	}
	
	// 행사 관리 페이징
	@Override
	public ArrayList<EventDto> ePageList(String pageNo) {
		// TODO Auto-generated method stub
		System.out.println("행사 페이징 실행");
		int page = Integer.parseInt(pageNo);
		int startNo = (page-1)*7 + 1;
		System.out.println("startNo : " + startNo);
		ArrayList<EventDto> result = (ArrayList)sqlSession.selectList("ePageList", startNo);
		return result;
	}
	
	// 행사 검색
	@Override
	public ArrayList<EventDto> searchEvent(EventDto edto) {
		ArrayList<EventDto> result = (ArrayList)sqlSession.selectList("searchEvent", edto);
		return result;
	}
	
	// 메인 행사 배너 3개
	@Override
	public ArrayList<EventDto> eventList3() {
		System.out.println("eventList3");
		ArrayList<EventDto> dtos = (ArrayList)sqlSession.selectList("eventList3");
		
		return dtos;
	}
	
	
	
	
	
																			/* 관리 페이지 */
	
	//도서관리 리스트 불러오기
	@Override
	public ArrayList<BookListDto> bookList() {
		System.out.println("bookList");
		ArrayList<BookListDto> dtos = (ArrayList)sqlSession.selectList("bookList");
		
		return dtos;
	}
		
	// 관리페이지 회원관리 회원 리스트
	@Override
	public ArrayList<LibUserDto> userList() {
		ArrayList<LibUserDto> dto = (ArrayList)sqlSession.selectList("userList");
		return dto;
	}
	
	//회원 리스트 페이징
	@Override
	public ArrayList<LibUserDto> userPageList(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		
		ArrayList<LibUserDto> result = (ArrayList)sqlSession.selectList("userPageList", startNo);
		
		return result;
	}
	
	//권한변경(관리자)
	@Override
	public void authorityChange(LibUserDto dto) {
		sqlSession.update("authorityChange", dto);
	}
	
	//권한변경(일반회원)
	@Override
	public void authorityChange2(LibUserDto dto) {
		sqlSession.update("authorityChange2", dto);
	}
	
	//회원 검색
	@Override
	public ArrayList<LibUserDto> adminUserSearch(LibUserDto dto) {
		ArrayList<LibUserDto> result = (ArrayList)sqlSession.selectList("adminUserSearch", dto);
		return result;
	}
	
	//회원 상세정보
	@Override
	public LibUserDto userDetail_view(String pid) {
		LibUserDto dto = sqlSession.selectOne("userDetail", pid);
		
		return dto;
	}
	
	//회원탈퇴(어드민권한)
	@Override
	public void adminUserDelete(String pid) {
		int res = sqlSession.delete("adminUserDelete", pid);
	}
	
	//도서 정보 수정
	@Override
	public void bookModify(BookListDto dto) {
		sqlSession.update("bookModify", dto);
	}
	
	//도서 삭제
	@Override
	public void bookDel(BookListDto dto) {
		sqlSession.delete("bookDel", dto);
	}
	
	//도서관리 페이징
	@Override
	public ArrayList<BookListDto> aBookPList(String pageNo) {
		
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("aBookPList", startNo); 
		
		return result;
	}
	
	//도서관리 검색
	@Override
	public ArrayList<BookListDto> adminBookSearch(BookListDto dto) {
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("adminBookSearch", dto);
		return result;
	}
	
	//캘린더 insert
	@Override
	public void calendarInsert(LibCalendarDto dto) {
		int res = sqlSession.insert("calendarInsert", dto);
	}
	
	//캘린더 리스트
	@Override
	public ArrayList<LibCalendarDto> calendarList(String cId) {
		System.out.println("캘린더 리스트 메서드");
		
		ArrayList<LibCalendarDto> list = (ArrayList)sqlSession.selectList("calendarList", cId);
		return list;
	}
	
	//캘린더 수정
	@Override
	public void calendarUpdate(LibCalendarDto dto) {
		System.out.println("캘린더 수정 메서드");
		
		int res = sqlSession.update("calendarUpdate", dto);
	}
	
	//캘린더 삭제
	@Override
	public void calendarDelete(LibCalendarDto dto) {
		System.out.println("캘린더 삭제 메서드");
		
		int res = sqlSession.delete("calendarDelete", dto);
	}
	
	//대출내역 리스트 불러오기
	@Override
	public ArrayList<BookBorrowListDto> adminBorrowList() {
		System.out.println("adminBorrowList");
		ArrayList<BookBorrowListDto> dtos = (ArrayList)sqlSession.selectList("adminBorrowList");
		
		return dtos;
	}
	
	// 대출내역 페이징
	@Override
	public ArrayList<BookBorrowListDto> aBorrowPList(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookBorrowListDto> result = (ArrayList)sqlSession.selectList("aBorrowPList", startNo); 
		
		return result;
	}
	
	//대출내역 검색
	@Override
	public ArrayList<BookBorrowListDto> adminBorrowSearch(BookBorrowListDto dto) {
		ArrayList<BookBorrowListDto> result = (ArrayList)sqlSession.selectList("adminBorrowSearch", dto);
		return result;
	}
	
	
																	/* 희망도서 신청 */
	//희망도서 신청
	public void bookApplication(BookApplicationDto dto) {
		System.out.println("희망도서 신청 메서드");
		
		sqlSession.insert("bookApplication", dto);
	}
	
	//희망도서 목록
	public ArrayList<BookApplicationDto> adminApplication() {
		System.out.println("희망도서 목록 메서드");
		ArrayList<BookApplicationDto> dtos = (ArrayList)sqlSession.selectList("adminApplication");
		
		return dtos;
	}
	
	//희망도서관리 페이징
	@Override
	public ArrayList<BookApplicationDto> adminAppList(String pageNo) {
		
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookApplicationDto> result = (ArrayList)sqlSession.selectList("adminAppList", startNo); 
		
		return result;
	}
	
	//희망도서 처리상태 변경
	@Override
	public void appStateChange(BookApplicationDto dto) {
		sqlSession.update("appStateChange", dto);
	}

	
																			/* 마이페이지 */
	//마이페이지 희망도서 목록
	public ArrayList<BookApplicationDto> userApplication(String user_id) {
		System.out.println("회원 희망도서 목록 메서드");
		ArrayList<BookApplicationDto> dtos = (ArrayList)sqlSession.selectList("userApplication", user_id);
		
		return dtos;
	}
	
	//마이페이지 도서예약 목록
	public ArrayList<BookReservationDto> userReservation(String user_id) {
		System.out.println("회원 도서예약 목록 메서드");
		ArrayList<BookReservationDto> dtos = (ArrayList)sqlSession.selectList("userReservation", user_id);
		
		return dtos;
	}
	
	//예약 취소
	@Override
	public void userReservationCancel(int borrowId) {
		sqlSession.delete("userReservationCancel", borrowId);
	}
	
	//마이페이지 예약도서 대출
	@Override
	public void userBookBorrow(BookBorrowListDto dto) {
		sqlSession.insert("userBookBorrow", dto);
	}
	
	//마이페이지 대출내역
	public ArrayList<BookBorrowListDto> userBList(String user_id) {
		System.out.println("회원 대출 내역 메서드");
		ArrayList<BookBorrowListDto> dtos = (ArrayList)sqlSession.selectList("userBList", user_id);
		
		return dtos;
	}
	
																			/* 도서 예약 */
	//도서 예약
	@Override
	public void bookReservation(String reservationTitle, String reservationUser, int bookId, int borrowId, String callNum, String bookPossible, String writer) {
		BookReservationDto dto =new BookReservationDto(reservationTitle, reservationUser, bookId, borrowId, callNum, bookPossible, writer);
		sqlSession.insert("bookReservation", dto);
	}
	
	//예약상태 갱신
	@Override
	public void booking(BookBorrowInfoDto dto) {
		sqlSession.update("booking", dto);
	}
	
	//예약
	@Override
	public BookBorrowInfoDto bookReservationPage(int borrowId) {
		BookBorrowInfoDto dto = sqlSession.selectOne("bookReservationPage", borrowId);
		
		return dto;
	}
	
	//어드민 예약 목록
	public ArrayList<BookReservationDto> adminReservationList() {
		System.out.println("예약 목록 메서드");
		ArrayList<BookReservationDto> dtos = (ArrayList)sqlSession.selectList("adminReservationList");
		
		return dtos;
	}
	
	//예약 취소
	@Override
	public void adminReservationCancel(int borrowId) {
		sqlSession.delete("adminReservationCancel", borrowId);
	}
	
	//어드민 예약취소 시 예약상태 변경
	@Override
	public void adminReservationChange(BookBorrowInfoDto dto) {
		sqlSession.update("adminReservationChange", dto);
	}
	
	//예약 페이징
	@Override
	public ArrayList<BookReservationDto> adminReservationPageList(String pageNo) {
		
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		System.out.println("startNo: " + startNo);
		ArrayList<BookReservationDto> result = (ArrayList)sqlSession.selectList("adminReservationPageList", startNo); 
		
		return result;
	}
	
	//아이디 중복체크
	@Override
	public int reservation5Check(String reservationUser) {
		int result = sqlSession.selectOne("reservation5Check", reservationUser);
		System.out.println("result : " + result);
		return result;
	}
	
	// top-menu의 검색
	@Override
	public ArrayList<BookListDto> searchMain(BookListDto bdto) {
		System.out.println("검색하기 위해 SQL문을 실행합니다.");
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("searchMain", bdto);
		return result;
	}
	
	// 소장 자료 검색
	@Override
	public ArrayList<BookListDto> searchBook(BookListDto bdto) {
		System.out.println("소장 자료를 DB에서 검색합니다.");
		ArrayList<BookListDto> result = (ArrayList)sqlSession.selectList("searchBook", bdto);
		return result;
	}

}
