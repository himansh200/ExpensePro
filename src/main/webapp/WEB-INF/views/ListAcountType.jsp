<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- 

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
</html> --%>



<html>

<head>

<jsp:include page="Header.jsp"></jsp:include>
</head>

<body>


	<%
	List<AcountTypeBean> list = (List<AcountTypeBean>) request.getAttribute("list");
	%>

	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>




	<div class="content-wrapper" style="min-height: 1302.12px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>AcountTypeTables</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item active">AcountTypeTables</li>
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
													<th>AcountTypeId</th>
													<th>AcountTypePay</th>

												</tr>
											</thead>

											<tbody>

												<%
												for (AcountTypeBean ab : list) {
												%>
												<tr>
													<td><%=ab.getAcountTypeId()%></td>
													<td><%=ab.getAcountTypePay()%></td>

												</tr>
												<%
												}
												%>


											</tbody>

										</table>
									</div>
								</div>


								<div class="card-footer clearfix">
									<a href="acounttype">
										<button type="button" class="btn btn-primary float-right">
											<i class="fas fa-plus"></i> Add AccountType
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