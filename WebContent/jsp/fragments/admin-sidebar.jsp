<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/"> <img src="${pageContext.request.contextPath}/images/icon/logo.png" alt="Techacademy" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li class="active"><a href="${pageContext.request.contextPath}/admin/dashboard"> <i
						class="fas fa-tachometer-alt"></i>Dashboard
				</a></li>
				<li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-file"></i>Page
				</a>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li><a href="${pageContext.request.contextPath}/admin/page/event">Event</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/page/about">About</a></li>
					</ul></li>
				<li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-edit"></i>Post
				</a>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li><a href="${pageContext.request.contextPath}/admin/post/category">Categories</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/post/approve">Approve posts</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/admin/course"> <i
						class="fas fa-calendar-o"></i>Course
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/certificate"> <i
						class="fas fa-book"></i>Certificate
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/notification"> <i
						class="fas fa-bell"></i>Notification
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/account"> <i
						class="fas fa-users"></i>Account
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/message"> <i
						class="fas fa-envelope"></i>Message
				</a></li>
			</ul>
		</nav>
	</div>
</aside>