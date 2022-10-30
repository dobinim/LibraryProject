package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.EventDto;
import com.team.lib.util.Constant;

public class EventContentCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		String eid = request.getParameter("eId");
		int eId = Integer.parseInt(eid);
		EventDto edto = ldao.eContentView(eId);
		
		if (edto != null) {
			model.addAttribute("eContentView", edto);
		}
		
	}

}
