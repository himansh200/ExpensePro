package com.unnati.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.AcountTypeBean;
import com.unnati.bean.StatusBean;

@Repository
public class AcountTypeDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void addAcountType(AcountTypeBean acountTypeBean) {
		   String insertQuery = "insert into acountType (acountTypePay) values (?)";
		   stmt.update(insertQuery,acountTypeBean.getAcountTypePay()); //insert, update, delete
		   
	   }
	
	 public List<AcountTypeBean> getAllAcountType() {
		   String selectQuery = "select * from acountType ";
		   List<AcountTypeBean> list =  stmt.query(selectQuery, new BeanPropertyRowMapper<AcountTypeBean>(AcountTypeBean.class));
		   return list;
	   }
	
}
