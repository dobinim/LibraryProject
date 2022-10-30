package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowInfoDto;
import com.team.lib.util.Constant;

public class AdminBookReservationChangeCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String no = request.getParameter("borrowId");
		int borrowId = Integer.parseInt(no);
		
		BookBorrowInfoDto dto = new BookBorrowInfoDto(borrowId);
		ldao.adminReservationChange(dto);
	}

}
