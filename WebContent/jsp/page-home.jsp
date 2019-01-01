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
	<section class="home_banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h3>
						We Ensure better education <br />for a better world
					</h3>
					<p>In the history of modern astronomy, there is probably no one
						greater leap forward than the building and launch of the space
						telescope known as the Hubble.</p>
					<a class="main_btn"
						href="${pageContext.request.contextPath}/course">Get Started</a>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Finance Area =================-->
	<section class="finance_area">
		<div class="container">
			<div class="finance_inner row">
				<div class="col-lg-3 col-sm-6">
					<div class="finance_item">
						<div class="media">
							<div class="d-flex">
								<i class="lnr lnr-rocket"></i>
							</div>
							<div class="media-body">
								<h5>
									Science & <br />Engineering
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="finance_item">
						<div class="media">
							<div class="d-flex">
								<i class="lnr lnr-earth"></i>
							</div>
							<div class="media-body">
								<h5>
									Science & <br />Engineering
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="finance_item">
						<div class="media">
							<div class="d-flex">
								<i class="lnr lnr-smile"></i>
							</div>
							<div class="media-body">
								<h5>
									Science & <br />Engineering
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="finance_item">
						<div class="media">
							<div class="d-flex">
								<i class="lnr lnr-tag"></i>
							</div>
							<div class="media-body">
								<h5>
									Science & <br />Engineering
								</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Finance Area =================-->

	<!--================Courses Area =================-->
	<section class="courses_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Popular Courses</h2>
				<p>With the highest number of students, we hope you will be
					interested in these many courses.</p>
			</div>
			<c:forEach items="${courses}" var="course" step="5" varStatus="loop">
				<div class="row courses_inner">
					<div class="col-lg-9">
						<div class="grid_inner">
							<div class="grid_item wd55">
								<div class="courses_item">
									<img class="center-cropped"
										src="${courses[loop.index].posterUrl}"
										alt="${courses[loop.index].title}">
									<div class="hover_text">
										ƒ <a class="cat" href="#">Popular</a> <a
											href="${pageContext.request.contextPath}/course?id=${courses[loop.index].id}"><h4>${courses[loop.index].title}</h4></a>
										<ul class="list">
											<li><a href="#"><i class="lnr lnr-users"></i>
													${courses[loop.index].availableSeat}</a></li>
											<li><a href="#"><i class="lnr lnr-bubble"></i> 0</a></li>
											<li><a href="#"><i class="lnr lnr-user"></i>
													${courses[loop.index].lecturerName}</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="grid_item wd44">
								<div class="courses_item">
									<img class="center-cropped"
										src="${courses[loop.index + 1].posterUrl}"
										alt="${courses[loop.index + 1].title}">
									<div class="hover_text">
										<a class="cat" href="#">Popular</a> <a
											href="${pageContext.request.contextPath}/course?id=${courses[loop.index + 1].id}"><h4>${courses[loop.index + 1].title}</h4></a>
										<ul class="list">
											<li><a href="#"><i class="lnr lnr-users"></i>
													${courses[loop.index + 1].availableSeat}</a></li>
											<li><a href="#"><i class="lnr lnr-bubble"></i> 0</a></li>
											<li><a href="#"><i class="lnr lnr-user"></i>
													${courses[loop.index + 1].lecturerName}</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="grid_item wd44">
								<div class="courses_item">
									<img class="center-cropped"
										src="${courses[loop.index + 2].posterUrl}"
										alt="${courses[loop.index + 2].title}">
									<div class="hover_text">
										<a class="cat" href="#">Popular</a> <a href="#"><h4>${courses[loop.index + 2].title}</h4></a>
										<ul class="list">
											<li><a href="#"><i class="lnr lnr-users"></i>
													${courses[loop.index + 2].availableSeat}</a></li>
											<li><a href="#"><i class="lnr lnr-bubble"></i> 0</a></li>
											<li><a href="#"><i class="lnr lnr-user"></i>
													${courses[loop.index + 2].lecturerName}</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="grid_item wd55">
								<div class="courses_item">
									<img class="center-cropped"
										src="${courses[loop.index + 3].posterUrl}"
										alt="${courses[loop.index + 3].title}">
									<div class="hover_text">
										<a class="cat" href="#">Popular</a> <a href="#"><h4>${courses[loop.index + 3].title}</h4></a>
										<ul class="list">
											<li><a href="#"><i class="lnr lnr-users"></i>
													${courses[loop.index + 3].availableSeat}</a></li>
											<li><a href="#"><i class="lnr lnr-bubble"></i> 0</a></li>
											<li><a href="#"><i class="lnr lnr-user"></i>
													${courses[loop.index + 3].lecturerName}</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="course_item">
							<img class="center-cropped"
								src="${courses[loop.index + 4].posterUrl}"
								alt="${courses[loop.index + 4].title}">
							<div class="hover_text">
								<a class="cat" href="#">Popular</a> <a href="#"><h4>${courses[loop.index + 4].title}</h4></a>
								<ul class="list">
									<li><a href="#"><i class="lnr lnr-users"></i>
											${courses[loop.index + 4].availableSeat}</a></li>
									<li><a href="#"><i class="lnr lnr-bubble"></i> 0</a></li>
									<li><a href="#"><i class="lnr lnr-user"></i>
											${courses[loop.index + 4].lecturerName}</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>

		</div>
	</section>
	<!--================End Courses Area =================-->

	<!--================Team Area =================-->
	<section class="team_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Meet Our Lecturer</h2>
				<p>With the enthusiastic lecturer team with high professional
					knowledge will help you achieve the best learning results.</p>
			</div>
			<div class="row team_inner">
				<c:forEach items="${lecturers}" var="lecturer">
					<div class="col-lg-3 col-sm-6">
						<div class="team_item">
							<div class="team_img">
								<img class="rounded-circle" src="${lecturer.urlAvatar}"
									alt="${lecturer.firstName} ${lecturer.lastName}">
								<div class="hover">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-linkedin"></i></a>
								</div>
							</div>
							<div class="team_name">
								<h4>${lecturer.firstName} ${lecturer.lastName}</h4>
								<p>${lecturer.address}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--================End Team Area =================-->

	<!--================Testimonials Area =================-->
	<section class="testimonials_area p_120">
		<div class="container">
			<div class="testi_slider owl-carousel">
				<c:forEach items="${lecturers}" var="lecturer">
					<div class="item">
						<div class="testi_item">
							<img class="rounded-circle" src="${lecturer.urlAvatar}" alt="${lecturer.firstName} ${lecturer.lastName}">
							<h4>${lecturer.firstName} ${lecturer.lastName}</h4>
							<ul class="list">
								<li><a href="#"><i class="fa fa-star"></i></a></li>
								<li><a href="#"><i class="fa fa-star"></i></a></li>
								<li><a href="#"><i class="fa fa-star"></i></a></li>
								<li><a href="#"><i class="fa fa-star"></i></a></li>
								<li><a href="#"><i class="fa fa-star"></i></a></li>
							</ul>
							<p>${lecturer.maxim}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--================End Testimonials Area =================-->

	<!--================Latest Blog Area =================-->
	<section class="latest_blog_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Latest Posts</h2>
				<p>These are articles written by the lecturer to help students have a multidimensional perspective on the lesson, as well as share experiences, best practices so that students can apply to practice in the best way.</p>
			</div>
			<div class="row latest_blog_inner">
			<c:forEach items="${posts}" var="post">
				<div class="col-lg-3 col-md-6">
					<div class="l_blog_item">
						<img class="img-fluid" src="${post.posterUrl}" alt="${post.title}">
						<a class="date" href="#">${post.date} | By ${post.lecturerName}</a> <a href="single-blog.html"><h4>${post.title}</h4></a>
						<p>${post.summary}</p>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	<!--================End Latest Blog Area =================-->

	<!--================Impress Area =================-->
	<section class="impress_area p_120">
		<div class="container">
			<div class="impress_inner text-center">
				<h2>Become an Lecturer</h2>
				<p>There is a moment in the life of any aspiring astronomer that
					it is time to buy that first telescope. It’s exciting to think
					about setting up your own viewing station whether that is on the
					deck</p>
				<a class="main_btn2"
					href="${pageContext.request.contextPath}/contact">Contact us</a>
			</div>
		</div>
	</section>
	<!--================End Impress Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
</body>
</html>