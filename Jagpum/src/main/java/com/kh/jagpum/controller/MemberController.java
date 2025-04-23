package com.kh.jagpum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jagpum.dao.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
//	조회
//	@GetMapping("/long")
//	public String long(){
//			
//	}
//  삭제
	
//  수정
	
//  등록
	
	
}
