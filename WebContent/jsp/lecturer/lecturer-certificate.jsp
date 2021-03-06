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
									<h2 class="title-1">Certificates</h2>

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
											action="${pageContext.request.contextPath}/lecturer/certificate"
											method="get" class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="course"
												onchange="this.form.submit()">
												<c:choose>
													<c:when test="${selected == 0}">
														<option value="0" selected="selected">Courses</option>
													</c:when>
													<c:otherwise>
														<option value="0">Courses</option>
													</c:otherwise>
												</c:choose>

												<c:forEach items="${courses}" var="course">
													<c:choose>
														<c:when test="${course.id == selected}">
															<option selected="selected" value="${course.id}">${course.title}</option>
														</c:when>
														<c:otherwise>
															<option value="${course.id}">${course.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
											<div class="dropDownSelect2"></div>
										</form>
									</div>
									<div class="table-data__tool-right">
										<div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
											<select class="js-select2" name="type">
												<option selected="selected">Export</option>
												<option value="">Exel</option>
												<option value="">Raw</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>full name</th>
												<th>enrolled date</th>
												<th>certificate</th>
												<th>received date</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${certificates}" var="certificate">
												<tr class="tr-shadow model-row" modelId="${certificate.userId}">
													<td class="model-fullName">${certificate.firstName}
														${certificate.lastName}</td>
													<td class="model-enrolledDate">${certificate.enrolledDate}</td>

													<c:choose>
														<c:when test="${certificate.certificateId == 0}">
															<td class="model-title"><span class="status--denied">Not
																	approved</span></td>
														</c:when>
														<c:otherwise>
															<td class="model-title"><span
																class="status--process">${certificate.title}</span></td>
														</c:otherwise>
													</c:choose>

													<td class="model-receivedCertificateDate">${certificate.receivedCertificateDate}</td>
													<td class="model-firstScore" hidden="hidden">${certificate.firstScore}</td>
													<td class="model-secondScore" hidden="hidden">${certificate.secondScore}</td>
													<td class="model-certificateId" hidden="hidden">${certificate.certificateId}</td>
													<td class="model-enrollment" hidden="hidden">${certificate.enrollment}</td>
													<td>
														<div class="table-data-feature">
															<button modelId="${certificate.userId}" class="item btn-edit"
																data-toggle="modal" data-target="#editModal"
																data-placement="top" title="Approve">
																<i class="zmdi zmdi-assignment"></i>
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
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">Certificate</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="editModal"
							action="${pageContext.request.contextPath}/lecturer/certificate/approve"
							method="post" class="">
							<div class="modal-body">
								<input name="enrollment" id="enrollment" hidden="hidden" /> <input
									name="course" value="${selected}" hidden="hidden" />
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"> <span id="fullName"></span></i>
										</div>
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-6">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-check-circle"> First Score</i>
											</div>
											<input type="number" step="0.1" id="firstScore" disabled="disabled"
												name="firstScore" placeholder="First Score"
												class="form-control" />
										</div>
									</div>

									<div class="col col-md-6">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-check-circle"> Second Score</i>
											</div>
											<input type="number" step="0.1" id="secondScore" disabled="disabled"
												name="secondScore" placeholder="Second Score"
												class="form-control" />
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-9">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-bars"> Select Certificate</i>
												</div>
												<select name="certificate" id="certificate"
													class="form-control">
													<c:forEach items="${typeOfCertificates}" var="type">
														<option value="${type.id}">${type.title}</option>
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
								<button type="submit" class="btn btn-primary">Approve</button>
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
		src="${pageContext.request.contextPath}/js/custom/lecturer-certificate.js"></script>
</body>
</html>
<!-- end document -->
