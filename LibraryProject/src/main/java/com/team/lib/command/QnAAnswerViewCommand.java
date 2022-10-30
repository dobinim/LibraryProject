package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.QnAAnswerDto;
import com.team.lib.util.Constant;

public class QnAAnswerViewCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		String qnanum = request.getParameter("qnaNo");
		int qnaNo = Integer.parseInt(qnanum);
		
		QnAAnswerDto dto = ldao.qna_answer(qnaNo);
		
		model.addAttribute("qna_answer", dto);
	}

}
