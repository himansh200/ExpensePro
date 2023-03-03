<%@page import="com.unnati.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | New SubCategory</title>
</head>
<body>
<h2>NewSubCategory</h2>
<%
List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
%>

<form action ="savesubcategory" method ="post">
	Sub Category Name :<input type="text" name = "subCategoryName">
	
	Category <select name="categoryId">
	<%for(CategoryBean cb:list){ %>
	<option value ="<%=cb.getCategoryId()%>">
	<%=cb.getCategoryName() %>
	
	<%} %>
	</option>
	
	</select>
	<br><br>

	<input type="submit" value ="save subcategory"> 


</form>
<a href="listsubcategories">List Sub Category</a>

</body>
</html>