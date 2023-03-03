package com.unnati.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.unnati.bean.CategoryBean;
import com.unnati.bean.VendorBean;

@Repository
public class VendorDao {

	@Autowired
	JdbcTemplate stmt;
	
	
	public void addVendor(VendorBean vendorBean) {
		
		String insertQuery = "insert into vendor(vendorName,deleted) values(?,?)";
		stmt.update(insertQuery,vendorBean.getVendorName(),false);
	}
	
	public List<VendorBean> getAllVendor() {
		   String selectQuery = "select * from vendor where deleted = false";
		   List<VendorBean> list =  stmt.query(selectQuery, new BeanPropertyRowMapper<VendorBean>(VendorBean.class));
		   return list;
	   }
	
	 public void deleteVendor(Integer vendorId) {
			String updateQuery = "update vendor set deleted = true where vendorId = ?";
			stmt.update(updateQuery,vendorId); 
	   }
	
}
