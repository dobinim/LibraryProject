package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.util.Constant;

public class EventDeleteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		String eid = request.getParameter("eId");
		int eId = Integer.parseInt(eid);
		
		ldao.deleteEvent(eId);

	}

}
