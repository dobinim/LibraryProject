package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.nDto;
import com.team.lib.util.Constant;

public class NContentCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		LibDao ldao = Constant.ldao;
		String nid = request.getParameter("nId");
		System.out.println("nid : " + nid);
		int nId = Integer.parseInt(nid);
		nDto ndto = ldao.nContentView(nId);
		
		if (ndto != null) {
			model.addAttribute("nContentView", ndto);
		}

	}

}
