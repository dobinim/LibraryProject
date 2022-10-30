package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class RecListViewPageCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String pageNo = request.getParameter("pageNo");
		ArrayList<BookListDto> dto = ldao.recList_page(pageNo);
		
		model.addAttribute("recList", dto);
	}

}
