<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | UserProfile</title>
<jsp:include page="Header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="UserSideBar.jsp"></jsp:include>
<jsp:include page="NaiveBar.jsp"></jsp:include>















<div class="content-wrapper" style="min-height: 1604.44px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="home">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <form action= "saveuserprofilepic" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="userId" value="${user.userId}">
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle" src="${user.imageUrl}" alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">${user.firstName}&nbsp ${user.lastName}</h3>

                <p class="text-muted text-center">${user.role==1?"Admin":"User"}</p>
					
					
					
					<div class="form-group row">
                        <label for="profileImg" class="col-sm col-form-label">Upload Image</label>
                        <div class="col-sm-10">
                          <input type="file" name="profileImg" class="" id="inputName" placeholder="Name">
                        </div>
                      </div>
   			






				
                
              
               <button type="submit" class="btn btn-primary btn-block">Upload</button>
              
              </div>
				</form> 
 
 
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  
                  
                  <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Shared publicly - 7:30 PM today</span>
                      </div>
                      <!-- /.user-block -->
                      

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                 
                    <!-- /.post -->

                    <!-- Post -->
                    
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
               
                  <!-- /.tab-pane -->

                  <div class="tab-pane active" id="settings">
                    <form  action="saveuserprofil"  method="post">
                     <input type="hidden" name="userId" value="${user.userId}">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">FirstName</label>
                        <div class="col-sm-10">
                          <input type="text" name ="firstName" class="form-control" id="inputName" placeholder="${user.firstName}">
                        </div>
                      </div>
                     
                     <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">LastName</label>
                        <div class="col-sm-10">
                          <input type="text" name="lastName" class="form-control" id="inputName2" placeholder="${user.lastName}">
                        </div>
                      </div>
                     
                     
                     
                     
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" name="email" class="form-control" id="inputEmail" placeholder="${user.email }">
                        </div>
                      </div>
                      
                      
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Contact No.</label>
                        <div class="col-sm-10">
                          <input type="text" name = "mobileno" class="form-control" id="inputSkills" placeholder="${user.mobileno}">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-danger">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

<jsp:include page="AllJs.jsp"></jsp:include>




</body>
</html>