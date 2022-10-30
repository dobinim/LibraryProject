package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookCommentDto;
import com.team.lib.util.Constant;

public class BookCommentDelCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String num = request.getParameter("commentNo");
		int commentNo = Integer.parseInt(num);
		
		BookCommentDto dto = new BookCommentDto(commentNo);
		ldao.commentDel(dto);
		
	}

}
