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


//	public int sequence() {
//		String sql = "select work_seq.nextval from dual";// dual=임시테이블
//		return jdbcTemplate.queryForObject(sql, int.class);
//	}

	// 목록 조회

	// 상세 페이지
//	public WorkDto seleOne(int workNo) {
//		String sql = "select * from work where work_no = ? ";
//		Object[] data = { workNo };
//		List<WorkDto> list = jdbcTemplate.query(sql, workMapper, data);
//		return list.isEmpty() ? null : list.get(0);
//	}


	// 이미지 조회
//	public void connect(int workNo, int attachmentNo) {
//		String sql = "insert into work_profile (" + "work_no, attachment_no" + ") values(?, ?)";
//		Object[] data = { workNo, attachmentNo };
//		jdbcTemplate.update(sql, data);
//	}

	// 챕터 조회?
//	public List<WorkDto> selectListByWorkNo(int workNo) {
//	    String sql = "SELECT * FROM chapter WHERE work_no = ? ORDER BY chapter_no ASC";
//	    return jdbcTemplate.query(sql, workMapper, workNo);
//	}

//	public List<>selectListByworkNo(int)

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
//	public List<WorkDto> selectList() {
//		return sqlSession.selectList("work.list");
//	}
	public List<WorkListViewDto>selectList(){
		return sqlSession.selectList("work.viewList");
	}

	// 상세 조회
	public WorkDto seleOne(WorkDto workDto) {
		return sqlSession.selectOne("work.find", workDto);
	}
	// 조회
	public WorkDto seleOne(int workNo) {
		return sqlSession.selectOne("work.find", workNo);
	}
	//뷰 조회
	public WorkListViewDto selectOne(int workNo) {
		return sqlSession.selectOne("work.");
	}
	
	//이미지 연결
	public void connect(WorkDto workDto,AttachmentDto attachmentDto) {
		Map<String, Object>params=new HashMap<>();
		params.put("workNo", workDto.getWorkNo());
		params.put("attachmentNo", attachmentDto.getAttachmentNo());
		sqlSession.insert("work.connect",params);
	}
	// 삭제 이미지 찾기
	public int findAttachment(int workNo) {
		return sqlSession.selectOne("work.findProfile",workNo);
	}
	
	
}
