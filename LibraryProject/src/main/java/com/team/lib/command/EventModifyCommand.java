package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.EventDto;
import com.team.lib.util.Constant;

public class EventModifyCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		String eid = request.getParameter("eId");
		int eId = Integer.parseInt(eid);
		
		String eTitle = request.getParameter("eTitle"); 
		String eGroup = request.getParameter("eGroup"); 
		String eContent = request.getParameter("eContent"); 
		String eWriteDate = request.getParameter("eWriteDate"); 
		String eStartReg = request.getParameter("eStartReg"); 
		String eEndReg = request.getParameter("eEndReg"); 
		String ePlace = request.getParameter("ePlace"); 
		String eHour = request.getParameter("eHour"); 
		String eStart = request.getParameter("eStart"); 
		String eEnd = request.getParameter("eEnd"); 

		EventDto edto = new EventDto(eId, eTitle, eGroup, eContent, 
				eWriteDate, eStartReg, eEndReg, ePlace, eHour, eStart, eEnd);
		ldao.modifyEvent(edto);
	}

}
