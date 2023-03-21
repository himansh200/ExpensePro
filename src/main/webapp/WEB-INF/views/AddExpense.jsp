<%@page import="java.util.Calendar"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="com.unnati.bean.VendorBean"%>
<%@page import="com.unnati.bean.SubCategoryBean"%>
<%@page import="com.unnati.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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