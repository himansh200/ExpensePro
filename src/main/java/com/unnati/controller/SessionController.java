package com.unnati.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.ForgetPasswordBean;
import com.unnati.bean.LoginBean;
import com.unnati.bean.UpdatePasswordBean;
import com.unnati.bean.UserBean;
import com.unnati.dao.UserDao;

@Controller
public class SessionController {
	@Autowired
	UserDao userDao;
	//jsp open
	
	@GetMapping("/signup")
	public String signup() {
		return "Signup";
	}
	
	//jsp input process
	
	@PostMapping("/saveuser")
	public String saveuser(UserBean user) {
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		userDao.insertUser(user);
		
		return "Login";
	}
	@GetMapping("/login") // URL => Browser
	public String login() {
		return "Login";// JSP NAME
	}
	//on submit of Login.jsp 
	
	@PostMapping("/authentication")
	public String authentication(LoginBean login, Model model) {
		System.out.println(login.getEmail());
		System.out.println(login.getPassword());

		// validation : true
		// db -> users -> email : password match -> loginBean:email,password
		UserBean userBean = userDao.authenticateUser(login);

		if (userBean == null) {
			// inValid
			model.addAttribute("error", "Invalid Credentials");
			return "Login";
		} else {
			// valid
			if (userBean.getRole() == 1) {
				// admin
				return "redirect:/admindashboard";
			} else if (userBean.getRole() == 2) {
				// buyer
				return "redirect:/home";
			} else {
				return "404";
			}
		}

	}
	@GetMapping("/home")
	public String home() {
		return "Home";
	}

	@GetMapping("/")
	public String root() {
		return "Login";
	}

	@GetMapping("/forgetpassword")
	public String forgetPassword() {
		return "ForgetPassword";
	}

	@PostMapping("/sendotpforforgetpassword")
	public String sendOtpForForgetPassword(ForgetPasswordBean forgetPasswordBean,Model model) {
		System.out.println(forgetPasswordBean.getEmail());
	
	UserBean user =   userDao.findUserByEmail(forgetPasswordBean);//email is correct 
		if(user == null) {
			//error 
		model.addAttribute("error","Invalid Email");
			return "ForgetPassword";
	}else {
		//otp 
		//generate otp
		//int otp = (int)(Math.random()*1000000);
		
		String otp  = OtpGenerator.generateOTP(6);//XX
		userDao.updateOtp(forgetPasswordBean.getEmail(), otp);//XX 
			//user set --> email 
			//send mail 
			emailService.sendEmailForForgetPassword(forgetPasswordBean.getEmail(), otp);
			return "redirect:/updatepasswordjspopen";
	}
//		
//		
//	}
	
	@GetMapping("/updatepasswordjspopen")
	public String updatePasswordJspOpen() {
		return "UpdatePassword";
		
	}
	
	@PostMapping("/updatemypassword")
	public String udpateMyPassword(UpdatePasswordBean upBean) {
		System.out.println(upBean.getEmail());
		System.out.println(upBean.getPassword());
		System.out.println(upBean.getOtp());

		//email otp password confirmpassword  - nt blank
		//password  - confirmpassword 
		// otp == dbOtp

		UserBean user = userDao.verifyOtpByEmail(upBean);
		if (user == null) {
			return "UpdatePassword";
		} else {
			userDao.updateMypassword(upBean);
			return "Login";
		}
		
	}
	

}