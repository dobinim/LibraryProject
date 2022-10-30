package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class UserViewCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String pid = request.getParameter("pid");
		
		LibUserDto dto = ldao.userDetail_view(pid);
		
		model.addAttribute("userDetail", dto);
	}

}
