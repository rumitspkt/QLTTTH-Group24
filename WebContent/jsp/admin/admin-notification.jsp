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
<title>Notification</title>

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
									<h2 class="title-1">Notification</h2>

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
										<form
											action="${pageContext.request.contextPath}/admin/notification"
											method="get" class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="priority"
												onchange="this.form.submit()">
												<c:choose>
													<c:when test="${selected == null}">
														<option value="all" selected="selected">Priorities</option>
													</c:when>
													<c:otherwise>
														<option value="all">Priorities</option>
													</c:otherwise>
												</c:choose>

												<c:forEach items="${priorities}" var="priority">
													<c:choose>
														<c:when test="${priority == selected}">
															<option selected="selected" value="${priority}">${priority}</option>
														</c:when>
														<c:otherwise>
															<option value="${priority}">${priority}</option>
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
												<th>content</th>
												<th>priority</th>
												<th>date upload</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${notifications}" var="notification">
												<tr class="tr-shadow model-row" modelId="${notification.id}">
													<td class="model-id">${notification.id}</td>
													<td class="model-title">${notification.title}</td>
													<td class="model-content">${notification.content}</td>
													<td hidden="hidden" class="model-priority">${notification.priority}</td>
													<c:choose>
														<c:when test="${notification.priority == 'LOW'}">
															<td><span class="btn btn-info btn-sm">Low</span></td>
														</c:when>
														<c:when test="${notification.priority == 'MEDIUM'}">
															<td><span class="btn btn-warning btn-sm">Medium</span></td>
														</c:when>
														<c:otherwise>
															<td><span class="btn btn-danger btn-sm">High</span></td>
														</c:otherwise>
													</c:choose>
													<td class="model-date">${notification.date}</td>
													<td>
														<div class="table-data-feature">
															<button modelId="${notification.id}"
																class="button btn-edit" data-placement="top"
																title="Edit" data-toggle="modal"
																data-target="#editModal">
																<i class="zmdi zmdi-edit"></i>
															</button>
															<button modelId="${notification.id}"
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
							<h5 class="modal-title" id="scrollmodalLabel">Add New
								Notification</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="${pageContext.request.contextPath}/admin/notification/new"
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
										<input type="text" id="content"
											name="content" placeholder="Content"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-bell"></i>
											</div>
											<select name="priorityPost" id="priority"
												class="form-control">
												<option>Select Priority</option>
												<option value="LOW">Low</option>
												<option value="MEDIUM">Medium</option>
												<option value="HIGH">High</option>
											</select>
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
							<h5 class="modal-title" id="scrollmodalLabel">Edit Notification</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="editModal" action="${pageContext.request.contextPath}/admin/notification/edit"
							method="post" class="">
							<input hidden="hidden" name="id" id="id" />
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
										<input type="text" id="content"
											name="content" placeholder="Content"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-bell"></i>
											</div>
											<select name="priorityPost" id="priority"
												class="form-control">
												<option>Select Priority</option>
												<option value="LOW">Low</option>
												<option value="MEDIUM">Medium</option>
												<option value="HIGH">High</option>
											</select>
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
							action="${pageContext.request.contextPath}/admin/notification/delete"
							method="post" class="">
							<div class="modal-body">Do you want to delete this notification?</div>
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
		src="${pageContext.request.contextPath}/js/custom/admin-notification.js"></script>
</body>
</html>
<!-- end document -->
