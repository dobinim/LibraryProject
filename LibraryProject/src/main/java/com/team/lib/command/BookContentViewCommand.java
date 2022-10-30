package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class BookContentViewCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		String bookId = request.getParameter("bookId");
		int bid = Integer.parseInt(bookId);
		
		BookListDto dto = ldao.content_view(bid);
		
		if(dto != null) {
			model.addAttribute("content_view", dto);
		}
		
	}

}
