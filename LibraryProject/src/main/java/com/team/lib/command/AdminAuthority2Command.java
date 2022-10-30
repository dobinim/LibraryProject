package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class AdminAuthority2Command implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String pid = request.getParameter("pid");
		
		LibUserDto dto = new LibUserDto(pid);
		ldao.authorityChange2(dto);
	}

}
