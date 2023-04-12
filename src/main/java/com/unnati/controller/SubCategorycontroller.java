package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.CategoryBean;
import com.unnati.bean.SubCategoryBean;
import com.unnati.dao.CategoryDao;
import com.unnati.dao.SubCategoryDao;

@Controller
public class SubCategorycontroller {

	@Autowired
	CategoryDao  categoryDao;
	@Autowired
	SubCategoryDao subCategoryDao;
	
	@GetMapping("/subcategories")
	public String subCategories(Model model) {
		List<CategoryBean> list = categoryDao.getAllCategory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("list",list);
		
		return "NewSubCategory";
	}
	
	@PostMapping("/savesubcategory")
	public String saveSubCategory(SubCategoryBean subCategoryBean) {
		
		System.out.println(subCategoryBean.getSubCategoryId());
		System.out.println(subCategoryBean.getSubCategoryName());
		System.out.println(subCategoryBean.getCategoryId());
		subCategoryDao.addSubCategory(subCategoryBean);
		return "redirect:/listsubcategories";
	}
	
	@GetMapping("/listsubcategories")
	public String listSubCategory(Model model) {
		// pull all sub subcategory from db table 
		List<SubCategoryBean> list = subCategoryDao.getAllSubCagetgory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("list",list);
		return "ListSubCategory";
		
	}
	@GetMapping("/deletesubcategory/{subCategoryId}")
	public String deleteCategory(@PathVariable("subCategoryId")Integer subCategoryId) {
		//Pathvariable is used to take input from hyperlink
		//12 15
		subCategoryDao.deleteSubCategory(subCategoryId);
		
		return "redirect:/listsubcategories";
	}
}
