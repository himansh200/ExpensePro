<%@page import="com.unnati.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List Expense</title>
</head>
<body>

<%
List<ExpenseBean> expenseList = (List<ExpenseBean>)request.getAttribute("expenseList");
%>

<table border="1">
<tr>
		<th>ExpenseId</th>
		<th>Title</th>
		<th>CategoryId</th>
		<th>SubCategoryId</th>
		<th>VendorId</th>
		<th>AcountTypeId</th>
		<th>StatusId</th>
		<th>UserId</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Description</th>
		
	</tr>
<%for(ExpenseBean eb:expenseList) {%>

	<tr>
		<td><%=eb.getExpenseId() %></td>
		<td><%=eb.getTitle() %></td>
		<td><%=eb.getCategoryId() %></td>
		<td><%=eb.getSubCategoryId() %></td>
		<td><%=eb.getVendorId() %></td>
		<td><%=eb.getAcountTypeId() %></td>
		<td><%=eb.getStatusId() %></td>
		<td><%=eb.getUserId() %></td>
		<td><%=eb.getAmount() %></td>
		<td><%=eb.getDate() %></td>
		<td><%=eb.getDescription() %></td>	
	
	</tr>

	<%} %>


</table><br><br>
<a href="addexpense" >Add New Expense</a>


</body>
</html>