<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="images/favicon.PNG" type="image/png">

<%@ include file="/jsp/fragments/page-declare-top.jsp"%>

<!-- custom css -->
<link rel="stylesheet" href="css/custom.css">
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
					<h2>Courses</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Courses Area =================-->
	<section class="courses_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Categories</h2>
				<p>All</p>
			</div>
			<div class="row courses_inner">
				<div class="col-lg-9">
					<div class="grid_inner">
						<div class="grid_item wd55">
							<div class="courses_item">
								<img class="center-cropped"
									src="images/courses/course-android.png" alt="">
								<div class="hover_text">
									<a class="cat" href="#">Android</a> <a
										href="course-details.html"><h4>Android Programing
											Basic</h4></a>
									<ul class="list">
										<li><a href="#"><i class="lnr lnr-users"></i> 100</a></li>
										<li><a href="#"><i class="lnr lnr-bubble"></i> 35</a></li>
										<li><a href="#"><i class="lnr lnr-user"></i> D. Alex</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid_item wd44">
							<div class="courses_item">
								<img class="center-cropped" src="images/courses/course-ios.png"
									alt="">
								<div class="hover_text">
									<a class="cat" href="#">IOS</a> <a href="#"><h4>Introduce
											To Apple Developer</h4></a>
									<ul class="list">
										<li><a href="#"><i class="lnr lnr-users"></i> 355</a></li>
										<li><a href="#"><i class="lnr lnr-bubble"></i> 35</a></li>
										<li><a href="#"><i class="lnr lnr-user"></i> T.
												Robert</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid_item wd44">
							<div class="courses_item">
								<img class="center-cropped" src="images/courses/course-jsp.png"
									alt="">
								<div class="hover_text">
									<a class="cat" href="#">Java</a> <a href="#"><h4>Stable
											Web Application With JSP</h4></a>
									<ul class="list">
										<li><a href="#"><i class="lnr lnr-users"></i> 25</a></li>
										<li><a href="#"><i class="lnr lnr-bubble"></i> 5</a></li>
										<li><a href="#"><i class="lnr lnr-user"></i> V. Rum</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="grid_item wd55">
							<div class="courses_item">
								<img class="center-cropped"
									src="images/courses/course-design.jpg" alt="">
								<div class="hover_text">
									<a class="cat" href="#">Design</a> <a href="#"><h4>Advanced
											UX/UI</h4></a>
									<ul class="list">
										<li><a href="#"><i class="lnr lnr-users"></i> 155</a></li>
										<li><a href="#"><i class="lnr lnr-bubble"></i> 25</a></li>
										<li><a href="#"><i class="lnr lnr-user"></i> T. Hieu</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="course_item">
						<img class="center-cropped"
							src="images/courses/course-ethereum.jpeg" alt="">
						<div class="hover_text">
							<a class="cat" href="#">Blockchain</a> <a href="#"><h4>Ethereum
									For Beginner</h4></a>
							<ul class="list">
								<li><a href="#"><i class="lnr lnr-users"></i> 100</a></li>
								<li><a href="#"><i class="lnr lnr-bubble"></i> 10</a></li>
								<li><a href="#"><i class="lnr lnr-user"></i> T. Nguyen</a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--================End Courses Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
</body>
</html>