package com.kh.jagpum.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder @NoArgsConstructor@AllArgsConstructor
public class MemberDto {

	private String memberId;
	private String memberPw;
	private String memberNickname;
	private String memberLevel;
	private String memberEmail;
	private String memberBirth;
	private String memberItem;
	private String memberGender;
	
	
	
}
