package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookListDto;
import com.team.lib.util.Constant;

public class SearchCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		BookListDto bdto = new BookListDto();
		String mainkeyword = request.getParameter("mainkeyword");
		System.out.println("mainkeyword : " + mainkeyword);
		bdto.setMainkeyword(mainkeyword);
		ArrayList<BookListDto> result = ldao.searchMain(bdto);
		
		model.addAttribute("searchMain", result);

	}

}
