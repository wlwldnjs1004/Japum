package com.kh.jagpum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.dto.MemberDto;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	//등록
	public MemberDto insert(MemberDto memberDto) {
		sqlSession.insert("member.add",memberDto);
	return memberDto;	
	}
	//회원 상세 조회
	public MemberDto seleOne(MemberDto memberDto) {
		return sqlSession.selectOne("member.find",memberDto);
	}

	//	public MemberDto seleOne(String memberId) {
//		return sqlSession.selectOne("member.find",memberId);
//	}

	//리스트 불러오기
	public List<MemberDto>selectList(){
		return sqlSession.selectList("member.list");
	}
	
	
	//회원 탈퇴
	public boolean delete(String memberId) {
		return sqlSession.delete(memberId)>0;
	}
	//수정
	public boolean update(MemberDto memberDto) {
		return sqlSession.update("member.edit",memberDto)>0;
		
	}
	//이미지 연결
	public void connect(MemberDto memberDto,AttachmentDto attachmentDto) {
		Map<String, Object>params=new HashMap<>();
		params.put("memberId", memberDto.getMemberId());
		params.put("attachmentNo", attachmentDto.getAttachmentNo());
		sqlSession.insert("member.connect",params);
	}
	//이미지 찾기
	public int findAttachment(String memberId) {
		return sqlSession.selectOne("member.findImage",memberId);
	}
	//닉네임 찾기
	public MemberDto selectOneByMemberNickname(String memberNickname) {
		return sqlSession.selectOne("member.selectOneByMemberNickname",memberNickname);
	}
	
	//닉네임 찾기
	public MemberDto selectOneByMemberNickname(MemberDto  memeberDto) {
		return sqlSession.selectOne("member.selectOneByMemberNickname",memeberDto);
	}
	
	
}
