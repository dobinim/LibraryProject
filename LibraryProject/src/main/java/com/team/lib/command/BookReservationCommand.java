package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookReservationDto;
import com.team.lib.util.Constant;

public class BookReservationCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String bookid = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookid);
		String reservationTitle = request.getParameter("reservationTitle");
		String reservationUser = request.getParameter("reservationUser");
		String borrowid = request.getParameter("borrowId");
		int borrowId = Integer.parseInt(borrowid);
		String callNum = request.getParameter("callNum");
		String bookPossible = request.getParameter("bookPossible");
		String writer = request.getParameter("writer");
		
		ldao.bookReservation(reservationTitle, reservationUser, bookId, borrowId, callNum, bookPossible, writer);
	}

}
