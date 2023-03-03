package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.CategoryBean;
import com.unnati.bean.StatusBean;
import com.unnati.dao.StatusDao;

@Controller
public class StatusController {

	@Autowired
	StatusDao statusDao;
	
	@GetMapping("/status")   //url 
	public String status() {    //methd
		
		return "Status";      //jsp
	}
	
	@PostMapping("/savestatus")
	public String saveStatus(StatusBean statusBean)
	{
		System.out.println(statusBean.getStatusName());  //get category name
		statusDao.addStatus(statusBean);
		return "Status";
	}
	
	@GetMapping("/liststatus")
	
	public String listStatus(Model model) {
		// pull all category from db-table
		List<StatusBean> list = statusDao.getAllStatus();
		model.addAttribute("list",list);
		return "ListStatus";
	
	}

}
