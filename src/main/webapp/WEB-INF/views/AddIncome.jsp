<%@page import="java.util.Calendar"%>
<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Add Income</title>
</head>
<body>
<h2>Add Income</h2>
<%
List<AcountTypeBean> accountTypeList = (List<AcountTypeBean>)request.getAttribute("accountTypeList");
List<StatusBean> statusList =  (List<StatusBean>)request.getAttribute("statusList");
%>

Add your Income here


<form action="saveincome" method="post">
Title : <input type="text" name="title"> <br><br>

Account Type : <select name="acountTypeId"> 

<%for(AcountTypeBean ab:accountTypeList){%>

<option value="<%=ab.getAcountTypeId()%>"><%=ab.getAcountTypePay()%></option>

<%} %>



</select><br> <br>

Status :<select name="statusId">

<%  for(StatusBean sb : statusList){  %>
<option value="<%=sb.getStatusId() %>"><%=sb.getStatusName() %></option>

<%} %>

</select><br><br>



<%
						Calendar c = Calendar.getInstance(); 
						int d = c.get(c.DAY_OF_MONTH); //07 
						int m = c.get(c.MONTH)+1;//03
						String mon = "";
						String dt = "";
						if(m<=9){
							mon = 0+""+m; 
						}else{
							mon = m+"";
						}
						if(d <= 9){
							dt = 0+""+d;
						}else{
							dt = d+"";
						}
						int y = c.get(c.YEAR);//2023 
						System.out.println(y+"-"+m+"-"+d);
					%>
		
		Date :  <input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>
		Amount: <input type="text" name="amount" >				
	
		Description : <textarea rows="5" cols="15" name="description"></textarea><br><br>	
		
		<input type="submit" value="SaveIncome">
	</form>
</form>
<br><br>
<a href="listincome">List Income</a>
</body>
</html> --%>




<html>
<head>

<jsp:include page="Header.jsp"></jsp:include>
</head>

<body>

	<%
	List<AcountTypeBean> accountTypeList = (List<AcountTypeBean>) request.getAttribute("accountTypeList");
	List<StatusBean> statusList = (List<StatusBean>) request.getAttribute("statusList");
	%>


	<jsp:include page="UserSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>







<form action="saveincome" method="post">
	<div class="content-wrapper" style="min-height: 1604.44px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Add Income</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item"><a href="listincome">ListIncome</a></li>
							<li class="breadcrumb-item active">Add Income</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-6" style="margin-left: 100px">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Add Income Here</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" title="Collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>

						<div class="card-body">
							<div class="form-group">
								<label for="inputName">Title</label> 
								<input type="text" name="title" id="title" class="form-control"><br>
							</div>






							<div class="form-group">
								<label for="inputName">AcountType</label> <select name="acountTypeId">

									<%
									for (AcountTypeBean ab : accountTypeList) {
									%>

									<option value="<%=ab.getAcountTypeId()%>"><%=ab.getAcountTypePay()%></option>

									<%
									}
									%>



								</select><br> <br>
							</div>










							<div class="form-group">
								<label for="inputName">Status: </label> 
								<select name="statusId" name="statusId">
									<%
									for (StatusBean stb : statusList) {
									%>
									<option value="<%=stb.getStatusId()%>"><%=stb.getStatusName()%></option>
									<%
									}
									%>
								</select><br> <br>

							</div>



							<div class="form-group">
								<label for="inputName">Amount</label> 
								<input type="text" name="amount"><br> <br>
							</div>






							<%
							Calendar c = Calendar.getInstance();
							int d = c.get(c.DAY_OF_MONTH); //07 
							int m = c.get(c.MONTH) + 1;//03
							String mon = "";
							String dt = "";
							if (m <= 9) {
								mon = 0 + "" + m;
							} else {
								mon = m + "";
							}
							if (d <= 9) {
								dt = 0 + "" + d;
							} else {
								dt = d + "";
							}
							int y = c.get(c.YEAR);//2023 
							System.out.println(y + "-" + m + "-" + d);
							%>

							<lable for="inputName"> <b>Date :</b></lable>

							<input type="date" id="myDate" name="date"
								value="<%=y + "-" + mon + "-" + dt%>"><br> <br>


							<div class="form-group">
								<label for="inputDescription">Description</label>
								<textarea id="inputDescription" name="description"
									class="form-control" rows="5" cols="15"></textarea>
							</div>
							<br> <br> <Br>


							<div class="row">
								<div class="col-12">

									<input type="submit" value="Save Income" class="btn btn-success float-right">
								</div>
							</div>
		</section>
		<!-- /.content -->
	</div>



	</div>
	<!-- /.card-body -->
	</div>
	<!-- /.card -->
	</div>

	</div>



</form>



<jsp:include page="AllJs.jsp"></jsp:include>

</body>




</html>