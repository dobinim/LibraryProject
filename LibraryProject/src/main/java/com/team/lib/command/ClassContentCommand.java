package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.ClassDto;
import com.team.lib.util.Constant;

public class ClassContentCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String cid = request.getParameter("cId");
		int cId = Integer.parseInt(cid);
		ClassDto cdto = ldao.cContentView(cId);
		
		if (cdto != null) {
			model.addAttribute("cContentView", cdto);
		}

	}

}
