package com.kh.jagpum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jagpum.dao.ChapterDao;
import com.kh.jagpum.dao.WorkDao;
import com.kh.jagpum.dto.ChapterDto;



@Controller
@RequestMapping("/chapter")
public class ChapterController {

	
	@Autowired
	private ChapterDao chapterDao;
//	
	@Autowired
	private WorkDao workDao;
	
	
//	@Autowired
//	private AttachmentService attachmentService;
	
	
	 @GetMapping("/add")
	public String add(@RequestParam int workNo, Model model) {
			
		   WorkDto workDto = workDao.seleOne(workNo);
		    model.addAttribute("workNo", workNo);
		    model.addAttribute("workDto", workDto); 
		  return"/WEB-INF/views/chapter/add.jsp";
	 }
	
	 @PostMapping("/add")
	 public String add(@ModelAttribute ChapterDto chapterDto,
	                   @RequestParam int workNo) {
//		 chapterDto.setChapterOrder(nextOrder);
//		 chapterDto.setWorkNo(workNo); 
//	     chapterDao.insert(chapterDto);
	     

		    // [1] chapter_order 구하기
		    int nextOrder = chapterDao.getNextChapterOrder(workNo);

		    // [2] Dto에 세팅
		    chapterDto.setChapterOrder(nextOrder);
		    chapterDto.setWorkNo(workNo);

		    // [3] insert
		    chapterDao.insert(chapterDto);
		    
		    
	     return "redirect:/chapter/addFinish";
	 }

	
	@RequestMapping("/addFinish")
	public String addFininsh() {
		return "/WEB-INF/views/chapter/addFinish.jsp";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<ChapterDto> list = chapterDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/chapter/list.jsp";
	}
	
	
	
	@RequestMapping("/detail")
	public String detail(@RequestParam int chapterNo,Model model) {
		ChapterDto chapterDto=chapterDao.seleOne(chapterNo);
		int workNo=chapterDto.getWorkNo();
		
		model.addAttribute("chapterDto",chapterDto);
		return"/WEB-INF/views/chapter/detail.jsp";
	}

	@RequestMapping("/image")
	public String image(@RequestParam int workNo) {
		try {
			int attachmentNo = workDao.findAttachment(workNo);
			return "redirect:/attachment/download?attachmentNo="+attachmentNo;
		}
		catch(Exception e) {
//			return "redirect:/images/empty.jpg";
			return "redirect:https://placehold.co/400x400?text=P";
		}
	}

	
	@RequestMapping("/delete")
	public String delete(@RequestParam int chapterNo) {
		
//			try {
//			int attachmentNo=chapterDao.findAttachment(chapterNo);
//			attachmentService.delete(attachmentNo);
//		}
//		
//		catch(Exception e) {}
		chapterDao.delete(chapterNo);
		return "redirect:/work/list";
//	}
	
	}	
	@GetMapping("/edit")
	public String edit(@RequestParam int chapterNo) {
		
		return"/WEB-INF/views/chapter/edit.jsp";
	}
	
	
	
}
