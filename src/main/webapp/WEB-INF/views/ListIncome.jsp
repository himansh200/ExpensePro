<%@page import="com.unnati.bean.IncomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List Income</title>
</head>
<body>

<%
List<IncomeBean> incomeList = (List<IncomeBean>)request.getAttribute("incomeList");
%>

<table border="1">
<tr>
	<th>IncomeId</th>
	<th>Title</th>
	<th>AcountTypeId</th>
	<th>StatusId</th>
	<th>UserID</th>
	<th>Amount</th>
	<th>Date</th>
	<th>Description</th>
	
	</tr>
	
	<% for(IncomeBean ib:incomeList){ %>
	<tr>
		<td><%=ib.getIncomeId() %></td>
		<td><%=ib.getTitle() %></td>
		<td><%=ib.getAcountTypeId()%></td>
		<td><%=ib.getStatusId() %></td>
		<td><%=ib.getUserId() %></td>
		<td><%=ib.getAmount() %></td>
		<td><%=ib.getDate() %></td>
		<td><%=ib.getDescription() %></td>
	</tr>
	
	<%} %>
</table>
</body>
</html>

 --%>





<html>

<head>
<jsp:include page="Header.jsp"></jsp:include>

</head>



<body>

	<%
	List<IncomeBean> incomeList = (List<IncomeBean>) request.getAttribute("incomeList");
	%>



	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>









	<div class="content-wrapper" style="min-height: 1302.12px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>IncomeTables</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item active">IncomeTables</li>
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

							<div class="row">
								<div class="col-sm-12">
									<table id="example1"
										class="table table-bordered table-striped dataTable dtr-inline"
										aria-describedby="example1_info">
										<thead>
											<tr>
												<!-- <th>IncomeId</th> -->
												<th>Title</th>
												<th>AcountTypeId</th>
												<th>StatusId</th>
												<th>UserID</th>
												<th>Amount</th>
												<th>Date</th>
												<th>Description</th>

											</tr>
										</thead>
										<tbody>

											<%
											for (IncomeBean ib : incomeList) {
											%>
											<tr>

												<td><%=ib.getTitle()%></td>
												<td><%=ib.getAcountTypeId()%></td>
												<td><%=ib.getStatusId()%></td>
												<td><%=ib.getUserId()%></td>
												<td><%=ib.getAmount()%></td>
												<td><%=ib.getDate()%></td>
												<td><%=ib.getDescription()%></td>
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
										<i class="fas fa-plus"></i> Add Income
									</button>
								</a>
							</div>



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