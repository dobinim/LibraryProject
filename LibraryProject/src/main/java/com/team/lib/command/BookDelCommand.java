package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class BookDelCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String bookid = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookid);
		
		BookListDto dto = new BookListDto(bookId);
		ldao.bookDel(dto);
	}

}
