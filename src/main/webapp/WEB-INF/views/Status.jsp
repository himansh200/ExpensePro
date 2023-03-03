<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expene | Status</title>
</head>
<body>

<h1>Status</h1>

<form action ="savestatus" method ="post">

Status Name : <input type="text" name="statusName">
<br> <br>

<input type="submit"  value="Save Status"> 
</form>
<br><br>
<a href="liststatus">List Status</a>
</body>
</html>