package com.unnati.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.unnati.bean.CategoryBean;
import com.unnati.dao.CategoryDao;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;

	@GetMapping("/newcategory")
	// url---- browser
	public String newCategory(HttpServletRequest request) // method
	{
		// cookie name
		// cookie userid

		int userId = -1;
		String firstName = "";
		// read all cookies from request
		Cookie c[] = request.getCookies();

		for (Cookie x : c) {
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if (x.getName().equals("firstName")) {
				firstName = x.getValue();
			}

		}

		return "NewCategory"; // jsp---open

	}

	@PostMapping("/savecategory")
	public String saveCategory(CategoryBean categoryBean) {
		System.out.println(categoryBean.getCategoryName()); // get category name
		categoryDao.addCategory(categoryBean);
		return "NewCategory";
	}

	@GetMapping("/listcategories")

	public String listCategory(Model model) {
		// pull all category from db-table
		List<CategoryBean> list = categoryDao.getAllCategory();
		model.addAttribute("list", list);
		return "ListCategory";
	}

	@GetMapping("/deletecategory/{categoryId}")
	public String deleteCategory(@PathVariable("categoryId") Integer categoryId) {
		// Pathvariable is used to take input from hyperlink
		// 12 15
		categoryDao.deleteCategory(categoryId);

		return "redirect:/listcategories";
	}

	@GetMapping("/viewcategory/{categoryId}")
	public String viewCategory(@PathVariable("categoryId") Integer categoryId, Model model) {
		CategoryBean categoryBean = categoryDao.getCategoryById(categoryId);
		model.addAttribute("categoryBean", categoryBean);

		return "ViewCategory";

	}

	@GetMapping("/editcategory")

	public String editCategory(@RequestParam("categoryId") Integer categoryId, Model model) {

		CategoryBean categoryBean = categoryDao.getCategoryById(categoryId);
		System.out.println(categoryBean.getCategoryId());
		model.addAttribute("categoryBean",categoryBean);
		
		
		
		
		
		return "EditCategory";
	}

	
	@PostMapping("/updatecategory")
	public String updateCategory(CategoryBean categoryBean) {
		categoryDao.updateCategory1(categoryBean);
		System.out.println(categoryBean.getCategoryName());
		return "redirect:/listcategories";
	}
	
	
	
	
	
	
}
