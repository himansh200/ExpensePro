package com.unnati.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.AcountTypeBean;
import com.unnati.bean.CategoryBean;
import com.unnati.bean.ExpenseBean;
import com.unnati.bean.StatusBean;
import com.unnati.bean.SubCategoryBean;
import com.unnati.bean.VendorBean;
import com.unnati.dao.AcountTypeDao;
import com.unnati.dao.CategoryDao;
import com.unnati.dao.ExpenseDao;
import com.unnati.dao.StatusDao;
import com.unnati.dao.SubCategoryDao;
import com.unnati.dao.VendorDao;

@Controller
public class ExpenseController {

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SubCategoryDao subCategoryDao;
	@Autowired
	VendorDao vendorDao;
	@Autowired
	AcountTypeDao acountTypeDao;
	@Autowired
	StatusDao statusDao;
	@Autowired
	ExpenseDao expenseDao;
	
	@GetMapping("/addexpense")
	public String addExpense(Model model) {
		List<CategoryBean> categoryList = categoryDao.getAllCategory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("categoryList",categoryList);
		
		List<SubCategoryBean> subCategoryList = subCategoryDao.getAllSubCagetgory();
		System.out.println(subCategoryDao.getAllSubCagetgory());
		model.addAttribute("subCategoryList",subCategoryList);
		
		List<VendorBean> vendorList = vendorDao.getAllVendor();
		System.out.println(vendorDao.getAllVendor());
		model.addAttribute("vendorList",vendorList);
	
		List<StatusBean> statusList = statusDao.getAllStatus();
		System.out.println(statusDao.getAllStatus());
		model.addAttribute("statusList",statusList);
		
		List<AcountTypeBean> acountTypeList = acountTypeDao.getAllAcountType();
		System.out.println(acountTypeDao.getAllAcountType());
		model.addAttribute("acountTypeList", acountTypeList);
		
		
		
		
		return "AddExpense";
	}
	
	
	@PostMapping("/saveexpense")
	public String saveExpense(ExpenseBean expenseBean,HttpServletRequest request) {
		
		int userId=-1;
		String firstName ="";
		
		Cookie c[] = request.getCookies();
		for(Cookie x : c) {
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		
		System.out.println(expenseBean.getTitle());
		
			expenseBean.setUserId(userId);
			System.out.println(expenseBean.getUserId());
			expenseDao.insertExpense(expenseBean, request);
			return "redirect:/listexpense";
		
		}
	@GetMapping("/listexpense")
	public String listExpense(Model model,ExpenseBean expenseBean , HttpServletRequest request) {
		
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
				expenseBean.setUserId(userId);
				List<ExpenseBean> expenseList = expenseDao.getAllExpense(userId);
				System.out.println(expenseList);
				model.addAttribute("expenseList",expenseList);
				
		
		return"ListExpense";
	}
	
	
}
