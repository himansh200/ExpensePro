package com.unnati.dao;

import java.time.Year;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.CategoryChartBean;
import com.unnati.bean.ExpenseChartBean;
import com.unnati.bean.IncomeChartBean;
import com.unnati.bean.ProfileBean;
import com.unnati.bean.UserBean;

@Repository

public class AdminDao {

	@Autowired
	JdbcTemplate stmt;
	
	public Integer getTotalExpenseForCurrentDt() {
		
		String countQuery = "select sum(amount) from expense where date = ?";
		
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
		
		return stmt.queryForObject(countQuery,Integer.class,new Object[] {today});
		
		
	}
	
	
	public Integer getTotalExpenseCountForCurrentMonth() {

		String countQuery = "select count(*) from expense where date like ?";

		// dd-mm-yyyy

		Calendar c = Calendar.getInstance();
		
		int d = c.get(c.DAY_OF_MONTH); 
		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(c.YEAR);
		
		String currentMonth ="";
	
		if(m<9) {
			currentMonth = "%-" + "0" +m +"-%" ;
			
		}
		else {
			currentMonth = "%-" +m +"-%" ;
		}
	
		return stmt.queryForObject(countQuery, Integer.class, new Object[] { currentMonth });
	}
	
	
	public Integer getTotalClientCountForCurrentMonth() {
		
		String clientCountQuery = "select count(*) from users where createdAt like ? ";
		
		Calendar c = Calendar.getInstance();
		
		int d = c.get(c.DAY_OF_MONTH);
		int m = c.get(c.MONTH)+1;
		int y = c.get(c.YEAR);
		
		String currentMonth ="";
		
		if(m<9) {
			currentMonth = "%-" + "0" +m +"-%" ;
			
		}
		else {
			currentMonth = "%-" +m +"-%" ;
		}
		
		return stmt.queryForObject(clientCountQuery, Integer.class ,new Object[] {currentMonth});
	}
	
	
	public Integer getTotalMonthlyExpense() {
		
		String monthlyExpenseQuery = "select sum(amount) from expense where date like ? ";
		
		String currentMonth ="";
		
		Calendar c = Calendar.getInstance();
		
		int d = c.get(Calendar.DAY_OF_MONTH);
		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
		
		if(m<9) {
			currentMonth = "%-" + "0" +m +"-%" ;
			
		}
		else {
			currentMonth = "%-" +m +"-%" ;
		}
		
		return stmt.queryForObject(monthlyExpenseQuery,Integer.class, new Object[] {currentMonth});
	}
	
	
	public List<ExpenseChartBean> getExpenseState() {
		
		String currentYear ="";
		
		Calendar c = Calendar.getInstance();
		
		int d = c.get(Calendar.DAY_OF_MONTH);
		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
			
		currentYear = y+"-%"+"-%" ;
		
	String selectQ = "select monthname(date) as Month, sum(amount) as ExpenseAmount from expense   group by month(date)";	
		
	return stmt.query(selectQ, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class));
	}


	public void updateImageUrl(ProfileBean profileBean) {
		stmt.update("update users set imageUrl = ? where userId = ?",profileBean.getImageUrl(),profileBean.getUserId());
		System.out.println("Image set");
		
	} 
	
	public void updateProfile(UserBean userBean) {

	stmt.update("update users set firstName = ?,lastName = ?,mobileno = ? where userId = ?",userBean.getFirstName(),userBean.getLastName(),userBean.getMobileno(),userBean.getUserId());	
	System.out.println("Form updated");	
		
	}
	
	
	public List<IncomeChartBean> getIncomeStates(){
		
		String selectQuery = "select monthname(date) as Month, sum(amount) as IncomeAmount from income group by month(date) ";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<IncomeChartBean>(IncomeChartBean.class));
	
	}
	

	public List<CategoryChartBean> getCategoryStats() {
		String selectQuery = "select c.categoryName ,count(*)as categoryCount from category c join expense e on e.categoryId =c.categoryId group by c.categoryName order by c.categoryName ";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<CategoryChartBean>(CategoryChartBean.class));
	}
	
	
}

