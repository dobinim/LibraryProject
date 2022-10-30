package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class LibJoinCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String pname = request.getParameter("pname");
		String pid = request.getParameter("pid");
		String ppw = request.getParameter("ppw");
		String ppwcheck = request.getParameter("ppwcheck");
		String pmail1 = request.getParameter("pmail1");
		String pmail2 = request.getParameter("pmail2");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		String ppn1 = request.getParameter("ppn1");
		String ppn2 = request.getParameter("ppn2");
		String ppn3 = request.getParameter("ppn3");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailaddress = request.getParameter("detailaddress");
		String extraaddress = request.getParameter("extraaddress");
		
		String ppw_org = ppw;
		ppw = passwordEncoder.encode(ppw_org);
		String ppwCheck_org = ppwcheck;
		ppwcheck = passwordEncoder.encode(ppwCheck_org);
		
		LibUserDto dto = new LibUserDto(pname, pid, ppw, ppwcheck, pmail1, pmail2, null, null, birth1, birth2, birth3, ppn1, ppn2, ppn3, postcode, address, detailaddress, extraaddress);
		
		LibDao ldao = Constant.ldao;
		String result = ldao.join(dto);
		
		request.setAttribute("result", result);
	}

}
