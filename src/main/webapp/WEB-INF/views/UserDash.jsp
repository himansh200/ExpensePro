<%@page import="com.unnati.bean.ExpenseChartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.unnati.bean.CategoryChartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<div class="content-wrapper" style="min-height: 297px;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>${TodaysExpense==null?0:TodaysExpense}</h3>

                <p>Todays Expense</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>${MonthlyTransaction==null?0:MonthlyTransaction}<sup style="font-size: 20px"></sup></h3>

                <p>Monthly Transaction</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>${MonthlyExpense==null?0:MonthlyExpense}</h3>

                <p>Monthly Expense</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
      
      <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>${YearlyExpense ==null?0:YearlyExpense}</h3>

                <p>Annual Expense</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
      
      
      
      
      
      
  


<div class="row">
				<!-- Left col -->
				
				<section class="col-lg-12 connectedSortable ui-sortable">
					<!-- Custom tabs (Charts with tabs)-->
					<div class="card">
						<div class="card-header ui-sortable-handle" style="cursor: move;">
							<h3 class="card-title">
								<i class="fas fa-chart-pie mr-1"></i>Monthly Expense
							</h3>
							<div class="card-tools">
								<ul class="nav nav-pills ml-auto">
									<li class="nav-item"><a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a></li>
									<li class="nav-item"><a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a></li>
								</ul>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="tab-content p-0">
								<!-- Morris chart - Sales -->


					
<%
									List<ExpenseChartBean> expenseChartData = (List<ExpenseChartBean>) request.getAttribute("expenseChartDataUser");
									/* List<CategoryChartBean> categoryChartData = (List<CategoryChartBean>) request.getAttribute("categoryChartDataUser"); */	
								/* List<IncomeChartBean> incomeChartData = (List<IncomeChartBean>) request.getAttribute("incomeChartDataUser"); */ 
								%>



								


								<!-- Line Chart -->

								<div>
									<canvas id="expensechartUsers" width="1028" height="514" style="display: block; box-sizing: border-box; height: 514px; width: 1028px;"></canvas>
								</div>




								<script>
									const ctx = document
											.getElementById('expensechartUsers');

									new Chart(
											ctx,
											{
												type : 'bar',
												data : {
													labels : [ 
														<%for (ExpenseChartBean e : expenseChartData) {%>
														 '<%=e.getMonth()%>',
															<%}%>
															
															  ],
															  
													datasets : [ {
														label : '# of Expense',
														data : [
															   
															 <%for (ExpenseChartBean e : expenseChartData) {%>
																<%=e.getExpenseAmount()%>,
														<%}%> 
																
																],
																
																
																
														borderWidth : 1
													} ]
												},
												options : {
													scales : {
														y : {
															beginAtZero : true
														}
													}
												}
											});
								</script>















								<!-- /.card -->

								<!-- DIRECT CHAT -->

								<!--/.direct-chat -->

								<!-- TO DO List -->

								<!-- /.card -->
				</div></div></div></section>






			




				<!-- ./col -->
			</div>







								<!-- /.card -->

								<!-- DIRECT CHAT -->

								<!--/.direct-chat -->

								<!-- TO DO List -->

								<!-- /.card -->
				</section>



      
      
      
      
  


<section class="col-lg-7 connectedSortable ui-sortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header ui-sortable-handle" style="cursor: move;">
                <h3 class="card-title">
                  <i class="fas fa-chart-pie mr-1"></i>
                 Expense Category
                </h3>
                <div class="card-tools">
                  <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                      <a class="nav-link" href="#revenue-chart" data-toggle="tab">Area</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#sales-chart" data-toggle="tab">Donut</a>
                    </li>
                  </ul>
                </div>
              </div>
              
              
              
              
              <!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                 <!--  
                  
                  <div class="chart tab-pane" id="revenue-chart" style="position: relative; height: 300px;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      <canvas id="revenue-chart-canvas" height="300" style="height: 300px; display: block; width: 577px;" width="577" class="chartjs-render-monitor"></canvas>
                   </div>
                  <div class="chart tab-pane active" id="sales-chart" style="position: relative; height: 300px;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="sales-chart-canvas" height="300" style="height: 300px; display: block; width: 577px;" class="chartjs-render-monitor" width="577"></canvas>
                  </div>
                </div> 
                
                 </div>
                  </div>
                
                -->
                
             
              
              <!-- /.card-body -->
            
            
            <%
            List<CategoryChartBean> categoryChartData = (List<CategoryChartBean>) request.getAttribute("categoryChartDataUser");	
            %>
            
            
					            <div>
									<canvas id="categorychartUser"></canvas>
								</div>
            










	<script>
					 BGcolorArray= [
						    'rgba(75, 192, 192, 0.4)',
					        'rgba(153, 102, 255, 0.4)',
					        'rgba(255, 159, 64, 0.4)',
						    'rgba(255, 99, 132, 0.4)',
					        'rgba(54, 162, 235, 0.4)',
					        'rgba(255, 206, 86, 0.4)'
					            
					      ]
					 
					  bordderArray = [
						  'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)',
						    'rgba(255, 99, 132, 1)',
					        'rgba(54, 162, 235, 1)',
					        'rgba(255, 206, 86, 1)'
					        ]
					 
						bgColor = [];
						borderColor = [];
						
						<% for(int i = 0; i<categoryChartData.size(); i++){%>
							bgColor.push(BGcolorArray[<%=i%>]);
						<%}%>
						
						<% for(int i=0; i<categoryChartData.size(); i++){ %>
							borderColor.push(bordderArray[<%=i%>]);
						<%}%>
						
					
						const ctx2 = document.getElementById('categorychartUser'); 
						
						new Chart(
								ctx2,
								{
									type : 'doughnut',
									data : {
										labels : [ 
											 <%for (CategoryChartBean e : categoryChartData) {%>
											 '<%=e.getCategoryName()%>',
												<%}%> ],
										datasets : [ {
											label : '# of Category Count',
											data : [
												 <%for (CategoryChartBean e : categoryChartData) {%>
														<%=e.getCategoryCount()%>,
												<%}%> 
												],
												 backgroundColor: bgColor,
											       borderColor: borderColor,
											       borderWidth: 1
										} ]
									},
									options : {
										scales : {
											y : {
												beginAtZero : true
											}
										}
									}
								});
						
					</script>
								
						







            
            <!-- /.card -->

            <!-- DIRECT CHAT -->
            
            <!--/.direct-chat -->

            <!-- TO DO List -->
            
            <!-- /.card -->
          </section>

 
      
      
      
      
      
  














           
          
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
  
  
  
  
  
  
  
  
  
  
  
    </section>
    <!-- /.content -->
  </div>

  
  
  