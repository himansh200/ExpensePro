<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Acount Type</title>
</head>
<body>
<h3>Acount Type</h3>
<br>
<form action="saveacounttype" method="post">
Acount Type Pay:<input type="text" name="acountTypePay">
<br><br>
<input type ="submit" value="save acountTypePay">

</form>
<br>
<a href="listacounttype">list of acountTypePay</a>
</body>
</html> -->


<html>

<head>
<jsp:include page="Header.jsp"></jsp:include>
</head>

<body>
<jsp:include page="LeftSideBar.jsp"></jsp:include>
<jsp:include page="NaiveBar.jsp"></jsp:include>





 <div class="content-wrapper" style="min-height: 1345.31px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add AcountType</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
              <li class="breadcrumb-item"><a href="listacounttype">List AcountType</a></li>
              <li class="breadcrumb-item active">Add NewAcountType</li>
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
                <h3 class="card-title">Add AcountType Form <small>ExpenseManagement</small></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm" novalidate="novalidate" action ="saveacounttype"  method ="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">AcountType Pay</label>
                    <input type="text" name="acountTypePay" class="form-control" id="exampleInputEmail1" placeholder="Enter Acounttype Name">
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
                  <button type="submit" class="btn btn-primary" value ="Save acountType">Save AcountTypePay</button>
                  
                   <a href="listacounttype"><button type="button" class="btn btn-primary" >View List</button></a>
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






</body>


</html>