<%@page import="com.unnati.bean.SubCategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List SubCategory</title>
</head>
<body>
<h3>List Sub Category</h3>


<%
List<SubCategoryBean> list =(List<SubCategoryBean>)request.getAttribute("list");
%>

<table border="1">

<tr>
	<th>SubCategory Id</th>
	<th>SubCategory Name</th>
	<th>CategoryName</th>
	<th>Category Id</th>
	<th>Deleted</th>
	<th>Action</th>

</tr>

<%for(SubCategoryBean sb :list){ %>
	<tr>
	<td><%=sb.getSubCategoryId() %></td>
	<td><%=sb.getSubCategoryName() %></td>
	<td><%=sb.getCategoryName() %></td>
	<td><%=sb.getCategoryId() %></td>
	<td><%=sb.getDeleted() %></td>
	<td><a href="deletesubcategory/<%=sb.getSubCategoryId() %>">Delete</a></td>
	</tr>
	<%} %>
</table>
</body>
</html>	