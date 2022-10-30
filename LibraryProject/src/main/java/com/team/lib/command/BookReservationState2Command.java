package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookReservationDto;
import com.team.lib.util.Constant;

public class BookReservationState2Command implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String bi = request.getParameter("borrowId");
		int borrowId = Integer.parseInt(bi);
		
		BookReservationDto dto = new BookReservationDto(borrowId);
		ldao.bookReservationState2(dto);
	}

}
