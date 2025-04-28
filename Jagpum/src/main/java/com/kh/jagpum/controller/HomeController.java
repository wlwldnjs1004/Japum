package com.kh.jagpum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jagpum.dao.WorkDao;
import com.kh.jagpum.dto.WorkDto;


//메인페이지 및 공용 페이지 작성을 위한 컨트롤러 (고용주소를 부여하지 않음)
@Controller

public class HomeController {

	
	
	@RequestMapping("/")
	public String home() {
//		return"/WEB-INF/views/home.jsp";
		return"/WEB-INF/views/bootstrap-home.jsp";
	}
	@RequestMapping("/bootstrap")	
	public String bootstrap() {
		return"/WEB-INF/views/bootstrap-home.jsp";
	}
}
