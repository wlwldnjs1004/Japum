package com.kh.jagpum.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;


@Repository
public class ChapterDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Autowired
//	private ChapterMapper chapterMapper;
//	
//
//	
//	//작품 카운팅
//	public int getNextChapterOrder(int workNo) {
//	    String sql = "SELECT NVL(MAX(chapter_order), 0) + 1 FROM chapter WHERE work_no = ?";
//	    return jdbcTemplate.queryForObject(sql, Integer.class, workNo);
//	}
//
//	
//	//챕터 등록
//	public void insert(ChapterDto chapterDto) {
//		String sql = "insert into chapter("
//							+ "chapter_no, "
//							+ "work_no, "
//							+ "chapter_title, "
//							+ "chapter_detail, "
//							+ "chapter_comment, "
//							+ "chapter_order "
//						+ ") "
//						+ "values(chapter_seq.nextval, ?,?,?,?,?)";
//		Object[] data = {
//				chapterDto.getWorkNo(),
//	chapterDto.getChapterTitle(),
//	chapterDto.getChapterDetail(),
//	chapterDto.getChapterComment(),
//	   chapterDto.getChapterOrder()
//		};
//		jdbcTemplate.update(sql, data);
//	}
//	
//
//	
//	//상세 페이지
//	public ChapterDto seleOne(int chapterNo) {
//		String sql="select * from chapter where chapter_no = ? ";
//		Object[] data= {chapterNo};
//		List<ChapterDto>list=jdbcTemplate.query(sql,chapterMapper,data);
//		return list.isEmpty ()? null : list.get(0);
//	}
//	
//	
//	//챕터 리스트 
//	public List<ChapterDto> selectList() {
//		String sql = "select * from chapter";
//		return jdbcTemplate.query(sql, chapterMapper);
//	}
//	
//	
//	//챕터 조회?
//	public List<ChapterDto> selectListByWorkNo(int workNo) {
//	    String sql = "SELECT * FROM chapter WHERE work_no = ? ORDER BY chapter_no ASC";
//	    return jdbcTemplate.query(sql, chapterMapper, workNo);
//	}
//	
//	
//	//삭제
//	public boolean delete(int chapterNo) {
//		String sql="delete chapter where chapter_no = ?";
//		Object[] data= {chapterNo};
//		return jdbcTemplate.update(sql, data) > 0;
//	}

	
}
