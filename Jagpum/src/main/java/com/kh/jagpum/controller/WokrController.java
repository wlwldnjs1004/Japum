package com.kh.jagpum.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jagpum.dao.WorkDao;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/work")
public class WokrController {

	@Autowired
	private WorkDao workDao;
	
//	@Autowired
//	private WorkMapper workMapper;
//	
//	@Autowired
//	private AttachmentService attachmentService;
//	
//	@Autowired
//	private ChapterDao chapterDao;
//	
//	@Autowired
//	private workListViewDao workListViewDao;
	
	@GetMapping("/add")
	public String add() {
		return"/WEB-INF/views/work/add.jsp"; 
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute WorkDto workDto,
	                  @RequestParam MultipartFile attach,
	                  HttpSession session) throws IllegalStateException, IOException {

	    String userId = (String) session.getAttribute("userId");

	    workDto.setWorkId(userId);
	    
	    int workNo = workDao.sequence();
	    workDto.setWorkNo(workNo);
	    workDao.insert2(workDto);

	    if (!attach.isEmpty()) {
	        int attachmentNo = attachmentService.save(attach);
	        workDao.connect(workNo, attachmentNo);
	    }
	    
	    return "redirect:addFinish";
	}
	
	@RequestMapping("/addFinish")//방식 무관
	public String addFinish() {
		return "/WEB-INF/views/work/addFinish.jsp";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<WorkListViewDto> list = workListViewDao.selectList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/work/list.jsp";
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
	@RequestMapping("/detail")
	public String detail(@RequestParam int workNo,Model model) {
		
		WorkListViewDto workDto=workListViewDao.seleOne(workNo);
	    List<ChapterDto> chapterList = chapterDao.selectListByWorkNo(workNo);
		
		model.addAttribute("workDto",workDto);
		
	    model.addAttribute("chapterList", chapterList);
		
		
		return"/WEB-INF/views/work/detail.jsp";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int workNo) {
		try {
			int attachmentNo=workDao.findAttachment(workNo);
			attachmentService.delete(attachmentNo);
		}
		
		catch(Exception e) {}
		workDao.delete(workNo);
		return "redirect:list";
	}
	/*
	 @RequestMapping("/delete")
	 public String delete(@RequestParam int workNo){
	 try{
	 int attachmentNo=workDao.findAttachment(workNo);
	 attachmentService.delete(attachmentNo);
	 }
	 //try을 쓰는 이유는 트라이 캐치 오류를 잡기 위해 서 이다
		catch(Exception e){}
		workDao.delete(workNo);
		return "redirect:list";
	 	return
	 } 
	  
	  */
	
	//채크 박스 삭제 구현
	@PostMapping("/deleteAll")
	public String deleteAll(@RequestParam (value = "chapterNo")
	List<Integer> chapterListNo) {
		for(int chapterNo:chapterListNo) {
//			try {
//				int attachmentNo=workDao.findAttachment(workNo);
//				attachmentService.delete(attachmentNo);
//			}
//			catch(Exception e) {}
		chapterDao.delete(chapterNo);

		}	
		return"redirect:list";
		
	}
	@GetMapping("/edit")
	public String edit(@RequestParam int workNo, Model model) {
		WorkDto workDto=workDao.seleOne(workNo);
		model.addAttribute("workDto", workDto);	
		return"/WEB-INF/views/work/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute WorkDto workDto,
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
		boolean success=workDao.update(workDto);
		if(!success) {
			return"redirect:list";
		}
		if(attach.isEmpty()==false) {
			try{
				int attachmentNo=workDao.findAttachment(workDto.getWorkNo());
				attachmentService.delete(attachmentNo);
			}
			catch(Exception e) {
				
			}
			int newAttchmentNo=attachmentService.save(attach);
			workDao.connect(workDto.getWorkNo(), newAttchmentNo);
		}
	
		return"redirect:detail?workNo="+workDto.getWorkNo();

	}
	

	
}
