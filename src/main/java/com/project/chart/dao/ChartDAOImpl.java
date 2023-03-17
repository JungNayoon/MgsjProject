package com.project.chart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.chart.dto.DashBoardDTO;

@Repository
public class ChartDAOImpl implements ChartDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "mappers.dashboardMapper";
	
	@Override
	public List<DashBoardDTO> Dash() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".dash");
	}
}
