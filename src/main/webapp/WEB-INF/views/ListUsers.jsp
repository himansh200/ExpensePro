<%@page import="com.unnati.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Users Table</title>
<jsp:include page="Header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<%
	List<UserBean> list = (List<UserBean>) request.getAttribute("list");
	%>

	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>




	<div class="content-wrapper" style="min-height: 1302.12px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Categories</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item active">CategoryTables</li>
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








							<div class="row">
								<div class="col-sm-12">
									<table id="example1"
										class="table table-bordered table-striped dataTable dtr-inline"
										aria-describedby="example1_info">
										<thead>
											<tr>
												
												<td>FirstName</td>
												<td>LastName</td>
												<td>Email</td>
												<td>Password</td>
												
												<td>Otp</td>
												<td>Dob</td>
												<td>Contact</td>
												<td>Gender</td>
												<td>CreatedAt</td>

											</tr>
										</thead>
										<tbody>

											<%for(UserBean ub :list) { %>

											<tr>

												
												<td><%=ub.getFirstName() %></td>
												<td><%=ub.getLastName() %></td>
												<td><%=ub.getEmail() %></td>
												<td><%=ub.getPassword() %></td>
												
												<td><%=ub.getOtp() %></td>
												<td><%=ub.getDob() %></td>
												<td><%=ub.getMobileno() %></td>
												<td><%=ub.getGender() %></td>
												<td><%=ub.getCreatedAt()%></td>



											</tr>
											<%} %>

										</tbody>







										<!-- <tfoot>
												<tr>
													<th rowspan="1" colspan="1">Rendering engine</th>
													<th rowspan="1" colspan="1">Browser</th>
													<th rowspan="1" colspan="1">Platform(s)</th>
													<th rowspan="1" colspan="1">Engine version</th>
													<th rowspan="1" colspan="1">CSS grade</th>
												</tr>
											</tfoot> -->
									</table>
								</div>
							</div>



							<div class="card-footer clearfix">
								<a href="newcategory">
									<button type="button" class="btn btn-primary float-right">
										<i class="fas fa-plus"></i> Add Category
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