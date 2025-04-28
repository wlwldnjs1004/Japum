package com.kh.jagpum.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.CertDto;

@Repository
public class CertDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	//등록
public int  insert(CertDto certDto) {

	return sqlSession.insert("cert.add",certDto);
}
	
	//수정
	public boolean update(CertDto certDto) {
		return sqlSession.update("cert.update",certDto)>0;
	}
	//수정 2
	public boolean updateTime(CertDto certDto) {
		return sqlSession.update("cert.confirm",certDto)>0;
	}
	//상세 조회
	public CertDto seleOne(CertDto certDto) {
		return sqlSession.selectOne("cert.find",certDto);
	} 
	//삭제
//	public boolean delete(CertDto certDto) {
//		return sqlSession.delete("cert.delete",certDto)>0;
//	}
//	
}
