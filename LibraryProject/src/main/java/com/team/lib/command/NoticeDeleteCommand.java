package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.util.Constant;

public class NoticeDeleteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String nid = request.getParameter("nId");
		int nId = Integer.parseInt(nid);
		
		ldao.deleteN(nId);		

	}

}
