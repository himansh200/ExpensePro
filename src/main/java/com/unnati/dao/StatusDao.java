package com.unnati.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.CategoryBean;
import com.unnati.bean.StatusBean;

@Repository

public class StatusDao {

	@Autowired
	JdbcTemplate stmt;
	
	 public void addStatus(StatusBean statusBean) {
		   String insertQuery = "insert into status (statusName) values (?)";
		   stmt.update(insertQuery,statusBean.getStatusName()); //insert, update, delete
		   
	   }
	 
	 public List<StatusBean> getAllStatus() {
		   String selectQuery = "select * from status ";
		   List<StatusBean> list =  stmt.query(selectQuery, new BeanPropertyRowMapper<StatusBean>(StatusBean.class));
		   return list;
	   }
}
