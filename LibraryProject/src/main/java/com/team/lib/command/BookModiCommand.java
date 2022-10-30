package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class BookModiCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String bookid = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookid);
		
		String bookTitle = request.getParameter("bookTitle");
		String bookOriTitle = request.getParameter("bookOriTitle");
		String writer = request.getParameter("writer");
		String bookType = request.getParameter("bookType");
		String publisher = request.getParameter("publisher");
		String form = request.getParameter("form");
		String isbn = request.getParameter("isbn");
		String img = request.getParameter("img");
		String bookContent = request.getParameter("bookContent");
		String bookWriter = request.getParameter("bookWriter");
		String bookIndex = request.getParameter("bookIndex");
		String genre = request.getParameter("genre");
		String year = request.getParameter("year");
		
		String rec = request.getParameter("recommend");
		int recommend = Integer.parseInt(rec);
		
		String best = request.getParameter("bestseller");
		int bestseller = Integer.parseInt(best);
		
		BookListDto dto = new BookListDto(bookId, bookTitle, bookOriTitle, writer, bookType, publisher, form, isbn, img, bookContent, bookWriter, bookIndex, genre, year, recommend, bestseller);
		ldao.bookModify(dto);
	}

}
