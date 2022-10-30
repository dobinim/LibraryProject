package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowInfoDto;
import com.team.lib.util.Constant;

public class BookBorrowInfoViewCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		String num = request.getParameter("bookId");
		int bookId = Integer.parseInt(num);
		
		ArrayList<BookBorrowInfoDto> dto = ldao.bookBorrowInfo(bookId); 
		
		model.addAttribute("bookBorrow_info", dto);

	}

}
