package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.CategoryBean;
import com.unnati.dao.CategoryDao;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao  categoryDao;
	
	@GetMapping("/newcategory")   // url---- browser
	public String newCategory()   // method
	{    
		return "NewCategory";    // jsp---open
		
	}
	
	
	@PostMapping("/savecategory")
	public String saveCategory(CategoryBean categoryBean)
	{
		System.out.println(categoryBean.getCategoryName());  //get category name
		categoryDao.addCategory(categoryBean);
		return "NewCategory";
	}
	
	@GetMapping("/listcategories")
	
	public String listCategory(Model model) {
		// pull all category from db-table
		List<CategoryBean> list = categoryDao.getAllCategory();
		model.addAttribute("list",list);
		return "ListCategory";
	}
	
	@GetMapping("/deletecategory/{categoryId}")
	public String deleteCategory(@PathVariable("categoryId")Integer categoryId) {
		//Pathvariable is used to take input from hyperlink
		//12 15
		categoryDao.deleteCategory(categoryId);
		
		return "redirect:/listcategories";
	}
	
	
}
