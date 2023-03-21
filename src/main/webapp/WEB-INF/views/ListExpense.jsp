<%@page import="com.unnati.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
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


 --%>


<html>

<head>
<jsp:include page="Header.jsp"></jsp:include>

</head>

<body>

	<%
	List<ExpenseBean> expenseList = (List<ExpenseBean>) request.getAttribute("expenseList");
	%>

	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>






	<div class="content-wrapper" style="min-height: 1302.12px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>ExpenseTables</h1>
						
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item active">ExpenseTables</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">

						<!-- /.card -->

						<div class="card">
							<div class="card-header">
								<h3 class="card-title">DataTable with default features</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-sm-12">

										<table id="example1"
											class="table table-bordered table-striped dataTable dtr-inline">
											<thead>

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
											</thead>

											<tbody>

												<%
												for (ExpenseBean eb : expenseList) {
												%>

												<tr>
													<td><%=eb.getExpenseId()%></td>
													<td><%=eb.getTitle()%></td>
													<td><%=eb.getCategoryId()%></td>
													<td><%=eb.getSubCategoryId()%></td>
													<td><%=eb.getVendorId()%></td>
													<td><%=eb.getAcountTypeId()%></td>
													<td><%=eb.getStatusId()%></td>
													<td><%=eb.getUserId()%></td>
													<td><%=eb.getAmount()%></td>
													<td><%=eb.getDate()%></td>
													<td><%=eb.getDescription()%></td>

												</tr>

												<%
												}
												%>


											</tbody>

										</table>
									</div>
								</div>


								<div class="card-footer clearfix">
									<a href="addexpense">
										<button type="button" class="btn btn-primary float-right">
											<i class="fas fa-plus"></i> Add Expense
										</button>
									</a>
								</div>



							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
	</div>


	<jsp:include page="AllJs.jsp"></jsp:include>

	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>





</body>

</html>




