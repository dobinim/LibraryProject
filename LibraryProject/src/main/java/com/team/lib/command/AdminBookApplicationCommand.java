package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookApplicationDto;
import com.team.lib.util.Constant;

public class AdminBookApplicationCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		ArrayList<BookApplicationDto> dto = ldao.adminApplication();
		
		model.addAttribute("adminApplicationList", dto);
	}

}
