package com.unnati.controller;

import java.io.File;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.unnati.bean.ForgetPasswordBean;
import com.unnati.bean.LoginBean;
import com.unnati.bean.ProfileBean;
import com.unnati.bean.UpdatePasswordBean;
import com.unnati.bean.UserBean;
import com.unnati.dao.AdminDao;
import com.unnati.dao.UserDao;
import com.unnati.service.EmailServices;
import com.unnati.util.OtpGenerator;

@Controller
public class SessionController {
	@Autowired
	UserDao userDao;
	//jsp open
	@Autowired
	EmailServices emailServices;
	
	
	@Autowired
	AdminDao adminDao;
	
	
	@GetMapping("/signup")
	public String signup() {
		return "Signup";
	}
	
	//jsp input process
	
	@PostMapping("/saveuser")
	public String saveuser(UserBean user, Model model) {
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		/* userDao.insertUser(user); */
		
		UserBean userBean = userDao.getUserByEmail(user.getEmail());
		if (userBean == null) {
			// insert
			userDao.insertUser(user);
		
		return "Login";
		}
		
		else {
			model.addAttribute("error","Email is already Registerd with Us");
			return "Signup";
		}
		
		
		
	}
	@GetMapping("/login") // URL => Browser
	public String login() {
		return "Login";// JSP NAME
	}
	//on submit of Login.jsp 
	
	@PostMapping("/authentication")
	public String authentication(LoginBean login, Model model,HttpServletResponse response, HttpSession session) {
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
			// cookie
			Cookie c1 = new Cookie("userId", userBean.getUserId()+"");
			Cookie c2 = new Cookie("firstName",userBean.getFirstName());
			// add Cookie
			response.addCookie(c1);
			response.addCookie(c2);
			
			//session
			session.setAttribute("userId", userBean.getUserId());
			session.setAttribute("user", userBean);
			// set max interval time
			session.setMaxInactiveInterval(60*5);
			
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
	
	
	/*
	 * @GetMapping("/home") public String home() {
	 * 
	 * return "Home"; }
	 */
	@GetMapping("/")
	public String root() {
		return "Login";
	}

	@GetMapping("/forgetpassword")
	public String forgetPassword() {
		return "ForgetPassword";
	}
	
	
	

	@PostMapping("/sendotpforgetpassword")
	public String sendOtpForForgetPassword(ForgetPasswordBean forgetPasswordBean,Model model) {
		System.out.println(forgetPasswordBean.getEmail());
	
	UserBean user =   userDao.findUserByEmail(forgetPasswordBean);//email is correct 
		if(user == null) {
			//error 
		model.addAttribute("error","Invalid Email");
			return "ForgetPassword";
	}
		else {
		//otp 
		//generate otp
	//int otp = (int)(Math.random()*1000000);
		
		String otp  = OtpGenerator.generateOTP(6);//XX
		userDao.updateOtp(forgetPasswordBean.getEmail(), otp);//XX 
			//user set --> email 
			//send mail 
			emailServices.sendEmailForForgetPassword(forgetPasswordBean.getEmail(), otp);
			
		return "redirect:/updatepasswordjspopen";
	}
		
	}
	
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
			userDao.updateMyPassword(upBean);
			return "Login";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	
	

	@GetMapping("/myuserprofile")
	public String myProfile(Model model) {
		
		
		return "MyUserProfile";
	}
	
	
	@PostMapping("/saveuserprofilepic")
	public String saveProfilePic(ProfileBean profileBean) {
	
	System.out.println(profileBean.getUserId());
//	System.out.println(profileBean.getProfileImg().getOriginalFilename());
	
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
		
		return "redirect:/myuserprofile" ;
	}
	
	
	
	
	
	
	 @PostMapping("/saveuserprofile")
	 public String myUserProfilePic(UserBean userBean) {
		 System.out.println(userBean.getUserId());
			adminDao.updateProfile(userBean);
			System.out.println(userBean.getLastName());
			
			
			
			return "redirect:/myuserprofile" ;
	 }
	
	
	
	
}