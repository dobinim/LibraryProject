package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.BookApplicationDto;
import com.team.lib.util.Constant;

public class AdminBookAppStateCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		
		String no = request.getParameter("appNo");
		int appNo = Integer.parseInt(no);
		String appState = request.getParameter("appState");
		
		BookApplicationDto dto = new BookApplicationDto(appNo, appState);
		ldao.appStateChange(dto);
	}

}
