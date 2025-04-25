package com.kh.jagpum.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jagpum.dao.ChapterDao;

@CrossOrigin
@RequestMapping("/rest/chapter")
public class chapterRestController {

	
	@Autowired
	private ChapterDao chapterDao;
	
	
//	@RequestMapping("/checkPrice")
//	public boolean checkPrice(@RequestParam) {
//		
//	}
	
	
}
