package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class LibUpdatePwCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		LibDao ldao = Constant.ldao;
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String pid = (String) request.getAttribute("pid");
		String ppw = request.getParameter("pnpw");
		String ppwcheck = request.getParameter("pnpwcheck");
		
		
		String ppw_org = ppw;
		ppw = passwordEncoder.encode(ppw_org);
		String ppwCheck_org = ppwcheck;
		ppwcheck = passwordEncoder.encode(ppwCheck_org);
		
		LibUserDto dto = new LibUserDto(null, pid, ppw, ppwcheck, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		ldao.update_pw(dto);
		
	}

}
