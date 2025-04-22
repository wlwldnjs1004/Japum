package com.kh.jagpum.dto;




import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class WorkDto {

	private int workNo;//번호
	private String workId;//회원 키값
	private String workName;//작품 일므
	private String workGenre;//작품 분류
	private String workSubGenre;//작품 분류2
	private String workPrefer;//태그
	private Timestamp workWtime;//등록 시간
	private String workPaid;//
	private String workContract;//독점 여부
	private String workBook;//1권인지 여부
	private String workSubtotal;//작품 소게
	
}
