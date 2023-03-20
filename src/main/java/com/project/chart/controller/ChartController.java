package com.project.chart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.chart.dto.DashBoardDTO;
import com.project.chart.service.ChartService;

@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public String Dash() throws Exception {
		return "/admin/Dashboard";
	}

	@RequestMapping(value = "/admin/Dashboard22", method = RequestMethod.GET)
	@ResponseBody
	public List<DashBoardDTO> Dashboard() throws Exception {

		List<DashBoardDTO> dashboard = chartService.Dash();
		
		return dashboard;
	}
}
