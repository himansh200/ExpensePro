package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.unnati.bean.ExpenseChartBean;
import com.unnati.bean.UserBean;
import com.unnati.dao.AdminDao;
import com.unnati.dao.UserDao;

@Controller
public class AdminController {
	
	
	@Autowired
	AdminDao adminDao;
	@Autowired
	UserDao userDao;

	@GetMapping("/admindashboard")
	public String adminDashboard(Model model) {
		System.out.println("InSide admindashboard--url-metho--");
	
		
		Integer todaysExpense = adminDao.getTotalExpenseForCurrentDt(); 
		Integer monthlyTransaction = adminDao.getTotalExpenseCountForCurrentMonth();
		Integer monthlyUsers = adminDao.getTotalClientCountForCurrentMonth();
		Integer monthlyExpense = adminDao.getTotalMonthlyExpense();
		List<ExpenseChartBean> chartData = adminDao.getExpenseState();
		
		
		
		
		
		model.addAttribute("TodaysExpense", todaysExpense);
		model.addAttribute("MonthlyExpense", monthlyTransaction);
		model.addAttribute("MonthlyUsers", monthlyUsers);
		model.addAttribute("MonthlyExpense", monthlyExpense);
		model.addAttribute("chartData",chartData);
		return "AdminDashbord";

	}
		@GetMapping("/listusers")
		public String listUser(Model model){
			
			List<UserBean> list = userDao.getAllUsers();
			model.addAttribute("list", list);
			
			return "ListUsers";
			
			
		}
	
		
		@GetMapping("/myprofile")
		public String myProfile(Model model) {
			
			
			return "Myprofile";
		}
	
}
