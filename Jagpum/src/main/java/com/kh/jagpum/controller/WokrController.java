package com.kh.jagpum.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kh.jagpum.dao.ChapterDao;
import com.kh.jagpum.dao.WorkDao;
import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.dto.ChapterDto;
import com.kh.jagpum.dto.WorkDto;
import com.kh.jagpum.dto.WorkListViewDto;
import com.kh.jagpum.service.AttachmentService;
import com.kh.jagpum.vo.ChapterPriceVO;
import com.kh.jagpum.vo.PageVO;
import com.kh.jagpum.vo.WorkService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/work")
public class WokrController {

	@Autowired
	private WorkDao workDao;
	
	@Autowired
	private AttachmentService attachmentService;
	
	
	@Autowired
	private ChapterDao chapterDao;

	@Autowired
	private WorkService workService;
	
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

	    workDto.setWorkMon(workDto.getWorkMon()==null? "N":workDto.getWorkMon());
	    workDto.setWorkTue(workDto.getWorkTue()==null? "N":workDto.getWorkTue());
	    workDto.setWorkWed(workDto.getWorkWed()==null? "N":workDto.getWorkWed());
	    workDto.setWorkThu(workDto.getWorkThu()==null? "N":workDto.getWorkThu());
	    workDto.setWorkFri(workDto.getWorkFri()==null? "N":workDto.getWorkFri());
	    workDto.setWorkSat(workDto.getWorkSat()==null? "N":workDto.getWorkSat());
	    workDto.setWorkSun(workDto.getWorkSun()==null? "N":workDto.getWorkSun());
	    
	  WorkDto resultDto= workDao.insert2(workDto);
	  
	    if (!attach.isEmpty()) {
	        AttachmentDto attachmentDto = attachmentService.save(attach);
	        workDao.connect(resultDto, attachmentDto);
	    }
	    
	    return "redirect:addFinish";
	}
	
	@RequestMapping("/addFinish")//방식 무관
	public String addFinish() {
		return "/WEB-INF/views/work/addFinish.jsp";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(required = false) String keyword,Model model) {

		List<WorkListViewDto> list;
		 if (keyword != null && !keyword.isEmpty()) {
//			 log.debug("검색 결과: {}", keyword); 
			 if (keyword.contains("#")) {
		            list = workDao.selectListview(); // 목록
		        } 
			 list = workDao.serchView(keyword); 
	    }
	    else {
	        list = workDao.selectListview();//목록 
	    }
	    model.addAttribute("list", list);
	    model.addAttribute("keyword", keyword);
//	    model.addAttribute()
		return "/WEB-INF/views/work/list.jsp";
	}
	
	
	@RequestMapping("/image")
	public String image(@RequestParam int workNo) {
//	    System.out.println("이미지 요청 받은 workNo: " + workNo);
		try {
			int attachmentNo = workDao.findAttachment(workNo);
//			System.out.println(attachmentNo);
			return "redirect:/attachment/download?attachmentNo="+attachmentNo;
		}
		catch(Exception e) {
//			return "redirect:/images/empty.jpg";
			return "redirect:https://placehold.co/400x400?text=P";
		}
	
	}
	@RequestMapping("/detail")
	public String detail(@RequestParam int workNo,Model model) {
		
		WorkListViewDto workDto=workDao.selectListviewBy(workNo);
	    List<ChapterDto> chapterList = chapterDao.selectListByWorkNo(workNo);
//		ChapterDto  chapterDto=chapterDao.seleOne(workNo);

	    
		List<ChapterPriceVO> priceVoList = new ArrayList<>();
		for (ChapterDto chapterDto : chapterList) {
			priceVoList.add(new ChapterPriceVO(chapterDto));
		}

		model.addAttribute("priceVoList",priceVoList);
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
	
	@GetMapping("/edit")
	public String edit(@RequestParam int workNo, Model model) {
		WorkDto workDto=workDao.seleOne(workNo);
		model.addAttribute("workDto", workDto);	
		return"/WEB-INF/views/work/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute WorkDto workDto,
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
	    workDto.setWorkMon(workDto.getWorkMon()==null? "N":workDto.getWorkMon());
	    workDto.setWorkTue(workDto.getWorkTue()==null? "N":workDto.getWorkTue());
	    workDto.setWorkWed(workDto.getWorkWed()==null? "N":workDto.getWorkWed());
	    workDto.setWorkThu(workDto.getWorkThu()==null? "N":workDto.getWorkThu());
	    workDto.setWorkFri(workDto.getWorkFri()==null? "N":workDto.getWorkFri());
	    workDto.setWorkSat(workDto.getWorkSat()==null? "N":workDto.getWorkSat());
	    workDto.setWorkSun(workDto.getWorkSun()==null? "N":workDto.getWorkSun());
	    
		
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
			AttachmentDto attachmentDto=attachmentService.save(attach);
						workDao.connect(workDto, attachmentDto);;
		}
	
		return"redirect:detail?workNo="+workDto.getWorkNo();

	}

//	@GetMapping("/search")
//	public String postMethodName(Model model,
//		@RequestParam String keyword) {
//		List<WorkDto> list=workDao.serch(keyword);
//		model.addAttribute("list",list);
//		return "/WEB-INF/views/work/list.jsp";
//	}
	
	

	
	
	
//	// 해시 태그 검색 페이지
	
	

}
