<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense |List AcountType</title>
</head>
<body>
<h3>List AcountType</h3>
<br>
<%
List<AcountTypeBean> list = (List<AcountTypeBean>)request.getAttribute("list");

%>

<table border="1">
	<tr>
		<th>AcountTypeId</th>
		<th>AcountTypePay</th>
	
	</tr>
	<%for(AcountTypeBean ab:list){ %>
	<tr>
		<td><%=ab.getAcountTypeId() %></td>
		<td><%=ab.getAcountTypePay() %></td>
	
	</tr>
	<%} %>
</table>
</body>
</html>