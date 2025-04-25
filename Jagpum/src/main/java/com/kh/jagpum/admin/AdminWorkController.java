package com.kh.jagpum.admin;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jagpum.dao.WorkDao;
import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.dto.WorkDto;
import com.kh.jagpum.service.AttachmentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/work")
public class AdminWorkController {

	
	@Autowired
	private WorkDao workDao;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@GetMapping("/add")
	public String addBook() {
		
		return"/WEB-INF/views/admin/work/add.jsp"; 
	}
	
	@PostMapping("/add")
	public String addBook(@ModelAttribute WorkDto workDto,
	                  @RequestParam MultipartFile attach,
	                  HttpSession session) throws IllegalStateException, IOException {
	    String userId = (String) session.getAttribute("userId");

	    workDto.setWorkId(userId);
	  WorkDto resultDto =workDao.insert(workDto);
	    if (!attach.isEmpty()) {
	        AttachmentDto attachmentDto = attachmentService.save(attach);
	        workDao.connect(resultDto, attachmentDto);
	    }
	    return "redirect:/work/addFinish";
	}
	
}
