package com.kh.jagpum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.AttachmentDto;
import com.kh.jagpum.dto.WorkDto;
import com.kh.jagpum.dto.WorkListViewDto;


@Repository
public class WorkDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;


	@Autowired
	private SqlSession sqlSession;




	// 1권 등록 관리자 전용 등록 창
	public WorkDto insert(WorkDto workDto) {
		int workNo = sqlSession.selectOne("work.sequence");
		workDto.setWorkNo(workNo);
		sqlSession.insert("work.add", workDto);
		return workDto;
	}

	// 회원 전용 등록 창
	public WorkDto insert2(WorkDto workDto) {
		int workNo = sqlSession.selectOne("work.sequence");
		workDto.setWorkNo(workNo);
		sqlSession.insert("work.add2", workDto);
		
		return workDto;
	}

	// 삭제
	public boolean delete(int workNo) {
		return sqlSession.delete("work.delete", workNo) > 0;
	}
	
	// 수정
	public boolean update(WorkDto workDto) {
		return sqlSession.update("work.edit", workDto) > 0;
	}
	
	// 목록 조회
	public List<WorkDto> selectList() {
		return sqlSession.selectList("work.list");
	}
	
	public List<WorkListViewDto>selectListview(){
		return sqlSession.selectList("work.viewList");
	}
	
	//뷰 상세 조회
	public WorkListViewDto selectListviewBy(int workNo) {
		return sqlSession.selectOne("work.workListView",workNo);
	}
	
	// 상세 조회
	public WorkDto seleOne(WorkDto workDto) {
		return sqlSession.selectOne("work.find", workDto);
	}
	// 조회
	public WorkDto seleOne(int workNo) {
		return sqlSession.selectOne("work.find", workNo);
	}
	
	
	//이미지 연결
	public void connect(WorkDto workDto,AttachmentDto attachmentDto) {
		Map<String, Object>params=new HashMap<>();
		params.put("workNo", workDto.getWorkNo());
		params.put("attachmentNo", attachmentDto.getAttachmentNo());
		sqlSession.insert("work.connect",params);
	}
	// 이미지 찾기
	public int findAttachment(int workNo) {
		return sqlSession.selectOne("work.findProfile",workNo);
	}
	
	
}

	
