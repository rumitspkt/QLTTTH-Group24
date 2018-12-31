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
										<form action="${pageContext.request.contextPath}/admin/course"
											method="get" class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="category"
												onchange="this.form.submit()">
												<c:choose>
													<c:when test="${selected == 0}">
														<option value="0" selected="selected">Categories</option>
													</c:when>
													<c:otherwise>
														<option value="0">Categories</option>
													</c:otherwise>
												</c:choose>

												<c:forEach items="${categories}" var="category">
													<c:choose>
														<c:when test="${category.id == selected}">
															<option selected="selected" value="${category.id}">${category.title}</option>
														</c:when>
														<c:otherwise>
															<option value="${category.id}">${category.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
											<div class="dropDownSelect2"></div>
										</form>
									</div>
									<div class="table-data__tool-right">
										<button id="btn-add"
											class="au-btn au-btn-icon au-btn--green au-btn--small"
											data-toggle="modal" data-target="#addModal">
											<i class="zmdi zmdi-plus"></i>add
										</button>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>id</th>
												<th>title</th>
												<th>category</th>
												<th>lecturer</th>
												<th>available seat</th>
												<th>total seat</th>
												<th>date upload</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${courses}" var="course">
												<tr class="tr-shadow model-row" modelId="${course.id}">
													<td class="model-id">${course.id}</td>
													<td class="model-title">${course.title}</td>
													<td class="model-category">${course.category}</td>
													<td class="model-lecturerName">${course.lecturerName}</td>
													<td class="model-availableSeat">${course.availableSeat}</td>
													<td class="model-totalSeat">${course.totalSeat}</td>
													<td class="model-date">${course.date}</td>
													<td hidden="hidden" class="model-objective">${course.objective}</td>
													<td hidden="hidden" class="model-shortDescription">${course.shortDescription}</td>
													<td hidden="hidden" class="model-eligibility">${course.eligibility}</td>
													<td hidden="hidden" class="model-schedules">${course.schedules}</td>
													<td hidden="hidden" class="model-lecturer">${course.lecturer}</td>
													<td hidden="hidden" class="model-fee">${course.fee}</td>
													<td hidden="hidden" class="model-outline">${course.outline}</td>
													<td hidden="hidden" class="model-categoryId">${course.categoryId}</td>
													<td>
														<div class="table-data-feature">
															<button modelId="${course.id}" class="button btn-edit"
																data-placement="top" title="Edit" data-toggle="modal"
																data-target="#editModal">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button modelId="${course.id}"
																class="button btn-delete m-l-25" data-placement="top"
																title="Delete" data-toggle="modal"
																data-target="#deleteModal">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr class="spacer"></tr>
											</c:forEach>

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
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
				aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">Add New Course</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="${pageContext.request.contextPath}/admin/course/new"
							method="post" class="">
							<div class="modal-body">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-font"></i>
										</div>
										<input type="text" id="title" name="title" placeholder="Title"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-align-left"></i>
										</div>
										<input type="text" id="shortDescription"
											name="shortDescription" placeholder="Short Description"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-rocket"></i>
										</div>
										<input type="text" id="objective" name="objective"
											placeholder="Objective" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-key"></i>
										</div>
										<input type="text" id="eligibility" name="eligibility"
											placeholder="Eligibility" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-location-arrow"></i>
										</div>
										<textarea name="outline" id="outline" rows="10"
											placeholder="Outline" class="form-control"></textarea>
									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="schedules" name="schedules"
													placeholder="Schedules" class="form-control">
											</div>
										</div>

									</div>
									<div class="col-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-users"></i>
												</div>
												<input type="number" id="totalSeat" name="totalSeat"
													placeholder="Total Seat" class="form-control">
											</div>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-user"></i>
												</div>
												<select name="lecturer" id="lecturer"
													class="form-control">
													<option value="0">Select Lecturer</option>
													<c:forEach items="${lecturers}" var="lecturer">
														<option value="${lecturer.id}">${lecturer.firstName}
															${lecturer.lastName}</option>
													</c:forEach>
												</select>
											</div>
										</div>

									</div>
									<div class="col-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-usd"></i>
												</div>
												<input type="number" step="0.01" id="fee" name="fee" placeholder="Fee"
													class="form-control">
											</div>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-bars"></i>
												</div>
												<select name="categoryId" id="categoryId"
													class="form-control">
													<option value="0">Select Category</option>
													<c:forEach items="${categories}" var="category">
														<option value="${category.id}">${category.title}</option>
													</c:forEach>
												</select>
											</div>
										</div>

									</div>
								</div>



							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">Edit Course</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="editModal"
							action="${pageContext.request.contextPath}/admin/course/edit"
							method="post" class="">
							<div class="modal-body">
							<input id="id" name="id" hidden="hidden">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-font"></i>
										</div>
										<input type="text" id="title" name="title" placeholder="Title"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-align-left"></i>
										</div>
										<input type="text" id="shortDescription"
											name="shortDescription" placeholder="Short Description"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-rocket"></i>
										</div>
										<input type="text" id="objective" name="objective"
											placeholder="Objective" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-key"></i>
										</div>
										<input type="text" id="eligibility" name="eligibility"
											placeholder="Eligibility" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-location-arrow"></i>
										</div>
										<textarea name="outline" id="outline" rows="10"
											placeholder="Outline" class="form-control"></textarea>
									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" id="schedules" name="schedules"
													placeholder="Schedules" class="form-control">
											</div>
										</div>

									</div>
									<div class="col-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-users"></i>
												</div>
												<input type="number" id="totalSeat" name="totalSeat"
													placeholder="Total Seat" class="form-control">
											</div>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-user"></i>
												</div>
												<select name="lecturer" id="lecturer"
													class="form-control-sm form-control">
													<option value="0">Select Lecturer</option>
													<c:forEach items="${lecturers}" var="lecturer">
														<option value="${lecturer.id}">${lecturer.firstName}
															${lecturer.lastName}</option>
													</c:forEach>
												</select>
											</div>
										</div>

									</div>
									<div class="col-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-usd"></i>
												</div>
												<input type="number" step="0.01" id="fee" name="fee" placeholder="Fee"
													class="form-control">
											</div>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-bars"></i>
												</div>
												<select name="categoryId" id="categoryId"
													class="form-control-sm form-control">
													<option value="0">Select Category</option>
													<c:forEach items="${categories}" var="category">
														<option value="${category.id}">${category.title}</option> 
													</c:forEach>
												</select>
											</div>
										</div>

									</div>
								</div>



							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Edit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end modal scroll -->
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
				aria-labelledby="mediumModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="mediumModalLabel">Confirm delete</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="deleteModal"
							action="${pageContext.request.contextPath}/admin/course/delete"
							method="post" class="">
							<div class="modal-body">Do you want to delete this course?</div>
							<input hidden type="text" id="id" name="id" class="form-control">
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Confirm</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
	<!-- custom JS -->
	<script
		src="${pageContext.request.contextPath}/js/custom/admin-courses.js"></script>
</body>
</html>
<!-- end document -->
