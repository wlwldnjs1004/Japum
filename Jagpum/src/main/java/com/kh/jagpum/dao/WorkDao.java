	package com.kh.jagpum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;




@Repository
public class WorkDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Autowired
//	private WorkMapper workMapper;
//	
//	@Autowired
//	private SqlSession sqlSession;
//	
//	//커버 등록 
//	public void insert(WorkDto workDto) {
//		String sql = "insert into work("
//							+ "work_no, "
//							+ "work_id, "
//							+ "work_name, "
//							+ "work_genre, "
//							+ "work_sub_genre, "
//							+ "work_prefer, "
//							+ "work_paid, "
//							+ "work_contract,"
//							+ "work_subtotal "
//						+ ") "
//						+ "values(work_seq.nextval,?,?,?,?,?,?,?,?)";
//		Object[] data = {
//				workDto.getWorkId(),
//				workDto.getWorkName(),
//				workDto.getWorkGenre(),
//				workDto.getWorkSubGenre(),
//				workDto.getWorkPrefer(),
//				workDto.getWorkPaid(),
//				workDto.getWorkContract(),
//				workDto.getWorkSubtotal()
//		};
//		jdbcTemplate.update(sql, data);
//	}
//	//
//	public void insert2(WorkDto workDto) {
//		String sql = "insert into work("
//							+ "work_no, "
//							+ "work_id, "
//							+ "work_name, "
//							+ "work_genre, "
//							+ "work_sub_genre, "
//							+ "work_prefer, "
//							+ "work_paid, "
//							+ "work_contract, "
//							+ "work_subtotal "
//						+ ")"
//						+ "values(?,?,?,?,?,?,?,?,?)";
//		Object[] data = {
//				workDto.getWorkNo(),
//				workDto.getWorkId(),
//				workDto.getWorkName(),
//				workDto.getWorkGenre(),
//				workDto.getWorkSubGenre(),
//				workDto.getWorkPrefer(),
//				workDto.getWorkPaid(),
//				workDto.getWorkContract(),
//				workDto.getWorkSubtotal()
//		};
//		jdbcTemplate.update(sql, data);
//		
//	}
//	//관리자 등록 
//	public void insert3(WorkDto workDto) {
//		String sql = "insert into work("
//							+ "work_no, "
//							+ "work_id, "
//							+ "work_name, "
//							+ "work_genre, "
//							+ "work_sub_genre, "
//							+ "work_prefer, "
//							+ "work_paid, "
//							+ "work_contract,"
//							+ "work_book,  "
//							+ "work_subtotal "
//						+ ")"
//						+ "values(?,?,?,?,?,?,?,?,?,?)";
//		Object[] data = {
//				workDto.getWorkNo(),
//				workDto.getWorkId(),
//				workDto.getWorkName(),
//				workDto.getWorkGenre(),
//				workDto.getWorkSubGenre(),
//				workDto.getWorkPrefer(),
//				workDto.getWorkPaid(),
//				workDto.getWorkContract(),
//				workDto.getWorkBook(),
//				workDto.getWorkSubtotal()
//		};
//		jdbcTemplate.update(sql, data);
//	}
//	
//	
//	
//	public int sequence() {
//		String sql = "select work_seq.nextval from dual";//dual=임시테이블
//		return jdbcTemplate.queryForObject(sql, int.class);
//	}
//	
//	
//	//목록 조회
//	public List<WorkDto> selectList() {
//		String sql = "select * from work ";
//		return jdbcTemplate.query(sql, workMapper);
//	}
//	
//	
//	//상세 페이지
//	public WorkDto seleOne(int workNo) {
//		String sql="select * from work where work_no = ? ";
//		Object[] data= {workNo};
//		List<WorkDto>list=jdbcTemplate.query(sql,workMapper,data);
//		return list.isEmpty ()? null : list.get(0);
//	}
//	
//	
//	
//	//삭제 이미지 찾기
//	public int findAttachment(int workNo) {
//		String sql = "select attachment_no from work_profile "
//						+ "where work_no=?";
//		Object[] data = {workNo};
//		return jdbcTemplate.queryForObject(sql, int.class, data);
//	}
//	
//	//이미지 조회
//	public void connect(int workNo, int attachmentNo) {
//		String sql = "insert into work_profile ("
//							+ "work_no, attachment_no"
//					+ ") values(?, ?)";
//		Object[] data = { workNo, attachmentNo };
//		jdbcTemplate.update(sql, data);
//	}
//
//	//챕터 조회?
//	public List<WorkDto> selectListByWorkNo(int workNo) {
//	    String sql = "SELECT * FROM chapter WHERE work_no = ? ORDER BY chapter_no ASC";
//	    return jdbcTemplate.query(sql, workMapper, workNo);
//	}
//
//	
//	//삭제
//	public boolean delete(int workNo) {
//		String sql="delete work where work_no = ? ";
//		Object[] data = {workNo};
//		return jdbcTemplate.update(sql, data) > 0;
//	}
//
//	//수정 메소드 구현
//	public boolean update(WorkDto workDto) {
//		String sql="update work "
//				+ "set work_id= ? , "
//				+ "work_name = ? , "
//				+ "work_genre = ?, "
//				+ "work_sub_genre = ?, "
//				+ " work_prefer=? ,"
//				+ "work_paid = ? , "
//				+ "work_contract= ? , "
//				+ "work_subtotal= ? "
//				+ "where work_no= ? ";
//	Object [] data= {
//			workDto.getWorkId(),	
//			workDto.getWorkName(),
//			workDto.getWorkGenre(),
//			workDto.getWorkSubGenre(),
//			workDto.getWorkPrefer(),
//			workDto.getWorkPaid(),
//			workDto.getWorkContract(),
//			workDto.getWorkSubtotal()};
//	
//	int rows = jdbcTemplate.update(sql, data);
//	
//return rows > 0;
//	}
//	public WorkDto insert4(WorkDto workDto) {
//		int workNo=sqlSession.selectOne("work.sequence");
//		workDto.setWorkNo(workNo);
//		sqlSession.insert("work.add",workDto);
//		return workDto;
//	}
//	
	
	
}

