<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header_area">
	<div class="top_menu row m0">
		<div class="container">
			<div class="float-left">
				<ul class="list header_social">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					<li><a href="#"><i class="fa fa-behance"></i></a></li>
				</ul>
			</div>
			<div class="float-right">
				<a class="dn_btn" href="tel:+4400123654896">+84 934 869 973</a> <a
					class="dn_btn" href="mailto:support@colorlib.com">support@techacademy.com</a>
			</div>
		</div>
	</div>
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h"
					href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/images/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="${pageContext.request.contextPath}">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/course">Course</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/score">Score</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/certification">Certification</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/post">Post</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/event">Event</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/about">About</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/contact">Contact</a></li>
						<c:if test="${sessionScope.user != null}">
							<c:choose>
								<c:when
									test="${ (sessionScope.user.type == 'ADMIN') || (sessionScope.user.type == 'SUPER_ADMIN')}">
									<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/admin">Admin</a></li>
								</c:when>
								<c:when test="${sessionScope.user.type == 'LECTURER'}">
									<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/lecturer">Lecturer</a></li>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:if>
					</ul>
					<c:choose>
						<c:when test="${sessionScope.user == null}">
							<a href="${pageContext.request.contextPath}/login"
								class="ml-auto genric-btn info-border circle media">Login |
								Register</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/logout"
								class="ml-auto genric-btn info-border circle media">Logout</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</div>
</header>