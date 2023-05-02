<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <img
		src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Expense Manager </span>
	</a>

	<!-- Sidebar -->
	
	<div
		class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
		<div class="os-resize-observer-host observed">
			<div class="os-resize-observer" style="left: 0px; right: auto;"></div>
		</div>
		
		
		
		<div class="os-size-auto-observer observed"
			style="height: calc(100% + 1px); float: left;">
			<div class="os-resize-observer"></div>
		</div>
		<div class="os-content-glue"
			style="margin: 0px -8px; width: 249px; height: 605px;"></div>
		<div class="os-padding">
			<div class="os-viewport os-viewport-native-scrollbars-invisible"
				style="overflow-y: scroll;">
				<div class="os-content"
					style="padding: 0px 8px; height: 100%; width: 100%;">
					<!-- Sidebar user panel (optional) -->
					<div class="user-panel mt-3 pb-3 mb-3 d-flex">
						<div class="image">
							<img src="${user.imageUrl}"
								class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info">
							<a href="myprofile" class="d-block">${
							cookie.firstName.value}</a>
						</div>
					</div>

					<!-- SidebarSearch Form -->
					<div class="form-inline">
						<div class="input-group" data-widget="sidebar-search">
							<input class="form-control form-control-sidebar" type="search"
								placeholder="Search" aria-label="Search">
							<div class="input-group-append">
								<button class="btn btn-sidebar">
									<i class="fas fa-search fa-fw"></i>
								</button>
							</div>
						</div>
						<div class="sidebar-search-results">
							<div class="list-group">
								<a href="#" class="list-group-item"><div
										class="search-title">
										<strong class="text-light"></strong>N<strong
											class="text-light"></strong>o<strong class="text-light"></strong>
										<strong class="text-light"></strong>e<strong
											class="text-light"></strong>l<strong class="text-light"></strong>e<strong
											class="text-light"></strong>m<strong class="text-light"></strong>e<strong
											class="text-light"></strong>n<strong class="text-light"></strong>t<strong
											class="text-light"></strong> <strong class="text-light"></strong>f<strong
											class="text-light"></strong>o<strong class="text-light"></strong>u<strong
											class="text-light"></strong>n<strong class="text-light"></strong>d<strong
											class="text-light"></strong>!<strong class="text-light"></strong>
									</div>
									<div class="search-path"></div></a>
							</div>
						</div>
					</div>

					<!-- Sidebar Menu -->
					<nav class="mt-2">
						<ul class="nav nav-pills nav-sidebar flex-column"
							data-widget="treeview" role="menu" data-accordion="false">
							<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
							<li class="nav-item menu-is-opening menu-open"><a href="#"
								class="nav-link active"> <i
									class="nav-icon fas fa-tachometer-alt"></i>
									<p>
										Dashboard <i class="right fas fa-angle-left"></i>
									</p>
							</a>
								<ul class="nav nav-treeview" style="display: block;">
									<li class="nav-item"><a href="./index.html"
										class="nav-link active"> <i class="far fa-circle nav-icon"></i>
											<p>Dashboard v1</p>
									</a></li>

									<li class="nav-item"></li>
								</ul></li>
							<li class="nav-item"><a href="listcategories"
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										Category
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>

							<li class="nav-item"><a href="listsubcategories"
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										SubCategory
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>


							<li class="nav-item"><a href="listvendor" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										Vendor
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>

							<li class="nav-item"><a href="liststatus" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										Status
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>

							<!-- <li class="nav-item"><a href="listincome" class="nav-link">
									<i class="nav-icon fas fa-th"></i>
									<p>
										Income
										<span class="right badge badge-danger">New</span>
									</p>
							</a></li> -->


							<!-- <li class="nav-item"><a href="listexpense"
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										Expense
										<span class="right badge badge-danger">New</span>
									</p>
							</a></li> -->

							<li class="nav-item"><a href="listacounttype"
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										AcountType
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>



							<li class="nav-item"><a href="listusers"
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										Users
										<!-- <span class="right badge badge-danger">New</span> -->
									</p>
							</a></li>


								</div>
			</div>
		</div>
	<!-- 	
		<div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
			<div class="os-scrollbar-track">
				<div class="os-scrollbar-handle"
					style="width: 100%; transform: translate(0px, 0px);"></div>
			</div>
		</div>
		 -->
	<!-- 	
		<div
			class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
			<div class="os-scrollbar-track">
				<div class="os-scrollbar-handle"
					style="height: 47.6041%; transform: translate(0px, 0px);"></div>
			</div>
		</div>
		 -->
		<!-- <div class="os-scrollbar-corner"></div> -->
	</div>
	<!-- /.sidebar -->
</aside>


