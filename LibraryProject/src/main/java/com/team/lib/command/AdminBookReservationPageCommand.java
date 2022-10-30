package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookApplicationDto;
import com.team.lib.dto.BookReservationDto;
import com.team.lib.util.Constant;

public class AdminBookReservationPageCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		String pageNo = request.getParameter("pageNo");
		ArrayList<BookReservationDto> dto = ldao.adminReservationPageList(pageNo);
		
		model.addAttribute("adminReservationList", dto);
	}

}
