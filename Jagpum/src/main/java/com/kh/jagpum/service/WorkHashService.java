package com.kh.jagpum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jagpum.dto.WorkDto;
import com.kh.jagpum.mapper.WorkHashMapper;

@Service
public class WorkHashService {

	
	@Autowired
	private WorkHashMapper workHashMapper;
	
	public List<WorkDto>searchByTag(String keyword){
		return workHashMapper.list(keyword);
		
	}
	
	
}
