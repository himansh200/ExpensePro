package com.unnati.dao;

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
	
	public void insertUser(UserBean userBean) {
		String insertQuery = "insert into users(firstname, lastname ,email,password,role) values(?,?,?,?,?)";
		stmt.update(insertQuery,userBean.getFirstName(),userBean.getLastName(),userBean.getEmail(),userBean.getPassword(),2);
		
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
	
	public void updateMypassword(UpdatePasswordBean upBean) {
		String updateQuery = "update users set password = ?,otp=? where email=?";
		stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
		
	}
	
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
}
