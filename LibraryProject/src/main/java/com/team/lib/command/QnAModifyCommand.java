package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.QnADto;
import com.team.lib.util.Constant;

public class QnAModifyCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		String qnano = request.getParameter("qnaNo");
		int qnaNo = Integer.parseInt(qnano);
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		String qnaWriter = request.getParameter("qnaWriter");
		
		QnADto dto = new QnADto(qnaNo, qnaTitle, qnaContent, qnaWriter);
		
		ldao.qnaModify(dto);
	}

}
