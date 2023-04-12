package com.unnati.dao;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;
import com.unnati.bean.ExpenseBean;

@Repository
public class ExpenseDao {

	@Autowired
	JdbcTemplate stmt;

	public void insertExpense(ExpenseBean expenseBean, HttpServletRequest request) {
		int userId = -1;
		String firstName = "";
		Cookie c[] = request.getCookies();
		for (Cookie x : c) {
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if (x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		String insertQuery = "insert into expense(expenseId,title,categoryId,subCategoryId,vendorId,acounttypeId,statusId,amount,description,userId,date) values(?,?,?,?,?,?,?,?,?,?,?)";
		stmt.update(insertQuery, expenseBean.getExpenseId(), expenseBean.getTitle(), expenseBean.getCategoryId(),
				expenseBean.getSubCategoryId(), expenseBean.getVendorId(), expenseBean.getAcountTypeId(),
				expenseBean.getStatusId(), expenseBean.getAmount(), expenseBean.getDescription(),
				expenseBean.getUserId(), expenseBean.getDate());

	}
	/*
	 * public List<ExpenseBean> getAllExpense(Integer userId){ String selectQuery =
	 * "select * from expense where  userId = ?"; List<ExpenseBean> expenseList =
	 * stmt.query(selectQuery, new
	 * BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[]
	 * {userId}); return expenseList; }
	 */

	public List<ExpenseBean> getAllExpense(Integer userId) {

		String selectQuery = "select e.expenseId, e.title, e.amount, e.date, e.description ,c.categoryName , sc.subCategoryName , v.vendorName , s.statusName ,a.acountTypePay    from category c,expense e,subCategory sc,vendor v , status s , acounttype a  where  e.categoryId =c.categoryId and e.subCategoryId = sc.subCategoryId and e.vendorId= v.vendorId and  e.acountTypeId = a.acountTypeId   and e.statusId= s.statusId and userId=? ";
		List<ExpenseBean> expenselist = stmt.query(selectQuery,
				new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {userId});

		return expenselist;
	}
}

