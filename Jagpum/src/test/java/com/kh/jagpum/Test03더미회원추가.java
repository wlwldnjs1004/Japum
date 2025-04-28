package com.kh.jagpum;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.jagpum.dao.MemberDao;
import com.kh.jagpum.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@SpringBootTest
public class Test03더미회원추가 {

	@Autowired
	private MemberDao accountDao;
	
	
	@Test
	public void test() {
		//일반회원 1000명 가입
		for(int i=1;i<=1000;i++) {
			
		accountDao.insert(MemberDto.builder()
				.memberId("testuser"+i)
				.memberPw("Testuser"+i+"!")
				.memberNickname("태스트유저"+i)
				.memberEmail("testuser"+i+"@kh.com")
				.build());
		}
		//우수회원 1000명 가입
//		for(int i=1;i<=1000;i++) {
//			
//		accountDao.insert(AccountDto.builder()
//				.accountId("vipuser"+i)
//				.accountPw("Vipuser"+i+"!")
//				.accountNickname("우수회원"+i)
//				.accountEmail("vipuser"+i+"@kh.com")
//				.build());
//		}
		
		//관리자 1000명 가입
//		for(int i=1;i<=1000;i++) {
//			
//		accountDao.insert(MemberDto.builder()
//				.memberId("adminuser"+i)
//				.memberPw("Adminuser"+i+"!")
//				.memberNickname("관리자"+i)
//				.memberEmail("adminuser"+i+"@kh.com")
//				.build());
//		}
//		

	
	}
}
