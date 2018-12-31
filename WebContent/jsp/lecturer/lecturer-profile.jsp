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
<title>Profile</title>

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
									<h2 class="title-1">Profile</h2>

									<!--
                      <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add
                      </button>
                    -->
								</div>
							</div>
						</div>
						<div class="row m-b-80">
							<div class="col-md-4">
								<div class="row justify-content-around m-b-25">
									<div class="image">
										<a href="#"> <img
											src="${sessionScope.user.urlAvatar}"
											alt="John Doe" />
										</a>
									</div>
								</div>

								<div class="row justify-content-around m-b-25">
									<button type="button" class="btn btn-outline-primary btn-md"
										data-toggle="modal" data-target="#imageModal">
										<i class="fa fa-image"></i>&nbsp; Change Image
									</button>
								</div>

								<div class="row justify-content-around">
									<button type="button" class="btn btn-outline-danger btn-md"
										data-toggle="modal" data-target="#passModal">
										<i class="fa fa-server"></i>&nbsp; Change Password
									</button>
								</div>
							</div>
							<div class="col-md-8">
								<div class="card">
									<div class="card-header">
										<strong>Basic Information</strong>
									</div>
									<form
										action="${pageContext.request.contextPath}/lecturer/profile/edit"
										method="post" class="form-horizontal">
										<div class="card-body card-block">

											<div class="row form-group">
												<div class="col col-md-6">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-user"></i>
														</div>
														<input type="text" id="firstName" name="firstName"
															value="${sessionScope.user.firstName}"
															placeholder="First Name" class="form-control" />
													</div>
												</div>

												<div class="col col-md-6">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-user"></i>
														</div>
														<input type="text" id="lastName" name="lastName"
															value="${sessionScope.user.lastName}"
															placeholder="Last name" class="form-control" />
													</div>
												</div>

											</div>

											<div class="row form-group">
												<div class="col col-md-12">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-address-book"></i>
														</div>
														<input type="text" id="email" name="email"
															value="${sessionScope.user.email}" placeholder="Email"
															class="form-control" />
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-12">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-address-book"></i>
														</div>
														<input type="text" id="maxim" name="maxim"
															value="${sessionScope.user.maxim}" placeholder="Maxim"
															class="form-control" />
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col col-md-12">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-address-book"></i>
														</div>
														<input type="text" id="address" name="address"
															value="${sessionScope.user.address}"
															placeholder="Address" class="form-control" />
													</div>
												</div>
											</div>

										</div>
										<div class="card-footer">
											<button type="submit" class="btn btn-primary btn-sm">
												<i class="fa fa-dot-circle-o"></i> Edit
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<%@ include file="/jsp/fragments/admin-footer.jsp"%>
					</div>
				</div>
				<!-- END MAIN CONTENT -->
				<!-- END PAGE CONTAINER -->
				<div class="modal fade" id="passModal" tabindex="-1" role="dialog"
					aria-labelledby="mediumModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="mediumModalLabel">Change
									Password</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form
								action="${pageContext.request.contextPath}/lecturer/profile/changePassword"
								method="post" class="">
								<div class="modal-body">

									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-asterisk"></i>
											</div>
											<input type="password" id="currentPassword"
												name="currentPassword" placeholder="Current Password"
												class="form-control">
										</div>
									</div>

									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-asterisk"></i>
											</div>
											<input type="password" id="newPassword" name="newPassword"
												placeholder="New Password" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-asterisk"></i>
											</div>
											<input type="password" id="confirmPassword"
												name="confirmPassword" placeholder="Confirm New Password"
												class="form-control">
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Change</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
					aria-labelledby="mediumModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="mediumModalLabel">Change Image</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form
								action="${pageContext.request.contextPath}/lecturer/profile/changeImage"
								method="post" enctype="multipart/form-data">
								<div class="modal-body">
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="file-input" class=" form-control-label">Choose Image </label>
										</div>
										<div class="col-12 col-md-9">
											<input type="file" id="uploadFile" name="uploadFile"
												class="form-control-file">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Change</button>
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
