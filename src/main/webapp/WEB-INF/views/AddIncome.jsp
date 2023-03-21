<%@page import="java.util.Calendar"%>
<%@page import="com.unnati.bean.StatusBean"%>
<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.AcountTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense | Add Income</title>
</head>
<body>
<h2>Add Income</h2>
<%
List<AcountTypeBean> accountTypeList = (List<AcountTypeBean>)request.getAttribute("accountTypeList");
List<StatusBean> statusList =  (List<StatusBean>)request.getAttribute("statusList");
%>

Add your Income here


<form action="saveincome" method="post">
Title : <input type="text" name="title"> <br><br>

Account Type : <select name="acountTypeId"> 

<%for(AcountTypeBean ab:accountTypeList){%>

<option value="<%=ab.getAcountTypeId()%>"><%=ab.getAcountTypePay()%></option>

<%} %>



</select><br> <br>

Status :<select name="statusId">

<%  for(StatusBean sb : statusList){  %>
<option value="<%=sb.getStatusId() %>"><%=sb.getStatusName() %></option>

<%} %>

</select><br><br>



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
		
		Date :  <input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>
		Amount: <input type="text" name="amount" >				
	
		Description : <textarea rows="5" cols="15" name="description"></textarea><br><br>	
		
		<input type="submit" value="SaveIncome">
	</form>
</form>
<br><br>
<a href="listincome">List Income</a>
</body>
</html>