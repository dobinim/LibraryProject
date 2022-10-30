package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class AdminBorrowListCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		
		ArrayList<BookBorrowListDto> dto = ldao.adminBorrowList();
		
		model.addAttribute("adminBorrowList", dto);
	}

}
