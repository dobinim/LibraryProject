package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowInfoDto;
import com.team.lib.util.Constant;

public class BookPossessionCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String organName = request.getParameter("organName"); 
		String referenceRoom = request.getParameter("referenceRoom");
		String callNum = request.getParameter("callNum");
		String regiNum = request.getParameter("regiNum");
		String bookPossible = request.getParameter("bookPossible");
		String booking = request.getParameter("booking");
		String bookid = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookid);
		
		ldao.plus_possession(organName, referenceRoom, callNum, regiNum, bookPossible, booking, bookId);
	}

}
