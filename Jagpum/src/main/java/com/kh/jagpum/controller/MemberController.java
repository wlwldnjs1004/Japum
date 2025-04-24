package com.kh.jagpum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jagpum.dao.MemberDao;
import com.kh.jagpum.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
//  회원 가입 메핑
	@GetMapping("/join")
	public String join() {
		return"/WEB-INF/views/member/join.jsp";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		return"refirect:/";
	}
	
	@RequestMapping("/joinFinish")
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		
		return "redirect:/";
		
	}
	//로그인
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/member/login.jsp";
	}
	@PostMapping("/login")
	public String loing(@ModelAttribute MemberDto memberDto,
			HttpSession session) {

		MemberDto findDto=memberDao.seleOne(memberDto);
		
		boolean isValid =findDto.getMemberPw().equals(memberDto.getMemberPw());
		if(isValid) {
			
			
			session.setAttribute("userId", findDto.getMemberId());
			
			session.setAttribute("userLevel", findDto.getMemberLevel());
	
			
			
		return "redirect:/";
		}
		else {
			return "redirect:login?error";
	}
		
		
	}
	
	
}
