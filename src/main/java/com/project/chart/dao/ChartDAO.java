package com.project.chart.dao;

import java.util.List;

import com.project.chart.dto.DashBoardDTO;

public interface ChartDAO {
	
	public List<DashBoardDTO> Dash() throws Exception;
}
