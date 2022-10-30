package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.util.Constant;

public class UserReservationCancelCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		
		String id = request.getParameter("borrowId");
		int borrowId = Integer.parseInt(id);
		
		ldao.userReservationCancel(borrowId);
	}

}
