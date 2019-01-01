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
			<c:forEach items="${courses}" var="course" step="5" varStatus="loop">
				<div class="row courses_inner mb-2">
					<div class="col-lg-9">
						<div class="grid_inner">
							<div class="grid_item wd55">
								<div class="courses_item">
									<img class="center-cropped"
										src="${courses[loop.index].posterUrl}"
										alt="${courses[loop.index].title}">
									<div class="hover_text">
										ƒ <a class="cat" href="#">Hot</a> <a
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
										<a class="cat" href="#">Hot</a> <a
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
										<a class="cat" href="#">Hot</a> <a href="${pageContext.request.contextPath}/course?id=${courses[loop.index + 2].id}"><h4>${courses[loop.index + 2].title}</h4></a>
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
										<a class="cat" href="#">Hot</a> <a href="${pageContext.request.contextPath}/course?id=${courses[loop.index + 3].id}"><h4>${courses[loop.index + 3].title}</h4></a>
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
								<a class="cat" href="#">Hot</a> <a href="${pageContext.request.contextPath}/course?id=${courses[loop.index + 4].id}"><h4>${courses[loop.index + 4].title}</h4></a>
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

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>