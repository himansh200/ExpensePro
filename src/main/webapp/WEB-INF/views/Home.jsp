<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<jsp:include page="UserHeader.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>





<!-- <h1>You have logged in succesfully</h1>
<a href="addincome">Add Income</a><br><br>
<a href="addexpense" >Add Expense</a>
 -->


<jsp:include page="NaiveBar.jsp"></jsp:include>
<jsp:include page="UserSideBar.jsp"></jsp:include>



<jsp:include page="UserDash.jsp"></jsp:include>








<footer class="main-footer">
    <strong>Copyright © 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.2.0
    </div>
  </footer>

<jsp:include page="UserJs.jsp"></jsp:include>

</body>
</html>