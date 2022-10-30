package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class LibUpdateCommand implements LibCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		LibDao ldao = Constant.ldao;
		
		String pname = request.getParameter("pname");
		String pid = request.getParameter("pid");
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
		
		
		LibUserDto dto = new LibUserDto(pname, pid, null, null, pmail1, pmail2, null, null, birth1, birth2, birth3, ppn1, ppn2, ppn3, postcode, address, detailaddress, extraaddress);
		
		ldao.update(dto);
		
	}

}
