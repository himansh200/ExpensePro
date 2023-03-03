<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Vendor</title>
</head>
<body>
<h3>Vendor </h3>

<form action="savevendor" method="post">
<br><br>
Vendor Name : <input type="text" name="vendorName">
<br> <br>
<input type ="submit" value="Save Vendor">
<br><br>
</form>
<br>
<a href="listvendor">Vendor List</a>
</body>
</html>