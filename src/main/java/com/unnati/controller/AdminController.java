package com.unnati.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.CategoryChartBean;
import com.unnati.bean.ExpenseChartBean;
import com.unnati.bean.IncomeChartBean;
import com.unnati.bean.ProfileBean;
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
		List<IncomeChartBean> incomeChart = adminDao.getIncomeStates();
		List<CategoryChartBean> categoryChartData = adminDao.getCategoryStats();
		
		
		
		model.addAttribute("TodaysExpense", todaysExpense);
		model.addAttribute("MonthlyTransaction", monthlyTransaction);
		model.addAttribute("MonthlyUsers", monthlyUsers);
		model.addAttribute("MonthlyExpense", monthlyExpense);
		model.addAttribute("chartData",chartData);
		model.addAttribute("incomeChart",incomeChart);
		model.addAttribute("categoryChartData",categoryChartData);
		
		
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

		
	@PostMapping("/saveprofilepic")
		public String saveProfilePic(ProfileBean profileBean) {
		
		System.out.println(profileBean.getUserId());
//		System.out.println(profileBean.getProfileImg().getOriginalFilename());
		
		try {
			File userDir = new File(
					"C:\\Users\\DELL 3000 SERIES\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\Expense\\src\\main\\resources\\static\\dist\\profiles",
					profileBean.getUserId() + "");
			if (userDir.exists() == false) {
				userDir.mkdir();
			}
			File file = new File(userDir, profileBean.getProfileImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file, profileBean.getProfileImg().getBytes());
			profileBean.setImageUrl("dist/profiles/" + profileBean.getUserId() + "/"
					+ profileBean.getProfileImg().getOriginalFilename());
			
			adminDao.updateImageUrl(profileBean);
			
		} catch (Exception e) {
		 e.printStackTrace();

		}
			
			return "redirect:/myprofile" ;
		}
		
	
	
	@PostMapping("/saveprofile")
	public String saveProfile(UserBean userBean) {
	System.out.println(userBean.getUserId());
		adminDao.updateProfile(userBean);
		System.out.println(userBean.getLastName());
		
		
		
		return "redirect:/myprofile" ;
	}
	
		
}
