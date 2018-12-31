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
<title>Score results</title>

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
									<h2 class="title-1">Score results</h2>

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
											action="${pageContext.request.contextPath}/lecturer/score"
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
												<th>first score</th>
												<th>second score</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${scores}" var="score">
												<tr class="tr-shadow model-row" modelId="${score.id}">
													<td class="model-fullName">${score.firstName}
														${score.lastName}</td>
													<td class="model-firstScore">${score.firstScore}</td>
													<td class="model-secondScore">${score.secondScore}</td>
													<td class="model-enrollment" hidden="hidden">${score.enrollment}</td>
													<td>
														<div class="table-data-feature">
															<button modelId="${score.id}" class="item btn-edit"
																data-toggle="modal" data-target="#editModal"
																data-placement="top" title="Edit">
																<i class="zmdi zmdi-border-color"></i>
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
							<h5 class="modal-title" id="scrollmodalLabel">Score</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="editModal"
							action="${pageContext.request.contextPath}/lecturer/score/edit"
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
											<input type="number" step="0.1" id="firstScore"
												name="firstScore" placeholder="First Score"
												class="form-control" />
										</div>
									</div>

									<div class="col col-md-6">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-check-circle"> Second Score</i>
											</div>
											<input type="number" step="0.1" id="secondScore"
												name="secondScore" placeholder="Second Score"
												class="form-control" />
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
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
	<!-- custom JS -->
	<script
		src="${pageContext.request.contextPath}/js/custom/lecturer-score.js"></script>
</body>
</html>
<!-- end document -->
