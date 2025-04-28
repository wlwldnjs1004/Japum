package com.kh.jagpum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.jagpum.dto.WorkDto;

@Mapper
public interface WorkHashMapper {

	List<WorkDto>list(String keyword);

}
