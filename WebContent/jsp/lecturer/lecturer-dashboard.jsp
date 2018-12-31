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
<title>Dashboard</title>

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
						<div class="row">
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">overview</h2>
									<!--
                      <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add item
                      </button>
                    -->
								</div>
							</div>
						</div>
						<div class="row m-t-25">
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c1">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-account-o"></i>
											</div>
											<div class="text">
												<h2>${info.enrolledStudents}</h2>
												<span>enrolled students</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart1"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c2">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-edit"></i>
											</div>
											<div class="text">
												<h2>${info.posts}</h2>
												<span>posts</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart2"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c3">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-calendar-note"></i>
											</div>
											<div class="text">
												<h2>${info.grantedCertificates}</h2>
												<span>granted certificates</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart3"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c4">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-money"></i>
											</div>
											<div class="text">
												<h2>${info.totalEarnings}</h2>
												<span>total earnings</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart4"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-8">
								<div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
									<div class="au-card-title"
										style="background-image: url('images/bg-title-01.jpg');">
										<div class="bg-overlay bg-overlay--blue"></div>
										<h3>
											<i class="zmdi zmdi-account-calendar"></i>Todos
										</h3>
										<button class="au-btn-plus">
											<i class="zmdi zmdi-plus"></i>
										</button>
									</div>
									<div class="au-task js-list-load">
										<div class="au-task__title">
											<p>Tasks for ${sessionScope.user.firstName}
												${sessionScope.user.lastName}</p>
										</div>
										<div class="au-task-list js-scrollbar3">
											<div class="au-task__item au-task__item--danger">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for class</a>
													</h5>
													<span class="time">10:00 AM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--warning">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Create new task for Dashboard</a>
													</h5>
													<span class="time">11:00 AM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--primary">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for class</a>
													</h5>
													<span class="time">02:00 PM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--success">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Create new post</a>
													</h5>
													<span class="time">03:30 PM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--danger js-load-item">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for Android Lecturer</a>
													</h5>
													<span class="time">10:00 AM</span>
												</div>
											</div>
											<div
												class="au-task__item au-task__item--warning js-load-item">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Approve student </a>
													</h5>
													<span class="time">11:00 AM</span>
												</div>
											</div>
										</div>
										<div class="au-task__footer">
											<button class="au-btn au-btn-load js-load-btn">load
												more</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<!-- TASK PROGRESS -->
								<div class="task-progress">
									<h3 class="title-3">task progress</h3>
									<div class="au-skill-container">
										<div class="au-progress">
											<span class="au-progress__title">Approve student</span>
											<div class="au-progress__bar">
												<div class="au-progress__inner js-progressbar-simple"
													role="progressbar" data-transitiongoal="90">
													<span class="au-progress__value js-value"></span>
												</div>
											</div>
										</div>
										<div class="au-progress">
											<span class="au-progress__title">Create post</span>
											<div class="au-progress__bar">
												<div class="au-progress__inner js-progressbar-simple"
													role="progressbar" data-transitiongoal="85">
													<span class="au-progress__value js-value"></span>
												</div>
											</div>
										</div>
										<div class="au-progress">
											<span class="au-progress__title">Score</span>
											<div class="au-progress__bar">
												<div class="au-progress__inner js-progressbar-simple"
													role="progressbar" data-transitiongoal="95">
													<span class="au-progress__value js-value"></span>
												</div>
											</div>
										</div>
										<div class="au-progress">
											<span class="au-progress__title">Reply comment</span>
											<div class="au-progress__bar">
												<div class="au-progress__inner js-progressbar-simple"
													role="progressbar" data-transitiongoal="95">
													<span class="au-progress__value js-value"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- END TASK PROGRESS -->
							</div>
						</div>
						<%@ include file="/jsp/fragments/admin-footer.jsp"%>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
			<!-- END PAGE CONTAINER -->
			<div class="modal fade" id="showModal" tabindex="-1" role="dialog"
				aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">Message</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="showModal" action="" method="post" class="">
							<div class="modal-body">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-font"> Name</i>
										</div>
										<input type="text" id="senderName" name="senderName"
											placeholder="Name" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-align-left"> Email Or Phone</i>
										</div>
										<input type="text" id="emailOrPhone" name="emailOrPhone"
											placeholder="Email Or Phone" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-bookmark"> Subject</i>
										</div>
										<input type="text" id="subject" name="subject"
											placeholder="Subject" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-location-arrow"> Content</i>
										</div>
										<textarea name="content" id="content" rows="10"
											placeholder="Content" class="form-control"></textarea>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
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
