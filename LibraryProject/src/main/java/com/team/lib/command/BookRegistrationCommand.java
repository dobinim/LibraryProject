package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class BookRegistrationCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		BookListDto dto = (BookListDto)request.getAttribute("bdto");
		
		String result = ldao.bookRegistration(dto);
		model.addAttribute("result", result);
	}

}
