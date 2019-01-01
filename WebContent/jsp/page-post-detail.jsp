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
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>Post Detail</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area p_120">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid" src="${post.posterUrl}" alt="">
							</div>
						</div>
						<div class="col-lg-4  col-md-4">
							<div class="blog_info text-right">
								<div class="post_tag">
									<a class="active" href="#">${post.category}</a>

								</div>
								<ul class="blog_meta list">
									<li><a href="#">${post.category}<i
											class="lnr lnr-user"></i></a></li>
									<li><a href="#">${post.date}<i
											class="lnr lnr-calendar-full"></i></a></li>
									<li><a href="#">${post.views}<i class="lnr lnr-eye"></i></a></li>
									<li><a href="#">0 Comments<i class="lnr lnr-bubble"></i></a></li>
								</ul>
								<ul class="social-links">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-github"></i></a></li>
									<li><a href="#"><i class="fa fa-behance"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-8 col-md-8 blog_details">
							<h2>${post.title}</h2>
							<p class="excert">${post.summary}</p>
						</div>
						<div class="col-lg-12">
							<div class="quotes">${post.summary}</div>
							<div class="row">
								<div class="col-lg-12 mt-25">${post.content}</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search Posts"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="${lecturer.urlAvatar}" alt="${lecturer.firstName} ${lecturer.lastName}">
							<h4>${lecturer.firstName} ${lecturer.lastName}</h4>
							<p>Lecturer At Techacademy</p>
							<div class="social_icon">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-github"></i></a> <a href="#"><i
									class="fa fa-behance"></i></a>
							</div>
							<p>${lecturer.maxim}</p>
							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Latest Posts</h3>

							<c:forEach items="${latestPosts}" var="post">
								<div class="media post_item">
									<div>
										<img class="img-thumbnail" src="${post.posterUrl}"
											alt="${post.title}">
									</div>

									<div class="media-body">
										<a
											href="${pageContext.request.contextPath}/post?id=${post.id}"><h3>${post.title}</h3></a>
										<p>${post.date}</p>
									</div>
								</div>
							</c:forEach>


							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Post Categories</h4>
							<ul class="list cat-list">
								<c:forEach items="${categories}" var="category">
									<li><a href="#" class="d-flex justify-content-between">
											<p>${category.title}</p>
											<p>${category.posts}</p>
									</a></li>
								</c:forEach>
							</ul>
							<div class="br"></div>
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
</body>
</html>