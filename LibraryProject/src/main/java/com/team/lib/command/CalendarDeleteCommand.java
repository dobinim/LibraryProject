package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibCalendarDto;
import com.team.lib.util.Constant;

public class CalendarDeleteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		LibCalendarDto dto = (LibCalendarDto)request.getAttribute("dto");
		ldao.calendarDelete(dto);
	}

}
