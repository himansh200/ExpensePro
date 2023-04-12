package com.unnati.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.BatchProperties.Jdbc;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import com.unnati.bean.CategoryBean;
import com.unnati.bean.SubCategoryBean;

@Repository
public class SubCategoryDao {
	@Autowired
	JdbcTemplate stmt;
	
	
	
	//add
	
	public void addSubCategory(SubCategoryBean subCategoryBean) {
		String insertQuery = "insert into subcategory(subCategoryName,categoryID,deleted) values(?,?,?)";
		stmt.update(insertQuery,subCategoryBean.getSubCategoryName(),subCategoryBean.getCategoryId(),false);
		
	}
	
	/*
	 * public List<SubCategoryBean> getAllSubCategory() { String selectQuery =
	 * "select * from subcategory where deleted = false"; List<SubCategoryBean> list
	 * = stmt.query(selectQuery, new
	 * BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class)); return list;
	 * }
	 */
	
	
	 public List<SubCategoryBean> getAllSubCagetgory() {
			
			String joinQuery = "select c.categoryName , sc.categoryId,sc.subCategoryId,sc.subCategoryName,sc.deleted from category c , subcategory sc where c.categoryId = sc.categoryId and sc.deleted = false";
			List<SubCategoryBean> list =stmt.query(joinQuery,new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
		
			return list;
		}

	
	
	 public void deleteSubCategory(Integer subCategoryId) {
			String updateQuery = "update subcategory set deleted = true where subCategoryId = ?";
			stmt.update(updateQuery,subCategoryId); 
	   }
	 
		/*
		 * public SubCategoryBean getSubCategoryById(Integer subCategoryId) {
		 * 
		 * SubCategoryBean subCategoryBean = new SubCategoryBean();
		 * 
		 * try {
		 * 
		 * 
		 * subCategoryBean = stmt.
		 * queryForObject("select * from subCategory,category where subCategory.subCategoryId =? and category.categoryId = subCategory.category"
		 * , new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class),new
		 * Object[] {subCategoryId} );
		 * 
		 * 
		 * }catch (Exception e) {
		 * 
		 * System.out.println("SubCategoryDao :: getSubCategoryById() ");
		 * System.out.println(e.getMessage()); }
		 * 
		 * return subCategoryBean; }
		 * 
		 */

	 	 
	 	  

}

 	