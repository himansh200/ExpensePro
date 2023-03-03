package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.AcountTypeBean;
import com.unnati.bean.StatusBean;
import com.unnati.dao.AcountTypeDao;

@Controller
public class AcountTypeController {

	@Autowired
	AcountTypeDao acountTypeDao;
	
	@GetMapping("/acounttype")
	public String acountType(AcountTypeBean acountTypeBean) {
		return "AcountType";
	}
	
	@PostMapping("/saveacounttype")
	public String saveAcountType(AcountTypeBean acountTypeBean)
	{
		System.out.println(acountTypeBean.getAcountTypePay());  //get category name
		acountTypeDao.addAcountType(acountTypeBean);
		return "AcountType";
		
	}
	
@GetMapping("/listacounttype")
	
	public String listStatus(Model model) {
		// pull all category from db-table
		List<AcountTypeBean> list = acountTypeDao.getAllAcountType();
		model.addAttribute("list",list);
		return "ListAcountType";
	
	}
	
}
