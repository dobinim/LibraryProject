package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookApplicationDto;
import com.team.lib.dto.BookBorrowListDto;
import com.team.lib.util.Constant;

public class UserBookBorrowListCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String user_id = (String)request.getAttribute("user_id");
		
		ArrayList<BookBorrowListDto> dto = ldao.userBList(user_id);
		model.addAttribute("userBList", dto);

	}

}
