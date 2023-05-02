package com.unnati.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.CategoryChartBean;
import com.unnati.bean.ExpenseChartBean;
import com.unnati.dao.UserDao;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;
	
	
	
	@GetMapping("/home")	
	public String home(Model model,HttpServletRequest request) {

		
		int userId=-1;
		Cookie c[] = request.getCookies();
		
		for(Cookie x:c) {
			if(x.getName().endsWith("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
		}
		
		Integer todaysExpense = userDao.getTotalExpenseForCurrentDtUser(userId);
		Integer monthlyExpense = userDao.getTotalMonthlyExpenseUser(userId);
		Integer monthlyTransaction = userDao.getTotalExpenseCountForCurrentMonthUser(userId);
		Integer yearlyExpense = userDao.getTotalExpenseOfYear(userId);
		
		List<ExpenseChartBean> expenseChartData = userDao.getExpenseStats(userId);
		
		  List<CategoryChartBean> categoryChartData = userDao.getCategoryStats(userId);
		 
		
		
		model.addAttribute("TodaysExpense", todaysExpense);
		model.addAttribute("MonthlyTransaction", monthlyTransaction);
		model.addAttribute("MonthlyExpense", monthlyExpense);
		model.addAttribute("YearlyExpense", yearlyExpense);
		model.addAttribute("expenseChartDataUser",expenseChartData);
		model.addAttribute("categoryChartDataUser", categoryChartData); 
		
		
		
		return "Home";
	}
	
	
}
