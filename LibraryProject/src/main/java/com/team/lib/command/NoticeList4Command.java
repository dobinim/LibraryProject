package com.team.lib.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.nDto;
import com.team.lib.util.Constant;

public class NoticeList4Command implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		ArrayList<nDto> dtos = ldao.noticeList4();
		
		model.addAttribute("noticeList4", dtos);	

	}

}
