package com.kh.jagpum.vo;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.jagpum.dto.ChapterDto;

import lombok.Data;

@Data
public class ChapterPriceVO {


	    private int chapterOrder;
	    private int chapterPrice;

	    // 오라클에서 가격이 정해졌다면, 그대로 넘겨받아서 저장
	    public ChapterPriceVO(ChapterDto chapterDto) {
	        this.chapterOrder = chapterDto.getChapterOrder();
	        this.chapterPrice = chapterDto.getChapterPrice(); // 그대로 복사
	    }

	    // 가격 노출 여부만 로직으로 제공 (30화 이상만 보여줌)
	    public boolean isPriceVisible() {
	        return chapterOrder >= 30;
	    }
	}

	
