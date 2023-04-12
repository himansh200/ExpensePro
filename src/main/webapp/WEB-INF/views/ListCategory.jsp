<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- 
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | List Category</title>
</head>
<body>
<h3>List Category</h3>

<%
List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list"); 
%>
<table border="1">

	<tr>
		<th>CategoryId</th>
		<th>CategoryName</th>
		<th>Deleted?</th>
		<th>Action</th>
	</tr>
<%for(CategoryBean cb : list){ %>
	<tr>
		<td><%=cb.getCategoryId() %></td>
		<td><%=cb.getCategoryName() %></td>
		<td><%=cb.getDeleted() %></td>
		<td><a href="deletecategory/<%=cb.getCategoryId() %>">Delete</a> |
		<a href="viewcategory/<%=cb.getCategoryId() %>">View</a>
		</td>
	</tr>
	<%} %>

</table>

</body>
</html> 
 --%>


<html>
<head>
<title>Expense | List Category</title>
<jsp:include page="Header.jsp"></jsp:include>


</head>



<body>


</body>
<%
List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
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
											
											<th>CategoryName</th>
											<th>Deleted?</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<%
										for (CategoryBean cb : list) {
										%>
										<tr>
											<%-- <td><%=cb.getCategoryId() %></td> --%>
											<td><%=cb.getCategoryName()%></td>
											<td><%=cb.getDeleted()%></td>
											<td>
											
											
											
											<a href="deletecategory/<%=cb.getCategoryId()%>">Delete</a>
												| <a href="viewcategory/<%=cb.getCategoryId()%>">View</a></td>
										</tr>
										<%
										}
										%>

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
