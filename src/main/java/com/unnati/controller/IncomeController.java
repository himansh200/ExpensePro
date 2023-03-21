
package com.unnati.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.AcountTypeBean;
import com.unnati.bean.IncomeBean;
import com.unnati.bean.StatusBean;
import com.unnati.dao.AcountTypeDao;
import com.unnati.dao.IncomeDao;
import com.unnati.dao.StatusDao;

@Controller
public class IncomeController {
	

	@Autowired //obj is created by IOc container "inversion of control"
	AcountTypeDao acountTypeDao;
	@Autowired
	StatusDao statusDao;
	@Autowired
	IncomeDao incomeDao;
	
	
	
	@GetMapping("/addincome")
	public String addIncome(Model model) {
		List<AcountTypeBean> accountTypeList = acountTypeDao.getAllAcountType();
		System.out.println(accountTypeList);
		model.addAttribute("accountTypeList",accountTypeList);
		
		
		List<StatusBean> statusList = statusDao.getAllStatus();
		System.out.println(statusList);
		model.addAttribute("statusList", statusList);
		
		return "AddIncome";
		
	}
	

	@PostMapping("/saveincome")
	public String saveIncome(IncomeBean incomeBean, HttpServletRequest request) {

		
		int userId =-1;
		String firstName="";
		Cookie c[] = request.getCookies();
		for(Cookie x : c) {
	
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		
		System.out.println(incomeBean.getTitle());
		System.out.println(incomeBean.getStatusId());
		
		incomeBean.setUserId(userId);
		incomeDao.insertIncome(incomeBean);
		return "redirect:/listincome";
	}
	
	@GetMapping("/listincome")
	public String listIncome(Model model, IncomeBean incomeBean, HttpServletRequest request) {
		
//
		int userId =-1;
		String firstName="";
		Cookie c[] = request.getCookies();
		for(Cookie x : c) {
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		//pull all expense from db-table
		incomeBean.setUserId(userId);
		List<IncomeBean> incomeList = incomeDao.getAllIncome(userId);
		System.out.println(incomeList);
		model.addAttribute("incomeList",incomeList);
		return "ListIncome";
	}
}
