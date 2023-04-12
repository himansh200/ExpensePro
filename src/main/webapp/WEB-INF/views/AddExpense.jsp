<%@page import="java.util.Calendar"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="com.unnati.bean.VendorBean"%>
<%@page import="com.unnati.bean.SubCategoryBean"%>
<%@page import="com.unnati.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense |Add Expense</title>
</head>
<body>
<%
List<CategoryBean> categoryList = (List<CategoryBean>)request.getAttribute("categoryList");
List<SubCategoryBean> subCategoryList = (List<SubCategoryBean>)request.getAttribute("subCategoryList");
List<VendorBean> vendorList = (List<VendorBean>)request.getAttribute("vendorList");
List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("statusList");
List<AcountTypeBean> acountTypeList = (List<AcountTypeBean>)request.getAttribute("acountTypeList");

%>
<form action ="saveexpense" method="post">

Title :<input type ="text" name = "title"> <br><br>

Category : <select name="categoryId">
				<% 
				for(CategoryBean cb:categoryList){ %>
					<option value="<%=cb.getCategoryId()%>"><%=cb.getCategoryName() %></option>
					<%} %>	
				</select><br><br>
				
SubCategory : <select name="subCategoryId">
			<% 
				for(SubCategoryBean sb:subCategoryList){ %>
					<option value="<%=sb.getSubCategoryId()%>"><%=sb.getSubCategoryName() %></option>
					<%} %>	
				</select><br><br>			
				
Vendor  : <select name="vendorId">
			<% 
				for(VendorBean vb:vendorList){ %>
					<option value="<%=vb.getVendorId()%>"><%=vb.getVendorName() %></option>
					<%} %>	
				</select><br><br>

Acount Type :<select name="acountTypeId">
			<%
				for(AcountTypeBean ab:acountTypeList){ %>
				<option value="<%=ab.getAcountTypeId() %>"><%=ab.getAcountTypePay() %></option>
				
			<% }%>

			</select><br><br>
			
Status  : <select name="statusId">
			<% 
				for(StatusBean stb:statusList){ %>
					<option value="<%=stb.getStatusId()%>"><%=stb.getStatusName() %></option>
					<%} %>	
				</select><br><br>				 

Amount : <input type ="text" name = "amount"><br><br>

		
				<%
						Calendar c = Calendar.getInstance(); 
						int d = c.get(c.DAY_OF_MONTH); //07 
						int m = c.get(c.MONTH)+1;//03
						String mon = "";
						String dt = "";
						if(m<=9){
							mon = 0+""+m; 
						}else{
							mon = m+"";
						}
						if(d <= 9){
							dt = 0+""+d;
						}else{
							dt = d+"";
						}
						int y = c.get(c.YEAR);//2023 
						System.out.println(y+"-"+m+"-"+d);
					%>

Date : <input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>

Description : <textarea rows="5" cols="15" name="description"></textarea><br><br>	
		
		<input type="submit" value="SaveExpense">




</form>
<br><br>
<a href="listexpense">List Expense</a>
</body>
</html> 

--%>



<html>

<head>

<jsp:include page="Header.jsp"></jsp:include>

<style  type="text/css">
 .error{
 color: red;
 }

</style>


</head>



<body>


<%
List<CategoryBean> categoryList = (List<CategoryBean>)request.getAttribute("categoryList");
List<SubCategoryBean> subCategoryList = (List<SubCategoryBean>)request.getAttribute("subCategoryList");
List<VendorBean> vendorList = (List<VendorBean>)request.getAttribute("vendorList");
List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("statusList");
List<AcountTypeBean> acountTypeList = (List<AcountTypeBean>)request.getAttribute("acountTypeList");

%>

<jsp:include page="NaiveBar.jsp"></jsp:include>
<jsp:include page="UserSideBar.jsp"></jsp:include>




<!-- style="min-height: 1604.44px;" -->

<form action ="saveexpense" method="post">
<div class="content-wrapper" style="min-height: 1604.44px;"  >
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Expense</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
              <li class="breadcrumb-item"><a href="listexpense">ListExpense</a></li>
              <li class="breadcrumb-item active">Add Expense</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6" style="margin-left: 100px">
          <div class="card card-primary" >
            <div class="card-header">
              <h3 class="card-title">Expense Form</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">Title</label>
                <input type="text" name="title" id="title" class="form-control">
              </div>
              
              
              
              <div class="card-body">
              <div class="form-group">
                <label for="inputName">Category: </label>
                <select name="categoryId" id="categoryId">
				<% 
				for(CategoryBean cb:categoryList){ %>
					<option value="<%=cb.getCategoryId()%>"><%=cb.getCategoryName() %></option>
					<%} %>
					</select><br><br>	
              </div>
              
              
              
              <!-- <div class="card-body"> -->
              <div class="form-group">
                <label for="inputName">SubCategory: </label>
                <select name="subCategoryId" id="SubCategoryId">
				<% 
				for(SubCategoryBean sb:subCategoryList){ %>
					<option value="<%=sb.getSubCategoryId()%>"><%=sb.getSubCategoryName() %></option>
					<%} %>	
				</select><br><br>	
              </div>
              
            
              
              
			 <div class="form-group">
                <label for="inputName">Vendor: </label>
               <select name="vendorId" id="vendorId">
			<% 
				for(VendorBean vb:vendorList){ %>
					<option value="<%=vb.getVendorId()%>"><%=vb.getVendorName() %></option>
					<%} %>	
				</select><br><br>	
              </div>
              
              
               <div class="form-group">
                <label for="inputName">AcountType: </label>
                <select name="acountTypeId" id="acountTypeId">
			<%
				for(AcountTypeBean ab:acountTypeList){ %>
				<option value="<%=ab.getAcountTypeId() %>"><%=ab.getAcountTypePay() %></option>
				
			<% }%>

			</select><br><br>	
              </div>
              
              
               <div class="form-group">
                <label for="inputName">Status: </label>
                <select name="statusId" id="statusId" >
			<% 
				for(StatusBean stb:statusList){ %>
					<option value="<%=stb.getStatusId()%>"><%=stb.getStatusName() %></option>
					<%} %>	
				</select><br><br>				 

              </div>
              
              
              
              <div class="form-group">
                <label for="inputName">Amount</label>
                 <input type ="text" name = "amount" id="amount"><br><br>
              </div>
              
        
        
        
             
        
				<%
						Calendar c = Calendar.getInstance(); 
						int d = c.get(c.DAY_OF_MONTH); //07 
						int m = c.get(c.MONTH)+1;//03
						String mon = "";
						String dt = "";
						if(m<=9){
							mon = 0+""+m; 
						}else{
							mon = m+"";
						}
						if(d <= 9){
							dt = 0+""+d;
						}else{
							dt = d+"";
						}
						int y = c.get(c.YEAR);//2023 
						System.out.println(y+"-"+m+"-"+d);
					%>

<lable for="inputName"><b>Date :</b></lable> 

<input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>      
              
              
              <div class="form-group">
                <label for="inputDescription">Description</label>
                <textarea id="inputDescription" name ="description"class="form-control" rows="5"cols ="15"></textarea>
              </div> <br><br><Br>
              
              
               <div class="row">
        <div class="col-12">
         
          <input type="submit" value="Save Expense" class="btn btn-success float-right">
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
              
             
              
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        
      </div>
     


</form>

<jsp:include page="AllJs.jsp"></jsp:include>



</body>


</html>








