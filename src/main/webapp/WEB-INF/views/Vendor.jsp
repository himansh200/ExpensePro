<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Vendor</title>
</head>
<body>
<h3>Vendor </h3>

<form action="savevendor" method="post">
<br><br>
Vendor Name : <input type="text" name="vendorName">
<br> <br>
<input type ="submit" value="Save Vendor">
<br><br>
</form>
<br>
<a href="listvendor">Vendor List</a>
</body>
</html>

 -->
 
 
 
 
 <html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
</head>

<body>



  
  
  
  <div class="content-wrapper" style="min-height: 1345.31px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Category</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
              <li class="breadcrumb-item"><a href="listvendor">Vendor Table</a></li>
              <li class="breadcrumb-item active">Add NewCategory</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
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
                <h3 class="card-title">Add Vendor Form <small>ExpenseManagement</small></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" novalidate="novalidate" action ="savevendor"  method ="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Vendor Name</label>
                    <input type="text" name="vendorName" class="form-control" id="exampleInputEmail1" placeholder="Enter Vendor Name">
                  </div>
                  
                  <div class="form-group mb-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="terms" class="custom-control-input" id="exampleCheck1">
                      <label class="custom-control-label" for="exampleCheck1">I agree to the <a href="#">terms of service</a>.</label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" value ="Save Vendor">Save Vendor</button>
                  
                   <a href="listvendor"><button type="button" class="btn btn-primary" >View List</button></a>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  
 