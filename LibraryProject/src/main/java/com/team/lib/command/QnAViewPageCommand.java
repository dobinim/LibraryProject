package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.QnADto;
import com.team.lib.util.Constant;

public class QnAViewPageCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String pageNo = request.getParameter("pageNo");
		ArrayList<QnADto> dtos = ldao.qna_pageList(pageNo);
		
		model.addAttribute("qnaList", dtos);
	}

}
