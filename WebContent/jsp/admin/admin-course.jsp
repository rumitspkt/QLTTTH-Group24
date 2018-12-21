<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="au theme template" />
<meta name="author" content="Hau Nguyen" />
<meta name="keywords" content="au theme template" />

<!-- Title Page -->
<title>Course</title>

<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE -->
		<%@ include file="/jsp/fragments/admin-header-mobile.jsp"%>
		<!-- END HEADER MOBILE -->

		<!-- MENU SIDEBAR -->
		<%@ include file="/jsp/fragments/admin-sidebar.jsp"%>
		<!-- END MENU SIDEBAR -->

		<!-- PAGE CONTAINER -->
		<div class="page-container">
			<!-- HEADER DESKTOP -->
			<%@ include file="/jsp/fragments/admin-header-desktop.jsp"%>
			<!-- HEADER DESKTOP -->

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-b-35">
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">Courses</h2>

									<!--
                      <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add
                      </button>
                    -->
								</div>
							</div>
						</div>
						<div class="row m-b-80">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<!-- <h3 class="title-5 m-b-35">data table</h3> -->
								<div class="table-data__tool">
									<div class="table-data__tool-left">
										<div class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div class="rs-select2--light rs-select2--sm">
											<select class="js-select2" name="time">
												<option selected="selected">Today</option>
												<option value="">3 Days</option>
												<option value="">1 Week</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<button class="au-btn-filter">
											<i class="zmdi zmdi-filter-list"></i>filters
										</button>
									</div>
									<div class="table-data__tool-right">
										<button class="au-btn au-btn-icon au-btn--green au-btn--small">
											<i class="zmdi zmdi-plus"></i>add
										</button>
										<div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
											<select class="js-select2" name="type">
												<option selected="selected">Export</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th><label class="au-checkbox"> <input
														type="checkbox" /> <span class="au-checkmark"></span>
												</label></th>
												<th>no</th>
												<th>title</th>
												<th>description</th>
												<th>lecturer</th>
											</tr>
										</thead>
										<tbody>
											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" /> <span class="au-checkmark"></span>
												</label></td>
												<td>1</td>
												<td>Java Web 1</td>
												<td>Some thing here</td>
												<td>Rum dep trai</td>
												<td>
													<div class="table-data-feature">
														<button class="item m-l-25" data-toggle="tooltip"
															data-placement="top" title="View on page">
															<i class="zmdi zmdi-search"></i>
														</button>
														<button class="item" data-toggle="tooltip"
															data-placement="top" title="Edit">
															<i class="zmdi zmdi-edit"></i>
														</button>
													</div>
												</td>
											</tr>
											<tr class="spacer"></tr>

											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" /> <span class="au-checkmark"></span>
												</label></td>
												<td>1</td>
												<td>Java Web 1</td>
												<td>Some thing here</td>
												<td>Rum dep trai</td>
												<td>
													<div class="table-data-feature">
														<button class="item m-l-25" data-toggle="tooltip"
															data-placement="top" title="View on page">
															<i class="zmdi zmdi-search"></i>
														</button>
														<button class="item" data-toggle="tooltip"
															data-placement="top" title="Edit">
															<i class="zmdi zmdi-edit"></i>
														</button>
													</div>
												</td>
											</tr>
											<tr class="spacer"></tr>

											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" /> <span class="au-checkmark"></span>
												</label></td>
												<td>1</td>
												<td>Java Web 1</td>
												<td>Some thing here</td>
												<td>Rum dep trai</td>
												<td>
													<div class="table-data-feature">
														<button class="item m-l-25" data-toggle="tooltip"
															data-placement="top" title="View on page">
															<i class="zmdi zmdi-search"></i>
														</button>
														<button class="item" data-toggle="tooltip"
															data-placement="top" title="Edit">
															<i class="zmdi zmdi-edit"></i>
														</button>
													</div>
												</td>
											</tr>
											<tr class="spacer"></tr>

											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" /> <span class="au-checkmark"></span>
												</label></td>
												<td>1</td>
												<td>Java Web 1</td>
												<td>Some thing here</td>
												<td>Rum dep trai</td>
												<td>
													<div class="table-data-feature">
														<button class="item m-l-25" data-toggle="tooltip"
															data-placement="top" title="View on page">
															<i class="zmdi zmdi-search"></i>
														</button>
														<button class="item" data-toggle="tooltip"
															data-placement="top" title="Edit">
															<i class="zmdi zmdi-edit"></i>
														</button>
													</div>
												</td>
											</tr>
											<tr class="spacer"></tr>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
						<%@ include file="/jsp/fragments/admin-footer.jsp"%>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
			<!-- END PAGE CONTAINER -->
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
