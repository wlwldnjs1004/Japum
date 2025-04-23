package com.kh.jagpum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jagpum.dto.ChapterDto;


@Repository
public class ChapterDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//챕터 리스트 
//	public List<ChapterDto> selectList() {
//		String sql = "select * from chapter";
//		return jdbcTemplate.query(sql, chapterMapper);
//	}
//	
//	
//	//챕터 조회?
//	public List<ChapterDto> selectListByWorkNo(int workNo) {
//	    String sql = "SELECT * FROM chapter WHERE work_no = ? ORDER BY chapter_order ASC";
//	    return jdbcTemplate.query(sql, chapterMapper, workNo);
//	}
	
	//삭제

	
	
//	public ChapterDto insert5(ChapterDto chapterDto) {
//		int chapterNo=sqlSession.selectOne("chapter.sequence");
//		workDto.set
//		int chapterOrderNo
//	}
	//등록
	public ChapterDto insert(ChapterDto chapterDto) {
		
		int nextChapterOrder = sqlSession.selectOne("chapter.getNextChapterOrder", chapterDto.getWorkNo());
		int chapterNo=sqlSession.selectOne("chapter.sequence");
	
		chapterDto.setChapterNo(chapterNo);		
		chapterDto.setChapterOrder(nextChapterOrder);
		
	    sqlSession.insert("chapter.add", chapterDto);

	    return chapterDto;
	}
	
//수정
public boolean update(ChapterDto chapterDto) {
	return sqlSession.update("chapter.edit",chapterDto)>0;
}
	//상세
	public ChapterDto seleOne(ChapterDto chapterDto) {
		return sqlSession.selectOne("chapter.find",chapterDto);
	}
	public ChapterDto seleOne(int chapterNo) {
		return sqlSession.selectOne("chapter.find",chapterNo);
	}

//삭제
public boolean delete(int chapterNo) {
	return sqlSession.delete("chapter.delete",chapterNo)>0;
}
//기준 조회
public List<ChapterDto> selectListByWorNo(int workNo) {
	return sqlSession.selectOne("chapter.lists", workNo);
}
	
}
