package com.kh.jagpum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring09.dao.WorkDao;
import com.kh.spring09.dto.WorkDto;
import com.kh.spring09.service.AttachmentService;

//메인페이지 및 공용 페이지 작성을 위한 컨트롤러 (고용주소를 부여하지 않음)

@Controller
public class HomeController {

	@Autowired
	private WorkDao workDao;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@RequestMapping("/")
	public String home() {
		return"/WEB-INF/views/home.jsp";
	}
	@RequestMapping("/bootstrap")	
	public String bootstrap(Model model) {
		List<WorkDto> list = workDao.selectList();
		model.addAttribute("list",list);
		return"/WEB-INF/views/bootstrap-home.jsp";
	}
}
