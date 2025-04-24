package com.kh.jagpum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.AttachmentDto;


@Repository
public class AttachmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	public AttachmentDto insert(AttachmentDto attachmentDto) {
		int attachmentNo = sqlSession.selectOne("attachment.sequence");
		attachmentDto.setAttachmentNo(attachmentNo);
		sqlSession.insert("attachment.add", attachmentDto);
		return attachmentDto;
		//return sqlSession.selectOne("attachment.find", attachmentNo);
	}

	public AttachmentDto selectOne(int attachmentNo) {
		return sqlSession.selectOne("attachment.find",attachmentNo);
	}
	
	public boolean delete(int attachmentNo) {
		return sqlSession.delete("attachment.delete",attachmentNo)>0;
	}

}






