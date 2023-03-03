package com.unnati.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.VendorBean;
import com.unnati.dao.VendorDao;

@Controller
public class VendorController {

	@Autowired
	VendorDao vendorDao;
	
	@GetMapping("/vendor")
	public String vendor(VendorBean vendorBean) {
		return "Vendor";
	}
	
	@PostMapping("/savevendor")
	public String saveVendor(VendorBean vendorBean) {
		System.out.println(vendorBean.getVendorName());
		vendorDao.addVendor(vendorBean);
		return "Vendor";
	}
	
	@GetMapping("/listvendor")
	public String listVendor(Model model) {
		List<VendorBean> list =vendorDao.getAllVendor();
		model.addAttribute("list",list);
		return "ListVendor";
	}
	
	@GetMapping("/deletevendor/{vendorId}")
	public String deleteVendor(@PathVariable("vendorId")Integer vendorId) {
		//Pathvariable is used to take input from hyperlink
		//12 15
		vendorDao.deleteVendor(vendorId);
		
		return "redirect:/listvendor";
	}
}
