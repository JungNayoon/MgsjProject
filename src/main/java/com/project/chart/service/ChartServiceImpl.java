package com.project.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.chart.dao.ChartDAO;
import com.project.chart.dto.DashBoardDTO;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Autowired
	private ChartDAO chartDAO;
	
	@Override
	public List<DashBoardDTO> Dash() throws Exception {
	
		return chartDAO.Dash();
	}
}
