package com.team.lib.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LibCommand {
	
	public void execute(HttpServletRequest request, Model model);

}
