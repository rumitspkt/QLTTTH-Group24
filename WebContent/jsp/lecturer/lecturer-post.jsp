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
<title>Post</title>

<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE -->
		<%@ include file="/jsp/fragments/lecturer-header-mobile.jsp"%>
		<!-- END HEADER MOBILE -->

		<!-- MENU SIDEBAR -->
		<%@ include file="/jsp/fragments/lecturer-sidebar.jsp"%>
		<!-- END MENU SIDEBAR -->

		<!-- PAGE CONTAINER -->
		<div class="page-container">
			<!-- HEADER DESKTOP -->
			<%@ include file="/jsp/fragments/lecturer-header-desktop.jsp"%>
			<!-- HEADER DESKTOP -->

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-b-35">
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">Posts</h2>

									<!-- <button class="au-btn au-btn-icon au-btn--blue">
                      <i class="zmdi zmdi-plus"></i>add
                    </button> -->
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
											action="${pageContext.request.contextPath}/lecturer/post"
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
										<button class="au-btn au-btn-icon au-btn--green au-btn--small"
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
												<th>views</th>
												<th>date upload</th>
												<th>status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${posts}" var="post">
												<c:choose>
													<c:when test="${post.lecturer == sessionScope.user.id}">
														<tr class="tr-shadow model-row">
															<td class="model-id">${post.id}</td>
															<td class="model-title">${post.title}</td>
															<td class="model-category">${post.category}</td>
															<td class="model-lecturerName">${post.views}</td>
															<td class="model-date">${post.date}</td>
															<td class="model-status">${post.status}</td>
														</tr>
														<tr class="spacer"></tr>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>

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
							<h5 class="modal-title" id="scrollmodalLabel">Add New Post</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form
							action="${pageContext.request.contextPath}/lecturer/post/new"
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
										<input type="text" id="summary" name="summary"
											placeholder="Summary" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-rocket"></i>
										</div>
										<input type="text" id="posterUrl" name="posterUrl"
											placeholder="Link Poster Image" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-location-arrow"></i>
										</div>
										<textarea name="content" id="content" rows="10"
											placeholder="Content" class="form-control"></textarea>
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
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
