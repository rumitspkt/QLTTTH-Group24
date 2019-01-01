<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.PNG" type="image/png">

<%@ include file="/jsp/fragments/page-declare-top.jsp"%>

<!-- custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
</head>
<body>

	<!--================Header Menu Area =================-->
	<%@ include file="/jsp/fragments/page-header-menu.jsp"%>
	<!--================Header Menu Area =================-->

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>Course: ${course.title}</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Course Details Area =================-->
	<section class="course_details_area p_120">
		<div class="container">
			<div class="row course_details_inner">
				<div class="col-lg-8">
					<div class="c_details_img">
						<img class="img-fluid" src="${course.posterUrl}"
							alt="">
					</div>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">Objectives</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">Eligibility</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">Course Outline</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							id="comments-tab" data-toggle="tab" href="#comments" role="tab"
							aria-controls="comments" aria-selected="false">Comments</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade  show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="objctive_text">${course.objective}</div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="objctive_text">${course.eligibility}</div>
						</div>
						<div class="tab-pane fade" id="contact" role="tabpanel"
							aria-labelledby="contact-tab">
							<div class="objctive_text">${course.outline}</div>
						</div>
						<div class="tab-pane fade" id="comments"
							role="tabpanel" aria-labelledby="comments-tab">
							<div class="comments-area">
								<h4>05 Comments</h4>
								<div class="comment-list">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="${pageContext.request.contextPath}/images/blog/c1.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
												<p class="comment">Never say goodbye till the end comes!
												</p>
											</div>
										</div>
										<div class="reply-btn">
											<a href="" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
								<div class="comment-list left-padding">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="${pageContext.request.contextPath}/images/blog/c2.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Elsie Cunningham</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
												<p class="comment">Never say goodbye till the end comes!
												</p>
											</div>
										</div>
										<div class="reply-btn">
											<a href="" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
								<div class="comment-list">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="thumb">
												<img src="${pageContext.request.contextPath}/images/blog/c5.jpg" alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">Ina Hayes</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
												<p class="comment">Never say goodbye till the end comes!
												</p>
											</div>
										</div>
										<div class="reply-btn">
											<a href="" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
							</div>
							<div class="comment-form">
								<h4>Leave a Reply</h4>
								<form>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="3" name="message"
											placeholder="Messege" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<a href="#" class="primary-btn submit_btn">Post Comment</a>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="c_details_list">
						<ul class="list">
							<li><a href="#">Trainer’s Name <span>${course.lecturerName}</span></a></li>
							<li><a href="#">Course Fee <span>${course.fee}$</span></a></li>
							<li><a href="#">Available Seats <span>${course.availableSeat}/${course.totalSeat}</span></a></li>
							<li><a href="#">Schedule <span>${course.schedules}</span></a></li>
						</ul>
						<form action="${pageContext.request.contextPath}/course/enroll" method="post">
							<input name="course" value="${course.id}" hidden="hidden" />
							<input class="main_btn" type="submit" value="Enroll the Course" />
						</form> 
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Course Details Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>