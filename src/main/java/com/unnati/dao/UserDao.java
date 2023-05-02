package com.unnati.dao;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.CategoryChartBean;
import com.unnati.bean.ExpenseChartBean;
import com.unnati.bean.ForgetPasswordBean;
import com.unnati.bean.LoginBean;
import com.unnati.bean.UpdatePasswordBean;
import com.unnati.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;

	Calendar c = Calendar.getInstance();
	int d = c.get(c.DAY_OF_MONTH); // 07
	int m = c.get(c.MONTH) + 1;// 03
	int y = c.get(c.YEAR);

	LocalDate localDate = LocalDate.now();
	int day = localDate.getDayOfMonth();
	int month = localDate.getMonthValue();
	int year = localDate.getYear();
	String date = "";

	// add customer

	public List<UserBean> getAllUsers() {

		String selectQuery = "select * from users where role=2";
		List<UserBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return list;
	}

	public void insertUser(UserBean userBean) {

		Calendar c = Calendar.getInstance();

		int ddd = c.get(Calendar.DATE);
		int mmm = c.get(Calendar.MONTH) + 1;
		int yyy = c.get(Calendar.YEAR);

		String today = "";

		if (mmm < 10) {
			today = yyy + "-0" + mmm + "-" + ddd;
		} else {
			today = yyy + "-" + mmm + "-" + ddd;
		}
		System.out.println("TODAY => " + today);

		String insertQuery = "insert into users(firstname, lastname ,email,password,role,dob,mobileno,gender,createdAt) values(?,?,?,?,?,?,?,?,?)";
		stmt.update(insertQuery, userBean.getFirstName(), userBean.getLastName(), userBean.getEmail(),
				userBean.getPassword(), 2, userBean.getDob(), userBean.getMobileno(), userBean.getGender(), today);

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

	public void updateOtp(String email, String otp) {
		String updateOtpQuery = "update users set otp = ? where email = ?";
		stmt.update(updateOtpQuery, otp, email);
	}

//	public void updateMypassword(UpdatePasswordBean upBean) {
//		String updateQuery = "update users set password = ?,otp=? where email=?";
//		stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
//		
//	}

	public void updateMyPassword(UpdatePasswordBean upBean) {
		String updateQuery = "update users set password = ? , otp = ? where email = ? ";
		stmt.update(updateQuery, upBean.getPassword(), "", upBean.getEmail());
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public Integer getTotalExpenseForCurrentDtUser(int userId) {

		String countQuery = "select sum(amount) from expense where userId = ? and date = ?";

		Calendar c = Calendar.getInstance();

		int ddd = c.get(Calendar.DATE);
		int mmm = c.get(Calendar.MONTH) + 1;
		int yyy = c.get(Calendar.YEAR);

		String today = "";

		if (mmm < 10) {
			today = yyy + "-0" + mmm + "-" + ddd;
		} else {
			today = yyy + "-" + mmm + "-" + ddd;
		}
		System.out.println("TODAY => " + today);

		return stmt.queryForObject(countQuery, Integer.class, new Object[] { userId, today });

	}

	public Integer getTotalExpenseCountForCurrentMonthUser(int userId) {

		String countQuery = "select count(*) from expense where userId = ? and date like ?";

		// dd-mm-yyyy

		Calendar c = Calendar.getInstance();

		int d = c.get(c.DAY_OF_MONTH);
		int m = c.get(Calendar.MONTH) + 1;
		int y = c.get(c.YEAR);

		String currentMonth = "";

		if (m < 9) {
			currentMonth = "%-" + "0" + m + "-%";

		} else {
			currentMonth = "%-" + m + "-%";
		}

		return stmt.queryForObject(countQuery, Integer.class, new Object[] { userId, currentMonth });
	}

	public Integer getTotalMonthlyExpenseUser(int userId) {

		String monthlyExpenseQuery = "select sum(amount) from expense where userId = ? and date like ? ";
		String currentMonth = "";

		Calendar c = Calendar.getInstance();

		int d = c.get(Calendar.DAY_OF_MONTH);
		int m = c.get(Calendar.MONTH) + 1;
		int y = c.get(Calendar.YEAR);

		if (m < 9) {
			currentMonth = "%-" + "0" + m + "-%";

		} else {
			currentMonth = "%-" + m + "-%";
		}

		return stmt.queryForObject(monthlyExpenseQuery, Integer.class, new Object[] { userId, currentMonth });
	}

	public Integer getTotalExpenseOfYear(int userId) {

		String countQuery = "select sum(amount) from expense where userId = ? and date like ?";

		Calendar c = Calendar.getInstance();

		String currentYear = "";

		int d = c.get(Calendar.DAY_OF_MONTH);
		int m = c.get(Calendar.MONTH) + 1;
		int y = c.get(Calendar.YEAR);

		currentYear = +y + "-%" + "-%";

		return stmt.queryForObject(countQuery, Integer.class, new Object[] { userId, currentYear });

	}

	public List<ExpenseChartBean> getExpenseStats(int userId) {
		String selectQuery = "select monthname(date) as month, sum(amount) as expenseAmount from expense where userId = ? and year(date) like ? group by monthname(date),month(date) order by month(date)";
		LocalDate today = LocalDate.now();
		Integer year = today.getYear();

		return stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class),
				new Object[] { userId, year });
	}

	public List<CategoryChartBean> getCategoryStats(int userId) {
		String selectQuery = " SELECT c.categoryName, COUNT(*) AS categoryCount  FROM category c  JOIN expense e ON e.categoryId = c.categoryId where userId =? GROUP BY c.categoryName ORDER BY c.categoryName";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<CategoryChartBean>(CategoryChartBean.class),
				new Object[] { userId });
	}
	
}
