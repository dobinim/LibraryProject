package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.ClassDto;
import com.team.lib.util.Constant;

public class ClassWriteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		ClassDto cdto = (ClassDto)request.getAttribute("cdto");
		String result = ldao.writeClass(cdto);
		model.addAttribute("result", result);

	}

}
