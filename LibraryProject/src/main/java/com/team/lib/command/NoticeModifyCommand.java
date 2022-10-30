package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.nDto;
import com.team.lib.util.Constant;

public class NoticeModifyCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		nDto ndto = (nDto)request.getAttribute("nDto");
		/*
		 * String nid = request.getParameter("nId"); int nId = Integer.parseInt(nid);
		 * String nTitle = request.getParameter("nTitle"); String nContent =
		 * request.getParameter("nContent");
		 * 
		 * nDto ndto = new nDto(nId, nTitle, nContent);
		 */
		ldao.modifyN(ndto);
	}

}
