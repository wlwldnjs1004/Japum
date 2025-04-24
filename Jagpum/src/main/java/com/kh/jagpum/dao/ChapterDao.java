package com.kh.jagpum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.ChapterDto;


@Repository
public class ChapterDao {


	@Autowired
	private SqlSession sqlSession;




// 등록
public ChapterDto insert(ChapterDto chapterDto) {

	int nextChapterOrder = sqlSession.selectOne("chapter.getNextChapterOrder", chapterDto.getWorkNo());
	int chapterNo = sqlSession.selectOne("chapter.sequence");
	
	
	chapterDto.setChapterNo(chapterNo);
	chapterDto.setChapterOrder(nextChapterOrder);
	
	sqlSession.insert("chapter.add", chapterDto);

	return chapterDto;
}

//수정
public boolean update(ChapterDto chapterDto) {
	return sqlSession.update("chapter.edit", chapterDto) > 0;
}
//가격 변경 
public boolean ChapterPriceBy(ChapterDto chapterDto) {
	return sqlSession.update("chapter.updateChapterPriceByWorkNo",chapterDto)>0;
}
//work 을 이용한 조회
public ChapterDto workList(int workNo) {
	return sqlSession.selectOne("chapter.workList",workNo);
}


// 상세
public ChapterDto seleOne(ChapterDto chapterDto) {
	return sqlSession.selectOne("chapter.find", chapterDto);
}
//상세 조회
public ChapterDto seleOne(int chapterNo) {
	return sqlSession.selectOne("chapter.find", chapterNo);
}

//삭제
public boolean delete(int chapterNo) {
	return sqlSession.delete("chapter.delete", chapterNo) > 0;
}

//챕터 카운트 정렬 조회
public List<ChapterDto> selectListByWorkNo(int workNo) {
	return sqlSession.selectList("chapter.lists", workNo);
}

//조회
public List<ChapterDto>selectList(){
	return sqlSession.selectOne("chapter.list");
}


}
