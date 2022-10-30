package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.util.Constant;

public class ClassDeleteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		
		String cid = request.getParameter("cId");
		System.out.println("cid : " + cid);
		int cId = Integer.parseInt(cid);
		
		ldao.deleteClass(cId);

	}

}
