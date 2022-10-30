package com.team.lib.dao;

import java.util.ArrayList;

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

public interface ILibDao {
		
	public String join(LibUserDto dto); 				// 회원가입
	public int idCheck(String pid);						//아이디중복체크
	public LibUserDto login(String pid); 				// 로그인
	public ArrayList<LibUserDto> LibUserInfo(String pid);	// 회원정보 가져오기
	public void update(LibUserDto dto);					// 회원정보 수정
	public String pwCheck(String pid);					// 비밀번호 확인
	void update_pw(LibUserDto dto);						// 비밀번호 수정
	
	/* Q & A */
	public ArrayList<QnADto> qnaList(); 				// qna 목록
	public String writeQnAOK(QnADto dto); 				// qna 등록
	public QnADto qna_view(int qnaNo); 					// qna 상세보기
	public ArrayList<QnADto> qna_pageList(String pageNo);	// qna 페이징
	public void qnaModify(QnADto dto);					// qna 수정
	public void qnaDelete(int qnaNo);					// qna 삭제
	public void qnaAnswerOK(String answerWriter, String answerContent, int qnaNo); // qna 답변등록
	public QnAAnswerDto qna_answer(int qnaNo);			// qna 답변보기
	public ArrayList<QnADto> qnaSearch(QnADto dto);		// qna 검색
	
	/* 소장자료 검색 */
	public ArrayList<BookListDto> searchMain(BookListDto bdto);	 // top-menu의 검색
	// public ArrayList<BookListDto> searchPage(String pageNo);	 // top-menu의 검색 페이징 (보류) 
	public ArrayList<BookListDto> searchBook(BookListDto bdto);  // 소장자료 검색


	
	/* 도서 관련 */
	public ArrayList<BookListDto> bookNewList(); 			// 신간 도서 목록
	public ArrayList<BookListDto> newListSearch(BookListDto dto); //신간도서 검색
	public ArrayList<BookListDto> bookList4();			// 신간 도서 메인 4개 출력
	public ArrayList<BookListDto> newList_page(String pageNo); // 신간도서 페이징
	public String bookRegistration(BookListDto dto); 	// 도서 등록
	public BookListDto content_view(int bookId); 		// 도서 상세 보기
	public void bookComment(String commentWriter, String commentContent, int bookId); // 도서 서평 등록
	public ArrayList<BookCommentDto> book_comment(int bookId);		// 도서 서평 보기
	public void commentDel(BookCommentDto dto);			// 서평 삭제
	public ArrayList<BookBorrowInfoDto> bookBorrowInfo(int bookId); //도서 소장 현황
	public void plus_possession(String organName, String referenceRoom,  //도서 소장 등록
			String callNum, String regiNum, String bookPossible, String booking, int bookId);
	
	public ArrayList<BookListDto> recList();	  		// 추천 도서 목록
	public ArrayList<BookListDto> recListSearch(BookListDto dto); //신간도서 검색
	public ArrayList<BookListDto> recBookList4();		// 추천 도서 메인 4개 출력
	public ArrayList<BookListDto> recList_page(String pageNo); // 추천도서 페이징
	public ArrayList<BookListDto> bookBestList(); 		// 베스트셀러 목록
	public ArrayList<BookListDto> bestSellerSearch(BookListDto dto); //베스트셀러 검색
	public ArrayList<BookListDto> bestBookList4();		// 베스트셀러 메인 4개 출력
	public ArrayList<BookListDto> bestList_page(String pageNo); // 베스트셀러 페이징
	
	/* 공지 사항 */
	public ArrayList<nDto> nList();		  				// 목록
	public ArrayList<nDto> nPageList(String pageNo);	// 목록 페이징
	public nDto nContentView(int nId);	  				// 게시물 보기
	public void writeNotice(nDto nDto);				// 게시물 작성
	public void modifyN(nDto ndto);						// 게시물 수정
	public nDto noticeModify(String nId);				// 수정 페이지 보기
	public void deleteN(int nId);						// 게시물 삭제
	public ArrayList<nDto> noticeList4();				// 공지 메인에 4개 출력

	
	/* 강좌 관련 */
	public ArrayList<ClassDto> cList();					// 목록 
	public ArrayList<ClassDto> cPageList(String pageNo); // 강좌 페이징
	public ClassDto cContentView(int cId);				// 강좌 상세 보기
	public String writeClass(ClassDto cdto);			// 강좌 등록
	public void deleteClass(int cId);					// 강좌 삭제
	public void modifyClass(ClassDto cdto);				// 강좌 수정
	public ArrayList<ClassDto> searchClass(ClassDto cdto); // 강좌 검색
	
	/* 문화 행사 */
	public ArrayList<EventDto> eventList();					// 목록
	public EventDto eContentView(int eId);					// 행사 상세 보기
	public String writeEvent(EventDto edto);				// 행사 등록
	public void deleteEvent(int eId);						// 행사 삭제
	public void modifyEvent(EventDto edto);					// 행사 수정
	public ArrayList<EventDto> ePageList(String pageNo);	// 행사 목록 페이징
	public ArrayList<EventDto> searchEvent(EventDto edto);	// 행사 검색
	public ArrayList<EventDto> eventList3();				// 메인 행사 배너
	
	/* 관리 페이지 */
	public ArrayList<BookListDto> bookList();			//도서관리
	public ArrayList<LibUserDto> userList();			// 회원관리 페이지 회원 리스트
	public ArrayList<LibUserDto> userPageList(String pageNo); // 회원관리 페이지 회원 리스트 페이징
	public void authorityChange(LibUserDto dto);		//권한변경(관리자)
	public void authorityChange2(LibUserDto dto);		//권한변경(일반회원)
	public ArrayList<LibUserDto> adminUserSearch(LibUserDto dto); //회원검색
	public LibUserDto userDetail_view(String pid); 		// 회원 상세정보
	public void adminUserDelete(String pid);			// 회원탈퇴(어드민권한)
	public void bookModify(BookListDto dto); 			//도서 정보 수정
	public void bookDel(BookListDto dto);				//도서 삭제
	public ArrayList<BookListDto> aBookPList(String pageNo); //도서관리 페이지
	public ArrayList<BookListDto> adminBookSearch(BookListDto dto);	// 도서관리 검색
	public void adminBookBorrow(BookBorrowListDto dto); //도서대출
	public void bookBorrow(BookBorrowInfoDto dto);  	//도서 대출 상태
	public void bookReturn(BookBorrowInfoDto dto);  	//도서 반납
	public void bookReservationState(BookReservationDto dto);  	//도서 대출시 예약페이지의 대출상태 변경
	public void bookReservationState2(BookReservationDto dto);  //도서 반납시 예약페이지의 대출상태 변경
	public ArrayList<BookBorrowListDto> adminBorrowList(); //전체대출목록
	public ArrayList<BookBorrowListDto> aBorrowPList(String pageNo); //전체대출 페이징
	public ArrayList<BookBorrowListDto> adminBorrowSearch(BookBorrowListDto dto);	//전체대출 검색
	public void adminBookRendre(BookBorrowListDto dto);	//반납			
	
	/* 캘린더 */
	public void calendarInsert(LibCalendarDto dto);		//일정추가
	public ArrayList<LibCalendarDto> calendarList(String cId); //캘린더 리스트
	public void calendarUpdate(LibCalendarDto dto);		//캘린더 수정
	public void calendarDelete(LibCalendarDto dto);		//캘린더 삭제
	
	/* 희망도서 */
	public void bookApplication(BookApplicationDto dto); //희망도서 신청
	public ArrayList<BookApplicationDto> adminApplication(); //어드민 희망도서 목록
	public ArrayList<BookApplicationDto> adminAppList(String pageNo); //희망도서 페이징
	public void appStateChange(BookApplicationDto dto);	//희망도서 처리상태 변경

	/* 마이페이지 */
	public ArrayList<BookApplicationDto> userApplication(String user_id); //희망도서신청내역
	public ArrayList<BookReservationDto> userReservation(String user_id); //도서예약신청내역
	public ArrayList<BookBorrowListDto> userBList(String user_id); //대출내역
	public void userReservationCancel(int borrowId); //예약 취소
	public void userBookBorrow(BookBorrowListDto dto); //예약도서 대출
	
	/* 도서 예약 */
	public void bookReservation(String reservationTitle, String reservationUser, int bookId, int borrowId, String callNum, String bookPossible, String writer); //예약
	public void booking(BookBorrowInfoDto dto); //예약상태변경
	public BookBorrowInfoDto bookReservationPage(int borrowId); //예약
	public ArrayList<BookReservationDto> adminReservationList(); //어드민 예약 목록
	public void adminReservationCancel(int borrowId); //어드민 예약 취소
	public void adminReservationChange(BookBorrowInfoDto dto);	//어드민 예약 취소시 예약상태 변경
	public ArrayList<BookReservationDto> adminReservationPageList(String pageNo); //예약 페이징
	public int reservation5Check(String reservationUser);	//아이디중복체크
}
