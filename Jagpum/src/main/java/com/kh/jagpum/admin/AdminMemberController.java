package com.kh.jagpum.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jagpum.dao.MemberDao;
import com.kh.jagpum.dto.MemberDto;
import com.kh.jagpum.dto.WorkDto;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<MemberDto> list = memberDao.selectList();

		model.addAttribute("list",list);
		
		return "/WEB-INF/views/admin/member/list.jsp";
	}
//	@RequestMapping("/detail")
//	public String detail(@RequestParam String memberId,Model model) {
//		MemberDto memberDto=memberDao.seleOne(memberId);
//		if(memberId== null) {
//		}
//		model.addAttribute("memberDto",memberDto);
//		return"/WEB-INF/views/admin/member.jsp";
//	}
	@RequestMapping("/delete")
	public String delete(@RequestParam String memberId) {
		boolean success=memberDao.delete(memberId);
		if(success) {
//			throw new TargetedNotification();
		}
		return "redirect:home";
		
	}
	
	
}
