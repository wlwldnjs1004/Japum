package com.kh.jagpum.restcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jagpum.dao.ChapterDao;
import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.service.AttachmentService;


@CrossOrigin
@RestController
@RequestMapping("/rest/chapter")
public class ChapterRestController {
	
	@Autowired
	private ChapterDao chapterDao;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@PostMapping("/upload")
	public List<Integer> upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
	    List<Integer> list = new ArrayList<>();
	    if (!attach.isEmpty()) {
	        AttachmentDto result = attachmentService.save(attach);
	        list.add(result.getAttachmentNo());
	    }
	    return list;
	}

	
	@PostMapping("/uploads")
	public List<Integer> uploads(@RequestParam(value="attach") List<MultipartFile> attachList) throws IllegalStateException, IOException {
		List<Integer> numbers = new ArrayList<>();
		for(MultipartFile attach : attachList) {
			if(attach.isEmpty()) continue;
			AttachmentDto attachmentNo = attachmentService.save(attach);
			numbers.add(attachmentNo.getAttachmentNo());
		}
		return numbers;
	}
	
}
