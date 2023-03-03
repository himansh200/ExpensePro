<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List Status</title>
</head>
<body>
<h1>List Status</h1>
<%
	List<StatusBean> list = (List<StatusBean>)request.getAttribute("list");
%>

<table border ="1">
	<tr>
	<th>StatusId</th>
	<th>StatusName</th>

	
	</tr>

<tr>
<%for(StatusBean sb:list){ %>
	<td><%=sb.getStatusId() %></td>
	<td><%=sb.getStatusName()%></td>
	
</tr>

<%} %>







</table>

</body>
</html>