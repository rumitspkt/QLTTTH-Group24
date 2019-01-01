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
	<section class="home_banner_area blog_banner">
		<div class="banner_inner d-flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="blog_b_text text-center">
					<h2>Add yourself to your knowledge</h2>
					<p>With our lecturer's posts, you can learn better with your
						course, always free</p>
					<a class="main_btn" href="#">View More</a>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="categories_post">
						<img src="images/blog/cat-post/cat-android.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a
									href="${pageContext.request.contextPath}/post?category=${mainCate1.id}"><h5>${mainCate1.title}</h5></a>
								<div class="border_line"></div>
								<p>${mainCate1.description}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="categories_post">
						<img src="images/blog/cat-post/cat-ios.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a
									href="${pageContext.request.contextPath}/post?category=${mainCate2.id}"><h5>${mainCate2.title}</h5></a>
								<div class="border_line"></div>
								<p>${mainCate2.description}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="categories_post">
						<img src="images/blog/cat-post/cat-web.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a
									href="${pageContext.request.contextPath}/post?category=${mainCate3.id}"><h5>${mainCate3.title}</h5></a>
								<div class="border_line"></div>
								<p>${mainCate3.title}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">

						<c:forEach items="${posts}" var="post">
							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<div class="post_tag">
											<a class="active" href="#">${post.category}</a>
										</div>
										<ul class="blog_meta list">
											<li><a href="#">${post.lecturerName}<i
													class="lnr lnr-user"></i></a></li>
											<li><a href="#">${post.date}<i
													class="lnr lnr-calendar-full"></i></a></li>
											<li><a href="#">${post.views} Views<i
													class="lnr lnr-eye"></i></a></li>
											<li><a href="#">0 Comments<i class="lnr lnr-bubble"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<img src="${post.posterUrl}" alt="${post.title}">
										<div class="blog_details">
											<a
												href="${pageContext.request.contextPath}/post?id=${post.id}"><h2>${post.title}</h2></a>
											<p>${post.summary}</p>
											<a
												href="${pageContext.request.contextPath}/post?id=${post.id}"
												class="white_bg_btn">View More</a>
										</div>
									</div>
								</div>
							</article>
						</c:forEach>





						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
								<li class="page-item active"><a href="#" class="page-link">01</a></li>
								<li class="page-item"><a href="#" class="page-link">02</a></li>
								<li class="page-item"><a href="#" class="page-link">03</a></li>
								<li class="page-item"><a href="#" class="page-link">04</a></li>
								<li class="page-item"><a href="#" class="page-link">09</a></li>
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</ul>
						</nav>
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