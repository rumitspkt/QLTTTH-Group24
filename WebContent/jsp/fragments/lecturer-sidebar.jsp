<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/"> <img
			src="${pageContext.request.contextPath}/images/icon/logo.png"
			alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li class="active"><a
					href="${pageContext.request.contextPath}/lecturer"> <i
						class="fas fa-tachometer-alt"></i>Dashboard
				</a></li>
				<li><a href="${pageContext.request.contextPath}/lecturer/post">
						<i class="fas fa-edit"></i>Post
				</a></li>
				<li><a href="${pageContext.request.contextPath}/lecturer/score">
						<i class="fas fa-calendar-o"></i>Score results
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/lecturer/certificate">
						<i class="fas fa-book"></i>Certificates
				</a></li>
			</ul>
		</nav>
	</div>
</aside>