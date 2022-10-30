package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookCommentDto;
import com.team.lib.util.Constant;

public class BookCommentCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		
		String commentWriter = request.getParameter("commentWriter");
		String commentContent = request.getParameter("commentContent");
		String num = request.getParameter("bookId");
		int bookId = Integer.parseInt(num);
		
		ldao.bookComment(commentWriter, commentContent, bookId);
	}

}
