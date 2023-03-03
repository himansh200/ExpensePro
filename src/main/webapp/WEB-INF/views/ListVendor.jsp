<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.VendorBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List Vendor</title>
</head>
<body>
<h3>Vendor List</h3>
<% 
List<VendorBean> list =(List<VendorBean>)request.getAttribute("list");
%>
<table border="1">
<tr>
		<th>VendorId</th>
		<th>VendorName</th>
		<th>Deleted</th>
		<th>Action</th>

</tr>
<%for(VendorBean vb:list){ %>
<tr>
	<td><%=vb.getVendorId() %></td>	
	<td><%=vb.getVendorName() %></td>
	<td><%=vb.isDeleted() %></td>
	<td><a href="deletevendor/<%=vb.getVendorId() %>">Delete</a></td>

</tr>

<%} %>
</table>
</body>
</html>