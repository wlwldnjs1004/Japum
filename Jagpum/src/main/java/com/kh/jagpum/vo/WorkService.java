package com.kh.jagpum.vo;

import org.springframework.stereotype.Service;

import com.kh.jagpum.dto.WorkDto;

import lombok.Data;


@Data@Service
public class WorkService {
	
	
	public void prepareWorkDays(WorkDto workDto) {
	    workDto.setWorkMon(workDto.getWorkMon() == null ? "N" : workDto.getWorkMon());
	    workDto.setWorkTue(workDto.getWorkTue() == null ? "N" : workDto.getWorkTue());
	    workDto.setWorkWed(workDto.getWorkWed() == null ? "N" : workDto.getWorkWed());
	    workDto.setWorkThu(workDto.getWorkThu() == null ? "N" : workDto.getWorkThu());
	    workDto.setWorkFri(workDto.getWorkFri() == null ? "N" : workDto.getWorkFri());
	    workDto.setWorkSat(workDto.getWorkSat() == null ? "N" : workDto.getWorkSat());
	    workDto.setWorkSun(workDto.getWorkSun() == null ? "N" : workDto.getWorkSun());
	}

}
