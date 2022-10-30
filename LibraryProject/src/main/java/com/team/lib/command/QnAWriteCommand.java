package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.QnADto;
import com.team.lib.util.Constant;

public class QnAWriteCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		int qnaNo = 0;
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		String qnaWriter = request.getParameter("qnaWriter");
		
		QnADto dto = new QnADto(qnaNo, qnaTitle, qnaContent, qnaWriter, null);
		
		LibDao ldao = Constant.ldao;
		String result = ldao.writeQnAOK(dto);
		
		request.setAttribute("result", result);
	}

}
