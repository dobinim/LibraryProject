package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookCommentDto;
import com.team.lib.util.Constant;

public class BookCommentViewCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String num = request.getParameter("bookId");
		int bookId = Integer.parseInt(num);
		ArrayList<BookCommentDto> dto = ldao.book_comment(bookId); 
		
		model.addAttribute("book_comment", dto);
	}

}
