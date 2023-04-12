package com.unnati.dao;

import java.time.Year;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.ExpenseChartBean;

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
	
		if(m<=9){
			currentMonth = "%-" + "0"+m+ "-%"; 
		}else if(m>9){
			currentMonth = "%-" +m+ "-%"; 
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
		
	String selectQ = "select monthname(date) as Month, sum(amount) as ExpenseAmount from expense   group by month(date)";	
		
	
	String currentYear ="";
	
	Calendar c = Calendar.getInstance();
	
	int d = c.get(Calendar.DAY_OF_MONTH);
	int m = c.get(Calendar.MONTH)+1;
	int y = c.get(Calendar.YEAR);
		
	currentYear = y+"-%"+"-%" ;
	

	
	return stmt.query(selectQ, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class));
	} 
	
	
	
	
}

