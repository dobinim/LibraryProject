package com.team.lib.controller;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.lib.command.AdminAuthority2Command;
import com.team.lib.command.AdminAuthorityCommand;
import com.team.lib.command.AdminBookAppPageCommand;
import com.team.lib.command.AdminBookAppStateCommand;
import com.team.lib.command.AdminBookApplicationCommand;
import com.team.lib.command.AdminBookPageCommand;
import com.team.lib.command.AdminBookReservationCancelCommand;
import com.team.lib.command.AdminBookReservationChangeCommand;
import com.team.lib.command.AdminBookReservationListCommand;
import com.team.lib.command.AdminBookReservationPageCommand;
import com.team.lib.command.AdminBorrowListCommand;
import com.team.lib.command.AdminBorrowPageCommand;
import com.team.lib.command.AdminUserDeleteCommand;
import com.team.lib.command.AdminUserPageCommand;
import com.team.lib.command.AdminUsercommand;
import com.team.lib.command.BestsellerViewPageCommand;
import com.team.lib.command.BookApplicationCommand;
import com.team.lib.command.BookBestList4Command;
import com.team.lib.command.BookBestListCommand;
import com.team.lib.command.BookBookingCommand;
import com.team.lib.command.BookBorrowCommand;
import com.team.lib.command.BookBorrowInfoViewCommand;
import com.team.lib.command.BookBorrowStateCommand;
import com.team.lib.command.BookCommentCommand;
import com.team.lib.command.BookCommentDelCommand;
import com.team.lib.command.BookCommentViewCommand;
import com.team.lib.command.BookContentViewCommand;
import com.team.lib.command.BookDelCommand;
import com.team.lib.command.BookList4Command;
import com.team.lib.command.BookListCommand;
import com.team.lib.command.BookModiCommand;
import com.team.lib.command.BookNewListCommand;
import com.team.lib.command.BookPossessionCommand;
import com.team.lib.command.BookRecList4Command;
import com.team.lib.command.BookRegistrationCommand;
import com.team.lib.command.BookRendreCommand;
import com.team.lib.command.BookReservationCommand;
import com.team.lib.command.BookReservationPageCommand;
import com.team.lib.command.BookReservationState2Command;
import com.team.lib.command.BookReservationStateCommand;
import com.team.lib.command.BookReturnCommand;
import com.team.lib.command.CalendarDeleteCommand;
import com.team.lib.command.CalendarInsertCommand;
import com.team.lib.command.CalendarListCommand;
import com.team.lib.command.CalendarUpdateCommand;
import com.team.lib.command.ClassContentCommand;
import com.team.lib.command.ClassDeleteCommand;
import com.team.lib.command.ClassListCommand;
import com.team.lib.command.ClassModifyCommand;
import com.team.lib.command.ClassPageListCommand;
import com.team.lib.command.ClassWriteCommand;
import com.team.lib.command.EventContentCommand;
import com.team.lib.command.EventDeleteCommand;
import com.team.lib.command.EventList3Command;
import com.team.lib.command.EventListCommand;
import com.team.lib.command.EventModifyCommand;
import com.team.lib.command.EventPageListCommand;
import com.team.lib.command.EventWriteCommand;
import com.team.lib.command.LibCommand;
import com.team.lib.command.LibJoinCommand;
import com.team.lib.command.LibUpdateCommand;
import com.team.lib.command.LibUpdatePwCommand;
import com.team.lib.command.NContentCommand;
import com.team.lib.command.NewListViewPageCommand;
import com.team.lib.command.NoticeDeleteCommand;
import com.team.lib.command.NoticeList4Command;
import com.team.lib.command.NoticeListCommand;
import com.team.lib.command.NoticeModifyCommand;
import com.team.lib.command.NoticePageListCommand;
import com.team.lib.command.NoticeWriteCommand;
import com.team.lib.command.QnAAnswerCommand;
import com.team.lib.command.QnAAnswerViewCommand;
import com.team.lib.command.QnACommand;
import com.team.lib.command.QnADeleteCommand;
import com.team.lib.command.QnAModifyCommand;
import com.team.lib.command.QnAViewCommand;
import com.team.lib.command.QnAViewPageCommand;
import com.team.lib.command.QnAWriteCommand;
import com.team.lib.command.RecListViewPageCommand;
import com.team.lib.command.SearchCommand;
import com.team.lib.command.UserBookApplicationCommand;
import com.team.lib.command.UserBookBorrowListCommand;
import com.team.lib.command.UserBookReservationCommand;
import com.team.lib.command.UserInfoCommand;
import com.team.lib.command.UserMyBookBorrowCommand;
import com.team.lib.command.UserReservationCancelCommand;
import com.team.lib.command.UserViewCommand;
import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookApplicationDto;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.dto.BookListDto;
import com.team.lib.dto.ClassDto;
import com.team.lib.dto.EventDto;
import com.team.lib.dto.LibCalendarDto;
import com.team.lib.dto.LibUserDto;
import com.team.lib.dto.QnADto;
import com.team.lib.dto.nDto;
import com.team.lib.util.Constant;

@Controller
public class LibController {
	
	private LibCommand com;
	
	//암호화 bean 주입
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	
	//Dao 주입
	private LibDao ldao;
	@Autowired
	public void setLDao(LibDao ldao) {
		this.ldao = ldao;
		Constant.ldao = ldao;
	}
	
	//로고 메인 이동
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Model model) {
		System.out.println("메인페이지로 이동");
		
		com = new BookList4Command();
		com.execute(request, model);
		com = new BookRecList4Command();
		com.execute(request, model);
		com = new BookBestList4Command();
		com.execute(request, model);
		com = new NoticeList4Command();
		com.execute(request, model);
		com = new EventList3Command();
		com.execute(request, model);
		
		return "home_view";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/join_view")
	public String join_view() {
		return "join_view";
	}
	
	//회원가입 실행
	@RequestMapping(value="/join", produces="application/text;charset=UTF8")
	@ResponseBody
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("회원가입 실행");
		
		com = new LibJoinCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		
		if(result.equals("success")) {
			return "join_success";
		}
		else {
			return "join_failed";
		}
	}
	
	//아이디 중복체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("pid") String pid) {
		
		int cnt = ldao.idCheck(pid);
		return cnt;
	}
	
	//회원정보 수정 페이지 이동
	@RequestMapping("/update_view")
	public String updateInfo(HttpServletRequest request, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		request.setAttribute("pid", username);
		
		com = new UserInfoCommand();
		com.execute(request, model);
		
		return "update_view";
	}
	
	//회원정보 수정
	@RequestMapping(value="/update", produces="application/text;charset=UTF8")
	public String update(HttpServletRequest request, Model model) {
		System.out.println("회원정보 수정 실행");
		
		com = new LibUpdateCommand();
		com.execute(request, model);
		
		return "main_view";
	}
	
	//비밀번호 수정 페이지 이동
	@RequestMapping("/updatePw_view")
	public String updatePw_view(HttpServletRequest request, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		request.setAttribute("pid", username);
		
		com = new UserInfoCommand();
		com.execute(request, model);
		
		return "updatePw_view";
	}
	
	//비밀번호 확인
	@RequestMapping("/pwCheck")
	@ResponseBody
	public boolean pwCheck(@RequestParam("inputPw") String inputPw, HttpServletRequest request, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		String userPw = ldao.pwCheck(username);
		
		System.out.println("userPw" + userPw);
		System.out.println("inputPw" + inputPw);
		
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		boolean isPw = passwordEncoder.matches(inputPw, userPw);
		System.out.println(isPw);
		return isPw;
		
	}
	
	//비밀번호 수정
	@RequestMapping(value="/updatePw", produces="application/text;charset=UTF8")
	public String updatePw(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("비밀번호 수정 실행");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		request.setAttribute("pid", username);
		
		com = new LibUpdatePwCommand();
		com.execute(request, model);
		
		return "main_view";
	}
	
	//마이페이지
	@RequestMapping("/myPage")
	public String myPage() {
		System.out.println("마이페이지");
		
		return "myPage_view";
	}
	
	//마이페이지 희망도서,예약
	@RequestMapping("/applist")
	public String applist(HttpServletRequest request, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		System.out.println("마이페이지 희망도서, 예약");
		
		com = new UserBookApplicationCommand();
		com.execute(request, model);
		com = new UserBookReservationCommand();
		com.execute(request, model);
		
		return "applist_view";
	}
	
	// 마이페이지 예약 취소
	@RequestMapping(value="/userReservationCancel", produces="application/text;charset=UTF8")
	public String userReservationCancel(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("회원 예약 취소");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		com = new UserReservationCancelCommand();
		com.execute(request, model);
		com = new AdminBookReservationChangeCommand();
		com.execute(request, model);
		com = new UserBookApplicationCommand();
		com.execute(request, model);
		com = new UserBookReservationCommand();
		com.execute(request, model);
		
		return "applist_view";
		
	}
	
	//에러페이지
	@RequestMapping("/error500")
	public String error500() {
		System.out.println("500에러");
		
		return "error500_view";
	}
	
	@RequestMapping("/error404")
	public String error404() {
		System.out.println("404에러");
		
		return "error404_view";
	}
	
	
																		/* 로그인 & 로그아웃 */
	//로그인 페이지 이동
	@RequestMapping("/login_view")
	public String login_view() {
		System.out.println("login");
		return "login_view";
	}
	
	//로그인 성공
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model, Authentication authentication) {
		getUsername(authentication, request);
		String username = (String)request.getAttribute("username");
		String auth = (String)request.getAttribute("auth");
		
		com = new BookList4Command();
		com.execute(request, model);
		com = new BookRecList4Command();
		com.execute(request, model);
		com = new BookBestList4Command();
		com.execute(request, model);
		com = new NoticeList4Command();
		com.execute(request, model);
		com = new EventList3Command();
		com.execute(request, model);
		
		return "main_view";
	}
	
	//로그인 메서드
	private void getUsername(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername(); 
		System.out.println(userDetails.getUsername()); //로그인한 아이디
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		String auth = authorities.toString();
		System.out.println(auth); //[ROLE_USER] 형태
		
		request.setAttribute("username", username);
		request.setAttribute("auth", auth);
	}
	
	//로그인 실패
	@RequestMapping("/processLogin")
	public ModelAndView processLogin(
			@RequestParam(value="log", required=false) String log,
			@RequestParam(value="error", required=false) String error,
			@RequestParam(value="logout", required=false) String logout,
			HttpSession session, Model pmodel
			) {
		
		System.out.println("prosessLogin");
		ModelAndView model = new ModelAndView();
		
		if(log != null && log != "") {
			model.addObject("log", "before login!");
		}
		if(error != null && error != "") {
			model.addObject("error", "Invalid username or password!");
		}
		if(logout != null && logout != "") { 
			model.addObject("logout", "You've been logged out successfuly.");
		}
		
		model.setViewName("login_view"); 
		return model;
	}
	
	//로그아웃
	@RequestMapping("/logout_view")
	public String logout_view() {
		System.out.println("logout");
		return "logout_view";
	}
	
																		/* 자료 검색 */
	// top-menu의 검색창으로 검색하기
	@RequestMapping("/searchtop")
	public String searchtop(HttpServletRequest request, Model model) {
		System.out.println("탑메뉴의 검색창으로 검색");
		
		com = new BookNewListCommand();
		com.execute(request, model);
		com = new SearchCommand();
		com.execute(request, model);
		
		return "searchMain_view";
	}
	
	// 소장 자료 검색
	@RequestMapping("/searchBook")
	@ResponseBody
	public ArrayList<BookListDto> searchBook(@RequestParam("srchtype1") String srchtype1, @RequestParam("srchtype2") String srchtype2, @RequestParam("srchtype3") String srchtype3, 
			@RequestParam("srchkeyword1") String srchkeyword1, @RequestParam("srchkeyword2") String srchkeyword2, @RequestParam("srchkeyword3") String srchkeyword3, @RequestParam("genre") String[] genre, Model model) throws Exception {
		System.out.println("소장 자료를 검색합니다.");

		BookListDto bdto = new BookListDto();
		bdto.setSrchtype1(srchtype1);
		bdto.setSrchtype2(srchtype2);
		bdto.setSrchtype3(srchtype3);
		bdto.setSrchkeyword1(srchkeyword1);
		bdto.setSrchkeyword2(srchkeyword2);
		bdto.setSrchkeyword3(srchkeyword3);
		System.out.println("찍어보기 : " + genre[0]);
		bdto.setGenreList(genre);

		
		
		ArrayList<BookListDto> result =  ldao.searchBook(bdto);
		return result;

	}
	
	
	
																		/* 페이지 이동 */
	//검색 페이지 이동
	@RequestMapping("/search")
	public String search() {
		System.out.println("검색 페이지 이동");
		return "search_view";
	}
	
	//도서관 소개 페이지 이동
	@RequestMapping("/introduction")
	public String introduction() {
		System.out.println("소개 페이지 이동");
		return "introduction_view";
	}
	
	//오시는 길 페이지 이동
	@RequestMapping("/map")
	public String map() {
		System.out.println("map");
		return "map_view";
	}
	
	//도서일정 페이지 이동
	@RequestMapping("/libCalendar")
	public String libCalendar() {
		System.out.println("도서 일정 페이지 이동");
		return "libCalendar_view";
	}
	
	//마이페이지(대출내역) 페이지 이동
	@RequestMapping("/borrowlist")
	public String borrowlist(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("회원 대출 내역");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		com = new UserBookBorrowListCommand();
		com.execute(request, model);
		
		return "borrowlist_view";
	}
	
	//희망 도서 신청 페이지 이동
	@RequestMapping("/application")
	public String application() {
		System.out.println("application");
		return "application_view";
	}
	
																		/* Q & A */
	//QnA 리스트 불러오기
	@RequestMapping("/qnaList")
	public String qnaList(HttpServletRequest request, Model model) {
		System.out.println("QnA페이지 이동");
		
		com = new QnACommand();
		com.execute(request, model);
		
		return "qnaList_view";
	}
	
	//QnA작성 페이지 이동
	@RequestMapping("/writeQnA")
	public String writeQnA() {
		System.out.println("QnA작성 페이지 이동");
		return "writeQnA";
	}
	
	//QnA 등록
	@RequestMapping(value="/writeQnAOK", produces="application/text;charset=UTF8")
	@ResponseBody
	public String writeQnAOK(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("질문 등록");
		
		com = new QnAWriteCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		
		if(result.equals("success")) {
			return "qnaWrite_success";
		}
		else {
			return "qnaWrite_failed";
		}
	}
	
	//QnA 상세보기
	@RequestMapping("/qna_view")
	public String qna_view(HttpServletRequest request, Model model) {
		System.out.println("문의 상세보기");
		
		com = new QnAViewCommand();
		com.execute(request, model);
		com = new QnAAnswerViewCommand();
		com.execute(request, model);
		
		if(model.containsAttribute("qna_view")) {
			return "qna_view";
		}
		else {
			return "redirect:qnaList";
		}
	}
	
	//QnA 페이징
	@RequestMapping("/plist")
	public String purl(HttpServletRequest request, Model model) {
		System.out.println("qna페이지 " + request.getParameter("pageNo"));
		
		com = new QnAViewPageCommand();
		com.execute(request, model);
		
		return "qnaPage_view";
	}
	
	//QnA수정 페이지
	@RequestMapping("/qnaModifyPage")
	public String qnaModifyPage(HttpServletRequest request, Model model) {
		System.out.println("qna 수정 페이지");
		
		com = new QnAViewCommand();
		com.execute(request, model);
		
		return "qnaModify";
	}
	
	//QnA 수정
	@RequestMapping(value="/qnaModify", produces="application/text;charset=UTF8")
	public String qnaModify(HttpServletRequest request, Model model) {
		System.out.println("qna 수정");
		
		com = new QnAModifyCommand();
		com.execute(request, model);
		com = new QnACommand();
		com.execute(request, model);
		
		return "qnaList_view";
	}
	
	//QnA 삭제
	@RequestMapping(value="/qnaDelete", produces="application/text;charset=UTF8")
	public String qnaDelete(HttpServletRequest request, Model model) {
		System.out.println("qna 삭제");
		
		com = new QnADeleteCommand();
		com.execute(request, model);
		com = new QnACommand();
		com.execute(request, model);
		
		return "qnaList_view";
	}
	
	//QnA 답변 페이지 이동
	@RequestMapping("/qnaAnswer")
	public String qnaAnswer(HttpServletRequest request, Model model) {
		System.out.println("qnaAnswer 페이지");
		
		com = new QnAViewCommand();
		com.execute(request, model); 
		
		return "qnaAnswer";
	}
	
	//QnA 답변 등록
	@RequestMapping(value="/qnaAnswerOK", produces="application/text;charset=UTF8")
	public String qnaAnswerOK(HttpServletRequest request, Model model) {
		
		com = new QnAAnswerCommand();
		com.execute(request, model);
		com = new QnAViewCommand();
		com.execute(request, model);
		com = new QnAAnswerViewCommand();
		com.execute(request, model);
		
		return "qna_view";
	}
	
	//QnA 검색
	@RequestMapping("qnaSearch")
	@ResponseBody
	public ArrayList<QnADto> qnaSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		QnADto dto = new QnADto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<QnADto> result =  ldao.qnaSearch(dto);
		return result;
		
	}
	
																			/* 공지사항 */
	// 공지사항 목록 불러오기
	@RequestMapping("/nList")
	public String nList(HttpServletRequest request, Model model) {
		System.out.println("공지사항 목록 불러오기");
		com = new NoticeListCommand();
		System.out.println("com : " + com);
		com.execute(request, model);
		return "noticeList_view";
	}
	
	// 공지사항 페이지 넘기기
	@RequestMapping("/nPlist")
	public String plink(HttpServletRequest request, Model model) {
		System.out.println("nPlist 요청");
		com = new NoticePageListCommand();
		com.execute(request, model);
		return "nListPage_view";
	}
	
	// 공지 사항 상세 보기
	@RequestMapping("/nContentView")
	public String nContentView(HttpServletRequest request, Model model) {
		System.out.println("공지사항 상세 페이지 이동");
		com = new NContentCommand();
		com.execute(request, model);
		return "notice_view";
	}
	
	// 공지 사항 등록 페이지 이동
	@RequestMapping("/noticeRegister")
	public String noticeRegister() {
		return "noticeRegister";
	}
	
	// 공지 사항 등록 
	@RequestMapping(value = "/writeNotice", produces = "application/text; charset=UTF-8")
	public String writeNotice(nDto ndto, HttpServletRequest request, Model model) {
		System.out.println("CK Editor를 적용해 공지사항 작성");
		request.setAttribute("nDto", ndto);
		
		com = new NoticeWriteCommand();
		com.execute(request, model);
		com = new NoticeListCommand();
		com.execute(request, model);
		
		return "noticeList_view";
	}
	
	// 공지 사항 등록 2 
	@RequestMapping("/nCkedit")
	// security에 security="none"적용
	public void nCkedit(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("공지사항 작성 시 업로드 되는 파일 처리");
		String path = "/lib/upnotice";
		String real_save_path = request.getServletContext().getRealPath(path);
		System.out.println("real_save_path : " + real_save_path);
		
		MultipartFile mf = request.getFile("upload");
		String originFileName = mf.getOriginalFilename();
		long fileSize = mf.getSize();
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);
		
		String uuid = UUID.randomUUID().toString();
		
		String safeFile = "C:/Users/ky/Desktop/DOB/workspace/LibraryProject/src/main/webapp/resources/upnotice/" + uuid + originFileName;
		String safeFile1 =  "C:/KIMKIM/apache-tomcat-9.0.65/wtpwebapps/LibraryProject/resources/upnotice/" + uuid + originFileName;
		System.out.println("safeFile : " + safeFile);
		
		String changeFileName = uuid + originFileName;
		
		try {
			mf.transferTo(new File(safeFile));
			mf.transferTo(new File(safeFile1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* 저장한 후 CKEditor로 저장한 이미지를 보내 보여주는 작업을 하자. */
		JSONObject outData = new JSONObject();
		// JSONObject : 자바의 Object형과 유사하며, Map과 유사한 메서드를 사용한다 
		outData.put("uploaded", true);
		
		outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" 
					+ request.getServerPort() + path + "/" + changeFileName); // originFileName
		String url = (String)outData.get("url");
		System.out.println("이미지의 url은 " + url + "입니다.");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
				
	}
	
	
	/*
	 * // 공지 사항 등록
	 * 
	 * @RequestMapping(value = "/writeNotice", produces =
	 * "application/text; charset=UTF8") public String
	 * writeNotice(MultipartHttpServletRequest mtpR, Model model) throws Exception {
	 * System.out.println("공지 사항 등록"); String nTitle = mtpR.getParameter("nTitle");
	 * String nWriter = mtpR.getParameter("nWriter"); String nContent =
	 * mtpR.getParameter("nContent"); int nId = 0; String nFile = null; int nIndent
	 * = 0;
	 * 
	 * MultipartFile mf = mtpR.getFile("nFile"); System.out.println("mf : " + mf);
	 * 
	 * if (mf.isEmpty()) {
	 * 
	 * nDto ndto = new nDto(nId, nTitle, nWriter, nContent, nFile, nIndent); nFile =
	 * null; mtpR.setAttribute("ndto", ndto); com = new NoticeWriteCommand();
	 * com.execute(mtpR, model);
	 * 
	 * } else {
	 * 
	 * // 여기 경로를 본인 이클립스의 upFile 경로로 String path1 =
	 * "E:/학생방/MKM/workSpace/LibraryProject/src/main/webapp/resources/upimage/"; //
	 * 여기 경로를 본인 톰캣의 경로로 String path2 =
	 * "E:/moon/apache-tomcat-9.0.63/wtpwebapps/LibraryProject/resources/upimage/";
	 * 
	 * String originFileName = mf.getOriginalFilename(); long prename =
	 * System.currentTimeMillis(); long fileSize = mf.getSize();
	 * 
	 * String saveFile1 = path1 + prename + originFileName; String saveFile2 = path2
	 * + prename + originFileName;
	 * 
	 * nFile = prename + originFileName;
	 * 
	 * 
	 * nDto ndto = new nDto(nId, nTitle, nWriter, nContent, nFile, nIndent);
	 * mtpR.setAttribute("ndto", ndto); com = new NoticeWriteCommand();
	 * com.execute(mtpR, model);
	 * 
	 * Map<String, Object> map = model.asMap(); String res =
	 * (String)map.get("result"); System.out.println("Notice res : " + res); if
	 * (res.equals("success")) { try { mf.transferTo(new File(saveFile1));
	 * mf.transferTo(new File(saveFile2)); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * } // if(res.equals()) 의 끝
	 * 
	 * }
	 * 
	 * return "redirect:main";
	 * 
	 * }
	 */
	
	// 공지 게시물 수정 페이지 이동
	@RequestMapping("/noticeModify")
	public String noticeModify(HttpServletRequest request, Model model) {
		System.out.println("공지 수정 페이지 이동");
		com = new NContentCommand();
		com.execute(request, model);
		return "noticeModify_view";
		
	}
	
	// 공지 게시물 수정
	@RequestMapping(value = "/modifyN", produces = "application/text; charset=UTF8")
	public String modifyN(nDto ndto, HttpServletRequest request, Model model) {
		System.out.println("공지사항 수정 요청");
		
		request.setAttribute("nDto", ndto);
		
		com = new NoticeModifyCommand();
		com.execute(request, model);
		com = new NoticeListCommand();
		com.execute(request, model);
		return "noticeList_view";
	}
	
	// 공지 게시물 삭제
	@RequestMapping("/deleteN")
	public String deleteN(HttpServletRequest request, Model model) {
		System.out.println("공지사항 삭제 요청");
		com = new NoticeDeleteCommand();
		com.execute(request, model);
		com = new NoticeListCommand();
		com.execute(request, model);
		return "noticeList_view";
		
	}	
	
																			/* 도서 */
	// 신간도서 리스트
	@RequestMapping("/newList")
	public String newList(HttpServletRequest request, Model model) {
		System.out.println("신간도서 페이지 이동");
		
		com = new BookNewListCommand();
		com.execute(request, model);
		
		return "list_view";
	}
	
	//신간도서 검색
	@RequestMapping("newListSearch")
	@ResponseBody
	public ArrayList<BookListDto> newListSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		BookListDto dto = new BookListDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<BookListDto> result =  ldao.newListSearch(dto);
		return result;
		
	}	
	
	//신간도서 페이징
	@RequestMapping("/newListUrl")
	public String newListUrl(HttpServletRequest request, Model model) {
		System.out.println("신간도서 페이지 " + request.getParameter("pageNo"));
		
		com = new NewListViewPageCommand();
		com.execute(request, model);
		
		return "listPage_view";
	}
	
	// 추천 도서 리스트
	@RequestMapping("/recList")
	public String recList(HttpServletRequest request, Model model) {
		ArrayList<BookListDto> reclist = ldao.recList();
		model.addAttribute("recList", reclist);
		return "rec_booklist";
	}
	
	//추천도서 검색
	@RequestMapping("recListSearch")
	@ResponseBody
	public ArrayList<BookListDto> recListSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		BookListDto dto = new BookListDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<BookListDto> result =  ldao.recListSearch(dto);
		return result;
		
	}	
	
	//추천도서 페이징
	@RequestMapping("/recListUrl")
	public String recListUrl(HttpServletRequest request, Model model) {
		System.out.println("추천도서 페이지 " + request.getParameter("pageNo"));
		
		com = new RecListViewPageCommand();
		com.execute(request, model);
		
		return "rec_booklistPage";
	}
	
	// 베스트셀러 도서 리스트
	@RequestMapping("/bestsellerList")
	public String bestsellerList(HttpServletRequest request, Model model) {
		System.out.println("베스트셀러 페이지 이동");
		
		com = new BookBestListCommand();
		com.execute(request, model);
		
		return "bestsellerList_view";
	}
	
	//베스트셀러 검색
	@RequestMapping("bestSellerSearch")
	@ResponseBody
	public ArrayList<BookListDto> bestSellerSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		BookListDto dto = new BookListDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<BookListDto> result =  ldao.bestSellerSearch(dto);
		return result;
		
	}
	
	
	//베스트셀러 페이징
	@RequestMapping("/bestListUrl")
	public String bestListUrl(HttpServletRequest request, Model model) {
		System.out.println("베스트셀러 페이지 " + request.getParameter("pageNo"));
		
		com = new BestsellerViewPageCommand();
		com.execute(request, model);
		
		return "bestsellerListPage_view";
	}
	
	//도서 등록 페이지 이동
	@RequestMapping("/bookRegistration")
	public String bookRegistration() {
		System.out.println("도서 등록 페이지 이동");
		return "bookRegistration";
	}
	
	//도서 등록
	@RequestMapping("/bookRegistrationOK")
	public String bookRegistrationOK(MultipartHttpServletRequest mphr, Model model) {
		System.out.println("도서 등록");
		
		int bookId = 0;
		String bookTitle = mphr.getParameter("bookTitle");
		String bookOriTitle = mphr.getParameter("bookOriTitle");
		String writer = mphr.getParameter("writer");
		String bookType = mphr.getParameter("bookType");
		String publisher = mphr.getParameter("publisher");
		String form = mphr.getParameter("form");
		String isbn = mphr.getParameter("isbn");
		String bookContent = mphr.getParameter("bookContent");
		String bookWriter = mphr.getParameter("bookWriter");
		String bookIndex = mphr.getParameter("bookIndex");
		String genre = mphr.getParameter("genre");
		String year = mphr.getParameter("year");
		int recommended = 0;
		int bestseller = 0;
		
		String img = null;
		MultipartFile mf = mphr.getFile("img");
		
		// 여기 경로를 본인 이클립스의 upFile 경로로		
		String path1 = "C:/Users/ky/Desktop/DOB/workspace/LibraryProject/src/main/webapp/resources/upimage/";
		// 여기 경로를 본인 톰캣의 경로로
		String path2 = "C:/KIMKIM/apache-tomcat-9.0.65/wtpwebapps/LibraryProject/resources/upimage/";
			
		String originFileName = mf.getOriginalFilename();
		long prename = System.currentTimeMillis();
		long fileSize = mf.getSize();
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);
		
		String safeFile1 = path1 + prename + originFileName;
		String safeFile2 = path2 + prename + originFileName;
		
		img = prename + originFileName;
		
		BookListDto bdto = new BookListDto(bookId, bookTitle, bookOriTitle, writer, bookType, publisher, form, isbn, img, bookContent, bookWriter, bookIndex, genre, year, recommended, bestseller);
		mphr.setAttribute("bdto", bdto);
		
		com = new BookRegistrationCommand();
		com.execute(mphr, model);
		
		Map<String, Object> map = model.asMap();
		String res = (String)map.get("result");
		System.out.println("res : " + res);
		
		if(res.equals("success")) {
			try {
				mf.transferTo(new File(safeFile1));
				mf.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:main";
		}
		else {
			return "list_view";
		}
	}
	
	//도서 상세보기
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("도서정보 불러오기");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookCommentViewCommand();
		com.execute(request, model);
		com = new BookBorrowInfoViewCommand();
		com.execute(request, model);
		
		return "bookpage";
	}
	
	//도서 서평 등록
	@RequestMapping("/bookComment")
	public String bookComment(HttpServletRequest request, Model model) {
		System.out.println("도서 서평 등록");
		
		com = new BookCommentCommand();
		com.execute(request, model);
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookCommentViewCommand();
		com.execute(request, model);
		
		return "bookpage";
	}
	
	//서평 삭제
	@RequestMapping(value="/commentDel", produces="application/text;charset=UTF8")
	public String commentDel(HttpServletRequest request, Model model) {
		System.out.println("서평 삭제");
		
		com = new BookCommentDelCommand();
		com.execute(request, model);
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookCommentViewCommand();
		com.execute(request, model);
		
		return "bookpage";
	}
	
	
																			/* 문화 강좌 */
	// 강좌 목록 보기
	@RequestMapping("/cList")
	public String cList(HttpServletRequest request, Model model) {
		System.out.println("강좌 목록 보기");
		
		com = new ClassListCommand();
		com.execute(request, model);
		
		return "classList_view";
	}
	
	// 강좌 페이지 넘기기
	@RequestMapping("/cPlist")
	public String curl(HttpServletRequest request, Model model) {
		System.out.println("강좌 페이징 요청");
		com = new ClassPageListCommand();
		com.execute(request, model);
		return "cListPage_view";
	}
	
	
	// 강좌 상세 페이지 보기
	@RequestMapping("/cContentView")
	public String cContentView(HttpServletRequest request, Model model) {
		System.out.println("강좌 상세 페이지");
		
		com = new ClassContentCommand();
		com.execute(request, model);
		
		return "classContent_view";
	}
	
	// 강좌 등록 페이지 이동
	@RequestMapping("/cWrite")
	public String cWrite() {
		System.out.println("강좌 등록 페이지 이동");
		return "classWrite_view";
	}
	
	// 강좌 등록
	@RequestMapping(value = "/classWrite", produces = "application/text; charset = UTF8")
	public String classWrite(MultipartHttpServletRequest mtpR, Model model) {
		System.out.println("강좌 등록");
		
		int cId = 0;
		String cGroup = mtpR.getParameter("cGroup");
		String cTitle = mtpR.getParameter("cTitle");
		String cName = mtpR.getParameter("cName");
		String cStart = mtpR.getParameter("cStart");
		String cEnd = mtpR.getParameter("cEnd");
		String cStartReg = mtpR.getParameter("cStartReg");
		String cEndReg = mtpR.getParameter("cEndReg");
		String cNumber1 = mtpR.getParameter("cNumber");
		int cNumber = Integer.parseInt(cNumber1);
		String cPrice = mtpR.getParameter("cPrice");
		String cPlace = mtpR.getParameter("cPlace");
		String cHour = mtpR.getParameter("cHour");
		String cContent = mtpR.getParameter("cContent");
		
		String cPhoto = null;
		MultipartFile mf = mtpR.getFile("cPhoto");
		// 잘 나오는지 확인하기 위한 출력
		System.out.println("강좌 등록의 mf : " + mf);
		
		if (mf.isEmpty()) {
			
			ClassDto cdto = new ClassDto(cId, cName, cStartReg, cEndReg, cTitle, cContent, cStart, cEnd, cNumber, cPlace, cPrice, cPhoto, cHour, cGroup);
			cPhoto = null;
			mtpR.setAttribute("cdto", cdto);
			com = new ClassWriteCommand();
			com.execute(mtpR, model);
			
		} else {
			
			// 여기 경로를 본인 이클립스의 upFile 경로로		
			String path1 = "C:/Users/ky/Desktop/DOB/workspace/LibraryProject/src/main/webapp/resources/upclass/";
			// 여기 경로를 본인 톰캣의 경로로
			String path2 = "C:/KIMKIM/apache-tomcat-9.0.65/wtpwebapps/LibraryProject/resources/upclass/";
					

			String originFileName = mf.getOriginalFilename();
		
			long prename = System.currentTimeMillis();
			long fileSize = mf.getSize();
			
			String saveFile1 = path1 + prename + originFileName;
			String saveFile2 = path2 + prename + originFileName;
			
			cPhoto = prename + originFileName;
		
			
			ClassDto cdto = new ClassDto(cId, cName, cStartReg, cEndReg, cTitle, cContent, cStart, cEnd, cNumber, cPlace, cPrice, cPhoto, cHour, cGroup);
			mtpR.setAttribute("cdto", cdto);
			com = new ClassWriteCommand();
			com.execute(mtpR, model);
			
			Map<String, Object> map = model.asMap();
			String res = (String)map.get("result");
			System.out.println("Notice res : " + res);
			
			if (res.equals("success")) {
				try {
					mf.transferTo(new File(saveFile1));
					mf.transferTo(new File(saveFile2));
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			} // if 문의 끝
			
		} // else 끝
		return "redirect:main";
	} 
	
	// 강좌 수정 페이지 이동
	@RequestMapping("/modifyClass")
	public String modifyClass(HttpServletRequest request, Model model) {
		System.out.println("강좌 수정 페이지로 이동");
		com = new ClassContentCommand();
		com.execute(request, model);
		return "classModify_view";
	}
	
	// 강좌 수정
	@RequestMapping("/classModify")
	public String classModify(HttpServletRequest request, Model model) {
		System.out.println("강좌 수정");
		com = new ClassModifyCommand();
		com.execute(request, model);
		com = new ClassListCommand();
		com.execute(request, model);
		return "classList_view";
	}
	
	// 강좌 삭제
	@RequestMapping("/deleteClass")
	public String deleteClass(HttpServletRequest request, Model model) {
		System.out.println("강좌 삭제");
		com = new ClassDeleteCommand();
		com.execute(request, model);
		com = new ClassListCommand();
		com.execute(request, model);
		
		return "classList_view";
	}
	
	// 강좌 검색
	@RequestMapping("/searchClass")
	@ResponseBody
	public ArrayList<ClassDto> searchClass(@RequestParam("keyword") String keyword, Model model) throws Exception {
		System.out.println("강좌 검색 요청");
		ClassDto cdto = new ClassDto();
		cdto.setKeyword(keyword);
		ArrayList<ClassDto> result = ldao.searchClass(cdto);
		return result;
	}
	
	
																			/* 문화 행사 */
	// 행사 목록 페이지
	@RequestMapping("/eventList")
	public String eventList(HttpServletRequest request, Model model) {
		System.out.println("문화 행사 목록");
		com = new EventListCommand();
		com.execute(request, model);
		return "eventList_view";
	}
	
	// 행사 상세 보기
	@RequestMapping("/eContentView")
	public String eContentView(HttpServletRequest request, Model model) {
		System.out.println("행사 상세 보기");
		com = new EventContentCommand();
		com.execute(request, model);
		
		return "eventContent_view";
	}
	
	// 행사 작성 페이지 이동
		@RequestMapping("/eventRegister")
		public String eventRegister(HttpServletRequest request, Model model) {
			System.out.println("작성 페이지로 이동");
			return "eventWrite_view";
		}
		
	// 행사 등록
	@RequestMapping(value = "/eventWrite", produces = "application/text; charset=UTF-8")
	public String eventWrite(MultipartHttpServletRequest mtpR, Model model) {
		System.out.println("행사 등록 완료");
		
		int eId = 0;
		String eTitle = mtpR.getParameter("eTitle");
		String eGroup = mtpR.getParameter("eGroup");
		String eContent = mtpR.getParameter("eContent");
		String eWriteDate = mtpR.getParameter("eWriteDate");
		String eStartReg = mtpR.getParameter("eStartReg");
		String eEndReg = mtpR.getParameter("eEndReg");
		String ePlace = mtpR.getParameter("ePlace");
		String eHour = mtpR.getParameter("eHour");
		String eStart = mtpR.getParameter("eStart");
		String eEnd = mtpR.getParameter("eEnd");
		
		String ePhoto = null;
		MultipartFile mf = mtpR.getFile("ePhoto");
		
		if (mf.isEmpty()) {
			EventDto edto = new EventDto(eId, eTitle, eGroup, eContent, eWriteDate, ePhoto, eStartReg, eEndReg, ePlace, eHour, eStart, eEnd);
			ePhoto = null;
			mtpR.setAttribute("edto", edto);
			com = new EventWriteCommand();
			com.execute(mtpR, model);
		} else {
			
			// 여기 경로를 본인 이클립스의 upFile 경로로		
			String path1 = "C:/Users/ky/Desktop/DOB/workspace/LibraryProject/src/main/webapp/resources/upclass/";
			// 여기 경로를 본인 톰캣의 경로로
			String path2 = "C:/KIMKIM/apache-tomcat-9.0.65/wtpwebapps/LibraryProject/resources/upclass/";
			
			String originFileName = mf.getOriginalFilename();
			
			long prename = System.currentTimeMillis();
			long fileSize = mf.getSize();
			
			String saveFile1 = path1 + prename + originFileName;
			String saveFile2 = path2 + prename + originFileName;
			
			ePhoto = prename + originFileName;
			EventDto edto = new EventDto(eId, eTitle, eGroup, eContent, eWriteDate, ePhoto, eStartReg, eEndReg, ePlace, eHour, eStart, eEnd);
			mtpR.setAttribute("edto", edto);
			com = new EventWriteCommand();
			com.execute(mtpR, model);
			
			Map<String, Object> map = model.asMap();
			String res = (String)map.get("result");
			System.out.println("Event res : " + res);
			
			if (res.equals("success")) {
				try {
					mf.transferTo(new File(saveFile1));
					mf.transferTo(new File(saveFile2));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
		} // else 의 끝
		
		return "redirect:main";
	}
		
	// 행사 삭제
	@RequestMapping("/deleteEvent")
	public String deleteEvent(HttpServletRequest request, Model model) {
		System.out.println("행사 게시물 삭제");
		com = new EventDeleteCommand();
		com.execute(request, model);
		com = new EventListCommand();
		com.execute(request, model);
		
		return "eventList_view";
		
	}
	
	// 행사 수정 페이지 이동
	@RequestMapping("/modifyEvent")
	public String modifyEvent(HttpServletRequest request, Model model) {
		System.out.println("행사 수정 페이지로 이동");
		com = new EventContentCommand();
		com.execute(request, model);
		return "eventModify_view";
	}
	
	// 행사 수정
	@RequestMapping("/eventModify")
	public String ModifyEvent(HttpServletRequest request, Model model) {
		System.out.println("행사 게시물 수정");
		com = new EventModifyCommand();
		com.execute(request, model);
		com = new EventContentCommand();
		com.execute(request, model);
		
		return "eventContent_view";
	}
	
	// 행사 목록 페이징
	@RequestMapping("/ePlist")
	public String eurl(HttpServletRequest request, Model model) {
		System.out.println("강좌 페이징 요청");
		com = new EventPageListCommand();
		com.execute(request, model);
		return "eventListPage_view";
	}
	
	// 행사 검색
	@RequestMapping("searchEvent")
	@ResponseBody
	public ArrayList<EventDto> searchEvent(@RequestParam("eGroup") String eGroup, @RequestParam("ekeyword") String ekeyword, Model model) throws Exception {
		System.out.println("행사 검색 실행");
		EventDto edto = new EventDto();
		
		edto.seteGroup(eGroup);
		edto.seteKeyword(ekeyword);
		
		ArrayList<EventDto> result = ldao.searchEvent(edto);
		return result;
	}
	
	
	
	
																			/* 관리 페이지 */
	//관리자 페이지 이동
	@RequestMapping("/admin_view")
	public String admin_view() {
		System.out.println("관리자 페이지 이동");
		return "admin_view";
	}
	
	//회원관리 페이지 이동, 회원 리스트 출력
	@RequestMapping("/admin_user")
	public String admin_user(HttpServletRequest request, Model model) {
		System.out.println("회원관리 페이지 이동");
		
		com = new AdminUsercommand();
		com.execute(request, model);
		
		return "admin_user";
	}
	
	//회원관리 페이징
	@RequestMapping("/userPList")
	public String userPList(HttpServletRequest request, Model model) {
		System.out.println("회원페이지 " + request.getParameter("pageNo"));
		
		com = new AdminUserPageCommand();
		com.execute(request, model);
		
		return "adminUserPage_view";
	}
	
	//회원관리 회원 권한 변경(관리자)
	@RequestMapping(value="/authorityChange", produces="application/text;charset=UTF8")
	public String authorityChange(HttpServletRequest request, Model model) {
		System.out.println("관리자로 권한 변경");
		
		com = new AdminAuthorityCommand();
		com.execute(request, model);
		com = new AdminUsercommand();
		com.execute(request, model);
		
		return "admin_user";
	}
	
	//회원관리 회원 권한 변경(일반회원)
	@RequestMapping(value="/authorityChange2", produces="application/text;charset=UTF8")
	public String authorityChange2(HttpServletRequest request, Model model) {
		System.out.println("일반회원으로 권한 변경");
		
		com = new AdminAuthority2Command();
		com.execute(request, model);
		com = new AdminUsercommand();
		com.execute(request, model);
		
		return "admin_user";
	}
	
	//회원 검색
	@RequestMapping("/adminUserSearch")
	@ResponseBody
	public ArrayList<LibUserDto> adminUserSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		LibUserDto dto = new LibUserDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<LibUserDto> result =  ldao.adminUserSearch(dto);
		return result;
		
	}
	
	//회원 상세정보
	@RequestMapping("/userView")
	public String userView(HttpServletRequest request, Model model) {
		System.out.println("회원 상세정보");
		
		com = new UserViewCommand();
		com.execute(request, model);
		
		return "userDetail_view";
	}
	
	//회원탈퇴 (어드민 권한)
	@RequestMapping("/adminUserDelete")
	public String adminUserDelete(HttpServletRequest request, Model model) {
		System.out.println("회원 탈퇴(어드민 권한)");
		
		com = new AdminUserDeleteCommand();
		com.execute(request, model);
		com = new AdminUsercommand();
		com.execute(request, model);
		
		return "admin_user";
	}
	
	//일정관리 페이지 이동
	@RequestMapping("/admin_calendar")
	public String admin_calendar() {
		System.out.println("일정관리 페이지 이동");
		return "admin_calendar";
	}
	
	//도서관리 페이지 이동
	@RequestMapping("/admin_book")
	public String admin_book(HttpServletRequest request, Model model) {
		System.out.println("도서관리 페이지 이동");
		
		com = new BookListCommand();
		com.execute(request, model);
		
		return "admin_book";
	}
	
	//대출내역 페이지 이동
	@RequestMapping("/admin_borrowList")
	public String admin_borrowList(HttpServletRequest request, Model model) {
		System.out.println("대출내역 페이지 이동");
		
		com = new AdminBorrowListCommand();
		com.execute(request, model);
		
		return "admin_borrowList";
	}
	
	//전체대출내역 페이징
	@RequestMapping("/aBorrowPList")
	public String aBorrowPList(HttpServletRequest request, Model model) {
		System.out.println("전체대출내역관리페이지 " + request.getParameter("pageNo"));
		
		com = new AdminBorrowPageCommand();
		com.execute(request, model);
		
		return "admin_borrowListPage";
	}
	
	//전체대출내역 검색
	@RequestMapping("adminBorrowSearch")
	@ResponseBody
	public ArrayList<BookBorrowListDto> adminBorrowSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		BookBorrowListDto dto = new BookBorrowListDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<BookBorrowListDto> result =  ldao.adminBorrowSearch(dto);
		return result;
		
	}
	
	//관리페이지 도서 검색
	@RequestMapping("adminBookSearch")
	@ResponseBody
	public ArrayList<BookListDto> adminBookSearch(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		BookListDto dto = new BookListDto();
		dto.setType(type);
		dto.setKeyword(keyword);
		
		ArrayList<BookListDto> result =  ldao.adminBookSearch(dto);
		return result;
		
	}
	
	//도서 정보 수정 페이지 이동
	@RequestMapping("/bookModiView")
	public String bookModiView(HttpServletRequest request, Model model) {
		System.out.println("도서 수정 페이지 이동");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		
		return "admin_book_modiView";
	}
	
	//도서관리 페이징
	@RequestMapping("/aBookPList")
	public String aBookPList(HttpServletRequest request, Model model) {
		System.out.println("도서관리페이지 " + request.getParameter("pageNo"));
		
		com = new AdminBookPageCommand();
		com.execute(request, model);
		
		return "admin_bookPage";
	}
	
	//도서 정보 수정 완료
	@RequestMapping(value="/bookModifyOK", produces="application/text;charset=UTF8")
	public String bookModifyOK(HttpServletRequest request, Model model) {
		System.out.println("도서 정보 수정");
		
		com = new BookModiCommand();
		com.execute(request, model);
		com = new BookListCommand();
		com.execute(request, model);
		
		return "admin_book";
	}
	
	//도서 삭제
	@RequestMapping(value="/bookDel", produces="application/text;charset=UTF8")
	public String bookDel(HttpServletRequest request, Model model) {
		System.out.println("도서 삭제");
		
		com = new BookDelCommand();
		com.execute(request, model);
		com = new BookListCommand();
		com.execute(request, model);
		
		return "admin_book";
	}
	
	//도서 소장 등록 페이지 이동
	@RequestMapping("/possession")
	public String possession(HttpServletRequest request, Model model) {
		System.out.println("도서 소장 등록 페이지");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookBorrowInfoViewCommand();
		com.execute(request, model);
		
		return "admin_book_possession";
	}
	
	//도서 소장 등록
	@RequestMapping("/plus_possession")
	public String plus_possession(HttpServletRequest request, Model model) {
		System.out.println("도서 소장 등록 완료");
		
		com = new BookPossessionCommand();
		com.execute(request, model);
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookBorrowInfoViewCommand();
		com.execute(request, model);
		
		return "admin_book_possession";
	}
	
	//도서 대출
	@RequestMapping(value="/bookBorrow", produces="application/text;charset=UTF8")
	public String bookBorrow(HttpServletRequest request, Model model) {
		System.out.println("도서 대출");
		
		com = new BookBorrowCommand();
		com.execute(request, model);
		com = new BookBorrowStateCommand();
		com.execute(request, model);
		com = new BookReservationStateCommand();
		com.execute(request, model);
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookBorrowInfoViewCommand();
		com.execute(request, model);
		
		return "admin_book_possession";
	}
	 
	//도서 반납 (어드민)
	@RequestMapping(value="/bookRendre", produces="application/text;charset=UTF8")
	public String bookRendre(HttpServletRequest request, Model model) {
		System.out.println("도서 반납");
		
		com = new BookRendreCommand();
		com.execute(request, model);
		com = new BookReturnCommand();
		com.execute(request, model);
		com = new BookReservationState2Command();
		com.execute(request, model);
		com = new AdminBorrowListCommand();
		com.execute(request, model);
		
		return "admin_borrowList";
	}
	
	//도서 반납 (회원)
	@RequestMapping(value="/bookReturn", produces="application/text;charset=UTF8")
	public String bookReturn(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("도서 반납");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		com = new BookRendreCommand(); //어드민 전체 대출 내역 반납완료 출력
		com.execute(request, model);
		com = new BookReturnCommand(); //대출가능으로 상태 변경
		com.execute(request, model);
		com = new BookReservationState2Command(); //예약페이지에서 대출가능으로 상태 변경
		com.execute(request, model);
		com = new UserBookBorrowListCommand(); //대출 내역 출력
		com.execute(request, model);
		
		return "borrowlist_view";
	}
	
	//캘린더 리스트
	@RequestMapping(value="/calendar", produces="application/json;charset=UTF8")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> calendar(HttpServletRequest request, Model model) {
		System.out.println("calendar 요청");
		System.out.println("cId: " + request.getParameter("cId"));
		
		com = new CalendarListCommand();
		com.execute(request, model);
		
		HashMap<String, Object> map = (HashMap)model.asMap();
		ArrayList<LibCalendarDto> calendarList = (ArrayList)map.get("calendarList"); //Command의 addAttribute key
		
		ArrayList<HashMap<String, Object>> clistArr = new ArrayList<HashMap<String,Object>>();
		
		for(LibCalendarDto dto : calendarList) {
			HashMap<String, Object> clistMap = new HashMap<String, Object>();
			
			String cAllDay = dto.getcAllDay();
			boolean allDay;
			if(cAllDay.equals("true")) {
				allDay = true;
			}
			else {
				allDay = false;
			}
			
			clistMap.put("cNo", dto.getcNo());
			clistMap.put("cId", dto.getcId());
			clistMap.put("title", dto.getcTitle());
			clistMap.put("start", dto.getcStart());
			clistMap.put("end", dto.getcEnd());
			clistMap.put("allDay", allDay);
			
			clistArr.add(clistMap);
		}
		
		return clistArr;
	}
	
	//일정작성
	@RequestMapping(value="/calendarInsert", produces="application/json;charset=UTF8")
	@ResponseBody
	public String calendarInsert(@RequestBody LibCalendarDto LibCalendarDto, HttpServletRequest request, Model model) {
		System.out.println("calendarInsert 요청");
		
		String start = LibCalendarDto.getcStart();
		String end = LibCalendarDto.getcEnd();
		
		DateTimeFormatter ISO_DATE_TIME = DateTimeFormatter.ISO_DATE_TIME;
		
		LocalDateTime localDateStart = LocalDateTime.from(ISO_DATE_TIME.parse(start));
		Timestamp stampStart = Timestamp.valueOf(localDateStart);
		
		LocalDateTime localDateEnd = LocalDateTime.from(ISO_DATE_TIME.parse(end));
		Timestamp stampEnd = Timestamp.valueOf(localDateEnd);
		
		System.out.println("stampStart : " + stampStart);
		System.out.println("stampEnd : " + stampEnd);
		
		Long posixStart = stampStart.getTime();
		Long posixEnd = stampEnd.getTime();
		
		System.out.println("posixStart : " + posixStart);
		System.out.println("posixEnd : " + posixEnd);
		
		LibCalendarDto.settStart(stampStart);
		LibCalendarDto.settEnd(stampEnd);
		
		request.setAttribute("dto", LibCalendarDto);
		
		com = new CalendarInsertCommand();
		com.execute(request, model);
		
		return "success";
	}
	
	//캘린더 수정
	@RequestMapping(value="/calendarUpdate", produces="application/json;charset=UTF8")
	@ResponseBody
	public String calendarUpdate(@RequestBody LibCalendarDto LibCalendarDto, HttpServletRequest request, Model model) {
		System.out.println("calendarUpdate 요청");
		System.out.println("calendarUpdate cNo : " + LibCalendarDto.getcNo());
		
		request.setAttribute("dto", LibCalendarDto);
		com = new CalendarUpdateCommand();
		com.execute(request, model);
		
		return "success";
	}	
	
	//캘린더 삭제
	@RequestMapping(value="/calendarDelete", produces="application/json;charset=UTF8")
	@ResponseBody
	public String calendarDelete(@RequestBody LibCalendarDto LibCalendarDto, HttpServletRequest request, Model model) {
		System.out.println("calendarDelete 요청");
		System.out.println("calendarDelete cNo : " + LibCalendarDto.getcNo());
		
		request.setAttribute("dto", LibCalendarDto);
		com = new CalendarDeleteCommand();
		com.execute(request, model);
		
		return "success";
	}
	
	

																	/* 희망도서 관련 */
	//희망도서 신청
	@RequestMapping("/bookApplication")
	public String bookApplication(BookApplicationDto dto, HttpServletRequest request, Model model) {
		System.out.println("희망도서 신청");
		
		request.setAttribute("appDto", dto);
		com = new BookApplicationCommand();
		com.execute(request, model);
		
		return "application_view";
	}
	
	//어드민 희망도서 확인 페이지 이동
	@RequestMapping("/admin_application")
	public String admin_application(HttpServletRequest request, Model model) {
		System.out.println("희망도서 확인");
		
		com = new AdminBookApplicationCommand();
		com.execute(request, model);
		
		return "admin_application";
	}
	
	//희망도서관리 페이징
	@RequestMapping("/adminAppList")
	public String adminAppList(HttpServletRequest request, Model model) {
		System.out.println("희망도서관리페이지 " + request.getParameter("pageNo"));
		
		com = new AdminBookAppPageCommand();
		com.execute(request, model);
		
		return "admin_applicationPage";
	}
	
	//희망도서 처리상태 변경
	@RequestMapping(value="/appStateChange", produces="application/text;charset=UTF8")
	public String appStateChange(HttpServletRequest request, Model model) {
		System.out.println("희망도서 처리상태 변경");
		
		com = new AdminBookAppStateCommand();
		com.execute(request, model);
		com = new AdminBookApplicationCommand();
		com.execute(request, model);
		
		return "admin_application";
	}
	
																	/* 예약, 관심도서 관련 */
	//어드민 예약확인 페이지 이동
	@RequestMapping("/admin_bookReservation")
	public String admin_bookReservation(HttpServletRequest request, Model model) {
		System.out.println("예약확인");
		
		com = new AdminBookReservationListCommand();
		com.execute(request, model);
		
		return "admin_bookReservation";
	}
	
	//예약 취소
	@RequestMapping("/reservationCancel")
	public String reservationCancel(HttpServletRequest request, Model model) {
		System.out.println("예약취소");
		
		com = new AdminBookReservationCancelCommand();
		com.execute(request, model);
		com = new AdminBookReservationChangeCommand();
		com.execute(request, model);
		com = new AdminBookReservationListCommand();
		com.execute(request, model);
		
		return "admin_bookReservation";
	}
	
	//관심도서 등록
	@RequestMapping("/interestBook")
	public String interestBook(HttpServletRequest request, Model model) {
		System.out.println("관심도서 등록");
		return "myInterest_view";
	}
	
	//관심도서 페이지 이동
	@RequestMapping("myInterest")
	public String myInterest(HttpServletRequest request, Model model) {
		System.out.println("관심도서 페이지 이동");
		return "myInterest_view";
	}

	//도서예약 페이지
	@RequestMapping(value="/bookReservationPage", produces="application/text;charset=UTF8")
	public String bookReservationPage(HttpServletRequest request, Model model) {
		System.out.println("bookReservationPage");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookReservationPageCommand();
		com.execute(request, model);
		 
		return "bookReservationPage_view";
	}
	
	//도서예약
	@RequestMapping("/book_reservation")
	public String book_reservation(HttpServletRequest request, Model model) {
		System.out.println("도서 예약");
		
		com = new BookReservationCommand();
		com.execute(request, model);
		com = new BookBookingCommand();
		com.execute(request, model);
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookCommentViewCommand();
		com.execute(request, model);
		com = new BookBorrowInfoViewCommand();
		com.execute(request, model);
		
		return "bookpage";
	}
	
	//도서예약 페이징
	@RequestMapping("/reservationList")
	public String reservationList(HttpServletRequest request, Model model) {
		System.out.println("도서예약 페이지 " + request.getParameter("pageNo"));
		
		com = new AdminBookReservationPageCommand();
		com.execute(request, model);
		
		return "admin_bookReservationPage";
	}
	
	//마이페이지에서 예약도서 대출
	@RequestMapping(value="/userBookBorrowPage", produces="application/text;charset=UTF8")
	public String userBookBorrowPage(HttpServletRequest request, Model model) {
		System.out.println("userBookBorrowPage");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookReservationPageCommand();
		com.execute(request, model);
		
		return "userBookBorrowPage";
	}

	//마이페이지에서 예약도서 대출 처리
	@RequestMapping("/userBookBorrow")
	public String userBookBorrow(HttpServletRequest request, Model model, BookBorrowListDto dto, Authentication authentication) {
		System.out.println("마이페이지 도서대출");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		request.setAttribute("bDto", dto);
		
		com = new UserMyBookBorrowCommand();
		com.execute(request, model);
		com = new BookBorrowStateCommand();
		com.execute(request, model);
		com = new AdminBookReservationCancelCommand();
		com.execute(request, model);
		com = new AdminBookReservationChangeCommand();
		com.execute(request, model);
		com = new BookReservationStateCommand();
		com.execute(request, model);
		com = new UserBookApplicationCommand();
		com.execute(request, model);
		com = new UserBookReservationCommand();
		com.execute(request, model);
		
		return "applist_view";
	}
	
	//회원 직접 대출
	@RequestMapping(value="/userBookBorrowPage2", produces="application/text;charset=UTF8")
	public String userBookBorrowPage2(HttpServletRequest request, Model model) {
		System.out.println("userBookBorrowPage");
		
		com = new BookContentViewCommand();
		com.execute(request, model);
		com = new BookReservationPageCommand();
		com.execute(request, model);
		
		return "userBookBorrowPage2";
	}
	
	//회원직접대출
	@RequestMapping("/userBookBorrow2")
	public String userBookBorrow2(HttpServletRequest request, Model model, BookBorrowListDto dto, Authentication authentication) {
		System.out.println("회원 직접 대출");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String user_id = userDetails.getUsername();
		request.setAttribute("user_id", user_id);
		
		request.setAttribute("bDto", dto);
		
		com = new UserMyBookBorrowCommand();
		com.execute(request, model);
		com = new BookBorrowStateCommand();
		com.execute(request, model);
		com = new AdminBookReservationCancelCommand();
		com.execute(request, model);
		com = new AdminBookReservationChangeCommand();
		com.execute(request, model);
		com = new BookReservationStateCommand();
		com.execute(request, model);
		com = new UserBookBorrowListCommand();
		com.execute(request, model);
		
		return "borrowlist_view";
	}
	
	
	//예약 5개 체크
	@RequestMapping("/reservation5Check")
	@ResponseBody
	public int reservation5Check(@RequestParam("reservationUser") String reservationUser) {
		
		int result = ldao.reservation5Check(reservationUser);
		return result;
	}
}
