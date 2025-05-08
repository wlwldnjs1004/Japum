package com.kh.jagpum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.ChapterDto;
import com.kh.jagpum.dto.WorkListViewDto;


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
public List<WorkListViewDto> workList(int workNo) {
	return sqlSession.selectList("chapter.workList",workNo);
}


// 상세
public ChapterDto seleOne(ChapterDto chapterDto) {
	
	return sqlSession.selectOne("chapter.find", chapterDto);
}
//상세 조회
//public ChapterDto seleOne(int chapterNo) {
//	return sqlSession.selectOne("chapter.find", chapterNo);
//}


//상세 조회 + 조회수 증가 포함
public ChapterDto seleOne(int chapterNo) {
 // 1. 조회수 증가
 this.increaseView(chapterNo);

 // 2. 상세 정보 반환
 return sqlSession.selectOne("chapter.selectOne", chapterNo);
}

//조회수 증가
public void increaseView(int chapterNo) {
    sqlSession.update("chapter.increaseView", chapterNo);
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
//다음화 넘어가기 버튼을 위한 조회 버튼
public ChapterDto seleOrOne(int workNo, int currentOrder) {
    Map<String, Object> param = new HashMap<>();
    param.put("workNo", workNo);
    param.put("nextOrder", currentOrder + 1); // Java에서 계산

    return sqlSession.selectOne("chapter.NextChapterOrder", param);
}

}
