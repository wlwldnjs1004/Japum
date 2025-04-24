package com.kh.jagpum.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @Builder@NoArgsConstructor @AllArgsConstructor
public class ChapterDto {
				
	private int chapterNo;//챕터 키값
	private int workNo;//작품 키값
	private String chapterTitle;//제목
	private String chapterDetail;//챕터 내용
	private String chapterComment;//작가의 말
	private Timestamp chapterModified;//등록 일자
	private Timestamp chapterRecent;//수정일자
	private int chapterOrder;//챕터 등록 카운트
	private int chapterPrice;

private Boolean priceVisible;


}