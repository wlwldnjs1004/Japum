package com.kh.jagpum.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jagpum.dao.ChapterDao;
import com.kh.jagpum.dto.ChapterDto;


@Controller
@RequestMapping("/admin/chapter")
public class AdminChapterController {

	@Autowired
	private ChapterDao chapterDao;
	
	//가격 설정 관리자 등록 주소
	@GetMapping("/edit")
	public String add(@RequestParam int chapterNo,
			Model model) {
		ChapterDto chapterDto=chapterDao.seleOne(chapterNo);
		model.addAttribute("chapterDto",chapterDto);
		return "/WEB-INF/views/admin/chapter/edit.jsp";
	}
	@PostMapping("/edit")
	public String add(@ModelAttribute ChapterDto chapterDto) {
		chapterDao.ChapterPriceBy(chapterDto);
		return "redirect:/bootstrap";
	}
	
	
}
