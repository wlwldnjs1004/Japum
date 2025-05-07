package com.kh.jagpum.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@NoArgsConstructor@AllArgsConstructor
public class CwmMemberDto {

	private int chapterNo;//챕터 키값
	private int workNo;//작품 키값
	private String chapterTitle;//제목
	private String chapterDetail;//챕터 내용
	private String chapterComment;//작가의 말
	private Timestamp chapterModified;//등록 일자
	private Timestamp chapterRecent;//수정일자
	private int chapterOrder;//챕터 등록 카운트

	//------------------------------------
	
	private int workNoView;//번호
	private String workId;//회원 키값
	private String workName;//작품 이름
	private String workGenre;//작품 분류
	private String workSubGenre;//작품 분류2
	private String workPrefer;//태그
	private Timestamp workWtime;//등록 시간
	private String workPaid;//
	private String workContract;//독점 여부
	private String workBook;//1권인지 여부
	private String workSubtotal;//작품 소게
	
	
	
	private String workMon;//월
	private String workTue;//화
	private String workWed;//수
	private String workThu;//목
	private String workFri;//금
	private String workSat;//토
	private String workSun;//일
	
	private String memberId;
	private String memberPw;
	private String memberNickname;
	private String memberLevel;
	private String memberEmail;
	private String memberBirth;
	private String memberItem;
	private String memberGender;
	
	
	
	
}
