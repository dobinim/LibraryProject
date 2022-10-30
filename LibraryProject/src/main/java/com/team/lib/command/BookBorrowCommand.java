package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.util.Constant;

public class BookBorrowCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		
		String pid = request.getParameter("pid");
		String bookid = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookid);
		String bookTitle = request.getParameter("bookTitle");
		String writer = request.getParameter("writer");
		String bi = request.getParameter("borrowId");
		int borrowId = Integer.parseInt(bi);
		
		
		BookBorrowListDto dto = new BookBorrowListDto(pid, bookId, bookTitle, writer, borrowId);
		ldao.adminBookBorrow(dto);
	}

}
