<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
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


 --%>



<html>

<head>
<jsp:include page="Header.jsp"></jsp:include>

</head>



<body>

	<%
	List<StatusBean> list = (List<StatusBean>) request.getAttribute("list");
	%>

	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>









	<div class="content-wrapper" style="min-height: 1302.12px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>StatusTables</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item active">StatusTables</li>
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
														<th>StatusId</th>
														<th>StatusName</th>


													</tr>
												</thead>
												<tbody>
													<%
													for (StatusBean sb : list) {
													%>
													<td><%=sb.getStatusId()%></td> 
													<td><%=sb.getStatusName()%></td>

													</tr>

													<%
													}
													%>






												</tbody>

											</table>
										</div>
									</div>


									<div class="card-footer clearfix">
										<a href="status">
											<button type="button" class="btn btn-primary float-right">
												<i class="fas fa-plus"></i> Add Status
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