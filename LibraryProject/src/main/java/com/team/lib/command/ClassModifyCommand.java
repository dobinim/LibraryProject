package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.ClassDto;
import com.team.lib.util.Constant;

public class ClassModifyCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		String cid = request.getParameter("cId");
		int cId = Integer.parseInt(cid);

		String cName = request.getParameter("cName");
		String cStartReg = request.getParameter("cStartReg");
		String cEndReg = request.getParameter("cEndReg");
		String cTitle = request.getParameter("cTitle");
		String cContent = request.getParameter("cContent");
		String cStart = request.getParameter("cStart");
		String cEnd = request.getParameter("cEnd");
		
		String cnumber = request.getParameter("cNumber");
		int cNumber = Integer.parseInt(cnumber);
		
		String cPlace = request.getParameter("cPlace");
		String cPrice = request.getParameter("cPrice");
		String cHour = request.getParameter("cHour");
		String cGroup = request.getParameter("cGroup");

		ClassDto cdto = new ClassDto(cId, cName, cStartReg, cEndReg, cTitle, cContent, cStart, cEnd, cNumber, cPlace, cPrice, cHour, cGroup);
		ldao.modifyClass(cdto);

	}

}
