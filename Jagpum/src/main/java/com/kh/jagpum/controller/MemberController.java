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
	
//	//
//	@GetMapping("/long")
//	public String long(){
//			
//	}
//  삭제
	
//  수정
	
//  회원 가입 메핑
	@GetMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto,
			@RequestParam(required= false) String remember,
			HttpSession session) {
		
		memberDao.insert(memberDto);
//		emailService.sendWelcomeMail(memberDto);
		
		
		return"refirect:joinFinish";
	}
	@RequestMapping("/joinFinish")
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
		
	}
	//로그인
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/member/login.jsp";
	}
	@PostMapping("/login")
	public String loing(@ModelAttribute MemberDto memberDto,
			@)
	
}
