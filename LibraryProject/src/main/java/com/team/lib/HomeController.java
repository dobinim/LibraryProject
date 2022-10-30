package com.team.lib;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.lib.command.BookBestList4Command;
import com.team.lib.command.BookList4Command;
import com.team.lib.command.BookRecList4Command;
import com.team.lib.command.EventList3Command;
import com.team.lib.command.LibCommand;
import com.team.lib.command.NoticeList4Command;
import com.team.lib.dao.LibDao;
import com.team.lib.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
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
	
}
