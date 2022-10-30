package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.util.Constant;

public class UserMyBookBorrowCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		BookBorrowListDto dto = (BookBorrowListDto)request.getAttribute("bDto");
		
		ldao.userBookBorrow(dto);
	}

}
