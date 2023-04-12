<%@page import="com.unnati.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | New SubCategory</title>

<jsp:include page="Header.jsp"></jsp:include>

</head>
<body>
	<h2>NewSubCategory</h2>


	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	%>


	<%-- 
<form action ="savesubcategory" method ="post">
	Sub Category Name :<input type="text" name = "subCategoryName">
	
	Category <select name="categoryId">
	<%for(CategoryBean cb:list){ %>
	<option value ="<%=cb.getCategoryId()%>">
	<%=cb.getCategoryName() %>
	</option>
	<%} %>
	
	
	</select>
	<br><br>

	<input type="submit" value ="save subcategory"> 


</form>
<a href="listsubcategories">List Sub Category</a>
 --%>







	<jsp:include page="LeftSideBar.jsp"></jsp:include>
	<jsp:include page="NaiveBar.jsp"></jsp:include>



	<div class="content-wrapper" style="min-height: 1345.31px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Add SubCategory</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
							<li class="breadcrumb-item"><a href="listsubcategories">SubCategory</a></li>
							<li class="breadcrumb-item active">Add SubNewCategory</li>
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
					<!-- left column -->
					<div class="col-md-12">
						<!-- jquery validation -->
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">
									Add SubCategory Form <small>ExpenseManagement</small>
								</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form id="quickForm" novalidate="novalidate"
								action="savesubcategory" method="post">
								<div class="card-body">
									<div class="form-group">
										<label for="exampleInputEmail1">SubCategory Name</label> 
										<input type="text" name="subCategoryName" class="form-control"
											id="exampleInputEmail1" placeholder="Enter SubCategory Name">
									</div>



									<!--    <div class="card-body"> -->
									<label for="exampleInputEmail1">Category</label> 
									
								<select	name="categoryId"	id="inputStatus" class="form-control custom-select">
										<option selected="" disabled="">Select Category</option>
										<%
										for (CategoryBean cb : list) {
										%>
										<option value="<%=cb.getCategoryId()%>">
											<%=cb.getCategoryName()%>
										</option>
										<%
										}
										%>

									</select><br><br>










									<div class="form-group mb-0">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" name="terms"
												class="custom-control-input" id="exampleCheck1"> <label
												class="custom-control-label" for="exampleCheck1">I
												agree to the <a href="#">terms of service</a>.
											</label>
										</div>
									</div>
								</div>








								<!-- /.card-body -->
								<div class="card-footer">
									<button type="submit" class="btn btn-primary"
										value="Save subCategory">Save SubCategory</button>

									<a href="listsubcategories"><button type="button"
											class="btn btn-primary">View List</button></a>
								</div>
							</form>
						</div>
						<!-- /.card -->
					</div>
					<!--/.col (left) -->
					<!-- right column -->
					<div class="col-md-6"></div>
					<!--/.col (right) -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>



<jsp:include page="AllJs.jsp"></jsp:include>


</body>
</html>

