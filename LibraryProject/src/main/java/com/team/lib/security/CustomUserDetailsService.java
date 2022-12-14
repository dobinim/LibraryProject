package com.team.lib.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team.lib.dao.LibDao;
import com.team.lib.dto.LibUserDto;
import com.team.lib.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LibDao ldao = Constant.ldao;
		System.out.println("ldao: " + ldao);
		LibUserDto dto = ldao.login(username);
		System.out.println("로그인 dto: " + dto);
		
		if(dto == null) { //아이디에 해당하는 가입자가 없을 경우
			System.out.println("security에서 dto null로 로그인 실패");
			throw new UsernameNotFoundException("No user found with username"); //스프링 시큐리티에서 예외 처리하여 로그인 실패 처리
		}
		
		String pw = dto.getPpw();
		String auth = dto.getAuth();
		System.out.println("pw: " + pw + ", auth: " + auth);
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		roles.add(new SimpleGrantedAuthority(auth));
		
		UserDetails user = new User(username, pw, roles);
		
		return user;
	}

}
