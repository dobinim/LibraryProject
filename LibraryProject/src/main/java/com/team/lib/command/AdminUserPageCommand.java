package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class AdminUserPageCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String pageNo = request.getParameter("pageNo");
		ArrayList<LibUserDto> dto = ldao.userPageList(pageNo);
		
		model.addAttribute("user_list", dto);
	}

}
