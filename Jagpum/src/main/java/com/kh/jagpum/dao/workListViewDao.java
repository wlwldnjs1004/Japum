package com.kh.jagpum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jagpum.dto.WorkListViewDto;


@Repository
public class workListViewDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<WorkListViewDto>selectList(){
		String sql="select * from work_list_view order by work_no desc";
		return jdbcTemplate.query(sql, workListViewMapper);
	}
	
	public WorkListViewDto seleOne(int workNo) {
		String sql="select * from work_list_view where work_no = ? ";
		Object[] data= {workNo};
		List<WorkListViewDto>list=jdbcTemplate.query(sql,workListViewMapper,data);
		return list.isEmpty ()? null : list.get(0);
	}
	public List<WorkListViewDto>selectList(){
		return sqlSession.selectOne("work.")
	}
	
	
}
