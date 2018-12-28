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
<title>Post Categories</title>

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
									<h2 class="title-1">Posts</h2>

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
										<form action="${pageContext.request.contextPath}/admin/post"
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
									<div class="table-data__tool-right"></div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>id</th>
												<th>title</th>
												<th>category</th>
												<th>lecturer</th>
												<th>date upload</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${posts}" var="post">
												<tr class="tr-shadow model-row">
													<td class="model-id">${post.id}</td>
													<td class="model-title">${post.title}</td>
													<td class="model-category">${post.category}</td>
													<td class="model-lecturerName">${post.lecturerName}</td>
													<td class="model-date">${post.date}</td>
													<td>
														<form
															action="${pageContext.request.contextPath}/admin/post/approve"
															method="post">
															<div class="table-data-feature">
																<input name="id" value="${post.id}" hidden="hidden" />
																<button type="button" class="item" data-placement="top"
																	title="Preview" data-toggle="modal"
																	data-target="#scrollmodal">
																	<i class="zmdi zmdi-search"></i>
																</button>
																<button type="submit" name="accept" value="accept"
																	class="btn btn-outline-success btn-sm m-l-50">
																	<i class="fa fa-dot-circle-o"></i>&nbsp; Accept
																</button>
																<button type="submit" name="decline" value="decline"
																	class="btn btn-outline-danger btn-sm m-l-25">
																	<i class="fa fa-ban"></i>&nbsp; Decline
																</button>
															</div>
														</form>
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
			<!-- modal scroll -->
			<div class="modal fade" id="scrollmodal" tabindex="-1" role="dialog"
				aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">Scrolling Long
								Content Modal</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>
								Cras mattis consectetur purus sit amet fermentum. Cras justo
								odio, dapibus ac facilisis in, egestas eget quam. Morbi leo
								risus, porta ac consectetur ac, vestibulum at eros. <br>
								Praesent commodo cursus magna, vel scelerisque nisl consectetur
								et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus
								dolor auctor. <br> Aenean lacinia bibendum nulla sed
								consectetur. Praesent commodo cursus magna, vel scelerisque nisl
								consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
								metus auctor fringilla. <br> Cras mattis consectetur purus
								sit amet fermentum. Cras justo odio, dapibus ac facilisis in,
								egestas eget quam. Morbi leo risus, porta ac consectetur ac,
								vestibulum at eros. <br> Praesent commodo cursus magna, vel
								scelerisque nisl consectetur et. Vivamus sagittis lacus vel
								augue laoreet rutrum faucibus dolor auctor. <br> Aenean
								lacinia bibendum nulla sed consectetur. Praesent commodo cursus
								magna, vel scelerisque nisl consectetur et. Donec sed odio dui.
								Donec ullamcorper nulla non metus auctor fringilla. <br>
								Cras mattis consectetur purus sit amet fermentum. Cras justo
								odio, dapibus ac facilisis in, egestas eget quam. Morbi leo
								risus, porta ac consectetur ac, vestibulum at eros. <br>
								Praesent commodo cursus magna, vel scelerisque nisl consectetur
								et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus
								dolor auctor. <br> Aenean lacinia bibendum nulla sed
								consectetur. Praesent commodo cursus magna, vel scelerisque nisl
								consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
								metus auctor fringilla. <br> Cras mattis consectetur purus
								sit amet fermentum. Cras justo odio, dapibus ac facilisis in,
								egestas eget quam. Morbi leo risus, porta ac consectetur ac,
								vestibulum at eros. <br> Praesent commodo cursus magna, vel
								scelerisque nisl consectetur et. Vivamus sagittis lacus vel
								augue laoreet rutrum faucibus dolor auctor. <br> Aenean
								lacinia bibendum nulla sed consectetur. Praesent commodo cursus
								magna, vel scelerisque nisl consectetur et. Donec sed odio dui.
								Donec ullamcorper nulla non metus auctor fringilla. <br>
								Cras mattis consectetur purus sit amet fermentum. Cras justo
								odio, dapibus ac facilisis in, egestas eget quam. Morbi leo
								risus, porta ac consectetur ac, vestibulum at eros. <br>
								Praesent commodo cursus magna, vel scelerisque nisl consectetur
								et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus
								dolor auctor. <br> Aenean lacinia bibendum nulla sed
								consectetur. Praesent commodo cursus magna, vel scelerisque nisl
								consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
								metus auctor fringilla. <br> Cras mattis consectetur purus
								sit amet fermentum. Cras justo odio, dapibus ac facilisis in,
								egestas eget quam. Morbi leo risus, porta ac consectetur ac,
								vestibulum at eros. <br> Praesent commodo cursus magna, vel
								scelerisque nisl consectetur et. Vivamus sagittis lacus vel
								augue laoreet rutrum faucibus dolor auctor. <br> Aenean
								lacinia bibendum nulla sed consectetur. Praesent commodo cursus
								magna, vel scelerisque nisl consectetur et. Donec sed odio dui.
								Donec ullamcorper nulla non metus auctor fringilla.
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary">Confirm</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end modal scroll -->
			
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
