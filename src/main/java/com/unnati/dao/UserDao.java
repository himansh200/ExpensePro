package com.unnati.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.ForgetPasswordBean;
import com.unnati.bean.LoginBean;
import com.unnati.bean.UpdatePasswordBean;
import com.unnati.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt; 
	
	//add customer
	
	
	
	
	
	
	public List<UserBean> getAllUsers(){
		
		String selectQuery ="select * from users where role=2";
		List<UserBean> list  = stmt.query(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return list;
	}
	
	
	
	public void insertUser(UserBean userBean) {
		
Calendar c =Calendar.getInstance();
		
		int ddd = c.get(Calendar.DATE);
		int mmm = c.get(Calendar.MONTH) + 1;
		int yyy = c.get(Calendar.YEAR);

		String today = "";

		if (mmm < 10) {
			today = yyy +"-0" + mmm+"-" + ddd;
		} else {
			today =   yyy + "-" + mmm +  "-" + ddd;
		}
		System.out.println("TODAY => " + today);
		
		
		String insertQuery = "insert into users(firstname, lastname ,email,password,role,dob,mobileno,gender,createdAt) values(?,?,?,?,?,?,?,?,?)";
		stmt.update(insertQuery,userBean.getFirstName(),userBean.getLastName(),userBean.getEmail(),userBean.getPassword(),2,userBean.getDob(),userBean.getMobileno(),userBean.getGender(),today);
		
	}
	public UserBean authenticateUser(LoginBean loginBean) {
		try {
			String loginQuery = "select * from users where email = ? and password = ? ";
			UserBean user = stmt.queryForObject(loginQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] { loginBean.getEmail(), loginBean.getPassword() });

			return user;
		} catch (Exception e) {
			System.out.println("SMW --> UserDao::authenticateUser()");
			System.out.println(e.getMessage()); 
		}
		return null;
	}
	
	public UserBean findUserByEmail(ForgetPasswordBean forgetPasswordBean) {
		try {
			String selectEmailQuery = "select * from users where email = ?";
			UserBean user = stmt.queryForObject(selectEmailQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] { forgetPasswordBean.getEmail() });

			return user;
		} catch (Exception e) {
			System.out.println("SMW --> UserDao::authenticateUser()");

			
			System.out.println(e.getMessage()); 
		}
		return null;
	}

	public void updateOtp(String email,String otp) {
			String updateOtpQuery = "update users set otp = ? where email = ?";
			stmt.update(updateOtpQuery,otp,email);
	}
	
//	public void updateMypassword(UpdatePasswordBean upBean) {
//		String updateQuery = "update users set password = ?,otp=? where email=?";
//		stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
//		
//	}
	
	public void updateMyPassword(UpdatePasswordBean upBean) {
		String updateQuery = "update users set password = ? , otp = ? where email = ? ";
		stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
	}

	
	public UserBean verifyOtpByEmail(UpdatePasswordBean upBean) {
		try {
			String otpQuery = "select * from users where email = ? and otp = ? ";
			UserBean user = stmt.queryForObject(otpQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] { upBean.getEmail(), upBean.getOtp() });

			return user;
		} catch (Exception e) {
			System.out.println("SMW --> UserDao::verifyOtpByEmail()");
			System.out.println(e.getMessage()); 
		}
		return null;
	}
	
	public UserBean getUserByEmail(String email) {
		String selectQuery = "select * from users where email  = ?";
		try {
		return stmt.queryForObject(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
				new Object[] { email });
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	
	
}
