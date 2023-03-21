package com.unnati.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.IncomeBean;

@Repository
public class IncomeDao {

	@Autowired
	JdbcTemplate stmt;

	public void insertIncome(IncomeBean incomeBean) {
		String insertQuery = "insert into income(title,date,userId,acountTypeId,statusId,description,amount) values(?,?,?,?,?,?,?)";
		stmt.update(insertQuery, incomeBean.getTitle(),incomeBean.getDate(),incomeBean.getUserId(),incomeBean.getAcountTypeId(),incomeBean.getStatusId(),incomeBean.getDescription(),incomeBean.getAmount());
	}
	
	public List<IncomeBean> getAllIncome(Integer userId) {
		String selectQuery = "select * from income where userId = ? ";
		List<IncomeBean> incomeList = stmt.query(selectQuery, new BeanPropertyRowMapper<IncomeBean>(IncomeBean.class),new Object[] {userId});
		return incomeList;
	}
}

