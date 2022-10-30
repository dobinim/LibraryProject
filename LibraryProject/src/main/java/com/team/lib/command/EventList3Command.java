package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.EventDto;
import com.team.lib.util.Constant;

public class EventList3Command implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		ArrayList<EventDto> dtos = ldao.eventList3();
		
		model.addAttribute("eventList3", dtos);
	}

}
